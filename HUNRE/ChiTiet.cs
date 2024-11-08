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
    public partial class ChiTiet : Form
    {
        // Chuỗi kết nối
        string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        public ChiTiet()
        {
            InitializeComponent();
        }

        private void ChiTiet_Load(object sender, EventArgs e)
        {
            // Kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Tạo một đối tượng DataTable để lưu trữ kết quả từ cơ sở dữ liệu
                DataTable dtSV = new DataTable();
                DataTable dtMT = new DataTable();
                DataTable dtBL = new DataTable();

                // Lấy điểm thi từ class public
                lbDiem.Text = thongtinBaiThi.Diem;
                // Lấy thông tin thí sinh
                // 1. Nhận thông tin Mã sinh viên và mã học phần từ tabpage BaoCao thông qua class public
                string maSV = thongtinBaiThi.MaSV;
                string maHP = thongtinBaiThi.MaHP;

                // 2. Lấy thông tin sinh viên từ cơ sở dữ liệu
                string sqlSV = "SELECT * FROM SINHVIEN WHERE MaSV = @MaSV";
                // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
                SqlCommand cmdSV = new SqlCommand(sqlSV, connection);
                cmdSV.Parameters.AddWithValue("@MaSV", maSV);

                // Thực thi truy vấn và đổ dữ liệu vào DataTable
                SqlDataAdapter adapterSV = new SqlDataAdapter(cmdSV);
                adapterSV.Fill(dtSV);

                // Kiểm tra nếu có ít nhất một hàng được trả về từ cơ sở dữ liệu
                if (dtSV.Rows.Count > 0)
                {
                    // Hiển thị thông tin sinh viên trên giao diện người dùng
                    lbMaSV.Text = dtSV.Rows[0]["MaSV"].ToString();
                    lbHoTen.Text = dtSV.Rows[0]["HoDem"].ToString() + " " + dtSV.Rows[0]["Ten"].ToString();
                    lbLop.Text = dtSV.Rows[0]["Lop"].ToString();
                }

                // 3. Lấy thông tin môn thi từ cơ sở dữ liệu
                string sqlMT = "SELECT * FROM KETQUA WHERE MaHP = @MaHP AND MaSV = @MaSV";
                // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
                SqlCommand cmdMT = new SqlCommand(sqlMT, connection);
                cmdMT.Parameters.AddWithValue("@MaHP", maHP);
                cmdMT.Parameters.AddWithValue("@MaSV", maSV);

                // Thực thi truy vấn và đổ dữ liệu vào DataTable
                SqlDataAdapter adapterMT = new SqlDataAdapter(cmdMT);
                adapterMT.Fill(dtMT);

                // Kiểm tra nếu có ít nhất một hàng được trả về từ cơ sở dữ liệu
                if (dtMT.Rows.Count > 0)
                {
                    // Hiển thị thông tin môn thi trên giao diện người dùng
                    lbTenHP.Text = dtMT.Rows[0]["TenHP"].ToString();
                    lbMaHP.Text = dtMT.Rows[0]["MaHP"].ToString();
                    lbSoCau.Text = dtMT.Rows[0]["SoCau"].ToString() + " câu";
                    lbTGLamBai.Text = dtMT.Rows[0]["TGLamBai"].ToString() + " phút";
                    // Lấy giá trị từ cột "NgayThi" và chuyển đổi thành kiểu DateTime
                    DateTime ngayThi = (DateTime)dtMT.Rows[0]["NgayThi"];
                    // Hiển thị chỉ ngày
                    lbNgayThi.Text = ngayThi.ToString("dd/MM/yyyy");
                    lbGioThi.Text = dtMT.Rows[0]["GioThi"].ToString();
                    // Lấy giá trị từ cột "TGNopBai" và chuyển đổi thành kiểu DateTime
                    DateTime tgNopBai = (DateTime)dtMT.Rows[0]["TGNopBai"];
                    // Hiển thị chỉ ngày giờ
                    lbTGNopBai.Text = tgNopBai.ToString("HH:mm:ss dd/MM/yyyy");
                }

                // 4. Lấy ds câu hỏi và đáp án từ cơ sở dữ liệu
                string sqlBL = "SELECT * FROM BAILAM WHERE MaSV = @MaSV AND MaHP = @MaHP";
                // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
                SqlCommand cmdBL = new SqlCommand(sqlBL, connection);
                cmdBL.Parameters.AddWithValue("@MaSV", maSV);
                cmdBL.Parameters.AddWithValue("@MaHP", maHP);

                // Thực thi truy vấn và đổ dữ liệu vào DataTable
                SqlDataAdapter adapterBL = new SqlDataAdapter(cmdBL);
                adapterBL.Fill(dtBL);

                // Kiểm tra nếu có ít nhất một hàng được trả về từ cơ sở dữ liệu
                if (dtBL.Rows.Count > 0)
                {
                    // Sắp xếp dữ liệu trong DataTable dtBL theo cột "CauSo"
                    dtBL.DefaultView.Sort = "CauSo ASC";
                    DataTable sortedDTBL = dtBL.DefaultView.ToTable();

                    // Duyệt qua từng hàng dữ liệu đã được sắp xếp để hiển thị các câu hỏi đã làm
                    for (int i = 0; i < sortedDTBL.Rows.Count; i++)
                    {
                        // Lấy số thứ tự câu hỏi từ cột "CauSo" của bảng BAILAM
                        int cauSo = (int)sortedDTBL.Rows[i]["CauSo"];

                        // Lấy mã câu hỏi từ cột "MaCH" của bảng BAILAM
                        string maCH = sortedDTBL.Rows[i]["MaCH"].ToString();
                        string noiDungCH = sortedDTBL.Rows[i]["NoiDung"].ToString();
                        string dapAn = sortedDTBL.Rows[i]["DapAn"].ToString();

                        // Lấy câu trả lời từ cột "TraLoi" của bảng BAILAM dựa vào số thứ tự câu hỏi
                        string traLoi = sortedDTBL.Rows[i]["TraLoi"].ToString();

                        // Tạo một ListCH_DA mới
                        ListCH_DA listCH_DA = new ListCH_DA();

                        // Hiển thị số thứ tự câu hỏi và mã câu hỏi
                        listCH_DA.LabelCauSo.Text = "Câu " + cauSo + ": (Mã: " + maCH + ")";

                        // Hiển thị nội dung câu hỏi
                        listCH_DA.LabelNoiDungCH.Text = noiDungCH;

                        // Hiển thị đáp án câu hỏi
                        listCH_DA.LabelDapAn.Text = "Đáp án đúng là: " + dapAn;

                        // Tạo một ListTraLoi mới
                        ListTraLoi listTraLoi = new ListTraLoi();

                        // Hiển thị số thứ tự câu hỏi
                        listTraLoi.LabelCauSo.Text = "Câu " + cauSo + ":";

                        // Đặt giá trị cho RadioButton tương ứng với câu trả lời
                        switch (traLoi)
                        {
                            case "A":
                                listTraLoi.Rd_A.Checked = true;
                                break;
                            case "B":
                                listTraLoi.Rd_B.Checked = true;
                                break;
                            case "C":
                                listTraLoi.Rd_C.Checked = true;
                                break;
                            case "D":
                                listTraLoi.Rd_D.Checked = true;
                                break;
                            default:
                                break;
                        }

                        // Thêm ListCauHoi vào FlowLayoutPanel
                        flpCauHoi.Controls.Add(listCH_DA);
                        // Thêm ListDapAn vào FlowLayoutPanel
                        flpDapAn.Controls.Add(listTraLoi);
                    }

                }
                else
                {
                    MessageBox.Show("Không có câu hỏi nào được tìm thấy!");
                }
            }
        }

        private void ChiTiet_Deactivate(object sender, EventArgs e)
        {
            // Đóng form khi mất focus
            this.Close();
        }
    }
}
