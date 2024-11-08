using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;

namespace HUNRE
{
    public partial class Student : Form
    {
        // Chuỗi kết nối
        string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        public Student()
        {
            InitializeComponent();
        }

        private void guna2ControlBox2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Student_Load(object sender, EventArgs e)
        {
            // Kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Tạo một đối tượng DataTable để lưu trữ kết quả từ cơ sở dữ liệu
                DataTable dt = new DataTable();

                // Lấy thông tin thí sinh
                // 1. Nhận thông tin Mã sinh viên từ form login thông qua class public
                string maSV = thongtinSV.MaSV;

                // 2. Lấy thông tin sinh viên từ cơ sở dữ liệu
                string sql = "SELECT * FROM SINHVIEN WHERE MaSV = @MaSV";

                // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@MaSV", maSV);

                // Thực thi truy vấn và đổ dữ liệu vào DataTable
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                // Kiểm tra nếu có ít nhất một hàng được trả về từ cơ sở dữ liệu
                if (dt.Rows.Count > 0)
                {
                    // Hiển thị thông tin sinh viên trên giao diện người dùng
                    lbMaSV.Text = dt.Rows[0]["MaSV"].ToString();
                    lbHoTen.Text = dt.Rows[0]["HoDem"].ToString() + " " + dt.Rows[0]["Ten"].ToString();
                    // Lấy ngày tháng năm từ trường NgaySinh và chuyển đổi thành kiểu DateTime
                    DateTime ngaySinh = Convert.ToDateTime(dt.Rows[0]["NgaySinh"]);
                    // Gán giá trị ngày tháng năm vào đối tượng Label
                    lbNgaySinh.Text = ngaySinh.ToShortDateString();
                    lbLop.Text = dt.Rows[0]["Lop"].ToString();
                    lbNganh.Text = dt.Rows[0]["Nganh"].ToString();
                }
                // Hiển thị danh sách môn thi của sinh viên
                DisplayMonThi();
            }
        }

        private void DisplayMonThi()
        {
            // Lấy ngày và giờ hiện tại
            DateTime currentDateTime = DateTime.Now;

            // Kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Lấy thông tin môn thi của sinh viên từ cơ sở dữ liệu
                string sql = "SELECT * FROM MONTHI";

                // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
                SqlCommand cmd = new SqlCommand(sql, connection);

                // Thực thi truy vấn và tạo đối tượng SqlDataReader để đọc dữ liệu
                SqlDataReader reader = cmd.ExecuteReader();

                // Tạo một đối tượng DataTable để lưu trữ kết quả từ cơ sở dữ liệu
                DataTable dt = new DataTable();
                dt.Load(reader);

                // Đóng reader sau khi đã đọc xong dữ liệu
                reader.Close();

                // Duyệt qua từng hàng trong DataTable để tạo và hiển thị các ListMonThi
                foreach (DataRow row in dt.Rows)
                {
                    // Lấy ngày và giờ thi từ cơ sở dữ liệu
                    DateTime ngayThi = Convert.ToDateTime(row["NgayThi"]);
                    TimeSpan gioThi = TimeSpan.Parse(row["GioThi"].ToString());

                    // Kiểm tra nếu NgayThi của Môn thi bằng với ngày hiện tại
                    if (ngayThi.Date == currentDateTime.Date)
                    {
                        TimeSpan gioHienTai = currentDateTime.TimeOfDay; // Lấy giờ hiện tại

                        // So sánh giờ thi với giờ hiện tại
                        if (TimeSpan.Compare(gioThi, gioHienTai) <= 0)
                        {
                            // Giờ thi đã qua
                            // Tạo một ListMonThi mới
                            ListMonThi listMonThi = new ListMonThi();
                            // Gán thông tin cho ListMonThi từ dữ liệu trong hàng hiện tại
                            listMonThi.TenHP = row["TenHP"].ToString();
                            listMonThi.MaHP = row["MaHP"].ToString();
                            listMonThi.SoCau = row["SoCau"].ToString();
                            listMonThi.TGLamBai = row["TGLamBai"].ToString();
                            // Kích hoạt nút btnVaoThi
                            listMonThi.BtnVaoThiEnabled = true;

                            // Thêm ListMonThi vào FlowLayoutPanel
                            flpDSPhongThi.Controls.Add(listMonThi);
                        }
                        else
                        {
                            // Giờ thi chưa tới
                            // Tạo một ListMonThi mới
                            ListMonThi listMonThi = new ListMonThi();
                            // Gán thông tin cho ListMonThi từ dữ liệu trong hàng hiện tại
                            listMonThi.TenHP = row["TenHP"].ToString();
                            listMonThi.MaHP = row["MaHP"].ToString();
                            listMonThi.SoCau = row["SoCau"].ToString();
                            listMonThi.TGLamBai = row["TGLamBai"].ToString();
                            // Vô hiệu hóa nút btnVaoThi
                            listMonThi.BtnVaoThiEnabled = false;

                            // Thêm ListMonThi vào FlowLayoutPanel
                            flpDSPhongThi.Controls.Add(listMonThi);
                        }
                    }

                }
            }
        }

        private void btn_Logout_Click(object sender, EventArgs e)
        {
            // Hiển thị hộp thoại xác nhận
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn đăng xuất không?", "Xác nhận đăng xuất!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                // Đóng form Manager và giải phóng tài nguyên
                this.Close();

                // Mở form Login
                Login loginForm = new Login();
                loginForm.Show();
            }
        }
    }
}
