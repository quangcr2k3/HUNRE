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
    public partial class Login : Form
    {
        // Chuỗi kết nối
        string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;

        public Login()
        {
            InitializeComponent();
            // Ban đầu, ẩn mật khẩu bằng cách sử dụng ký tự hệ thống
            txt_Password.UseSystemPasswordChar = true;
            // Ban đầu, không kiểm tra toggle switch
            guna2ToggleSwitch1.Checked = false;
        }

        private void guna2ControlBox2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btn_Login_Click(object sender, EventArgs e)
        {
            string user = txt_User.Text.Trim();
            string password = txt_Password.Text.Trim();

            // Kiểm tra xem trường tài khoản và mật khẩu có trống không
            if (string.IsNullOrEmpty(user))
            {
                MessageBox.Show("Vui lòng nhập tài khoản!");
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Vui lòng nhập mật khẩu!");
                return;
            }

            // Kiểm tra xem người dùng là sinh viên hay giảng viên
            string userRole = CheckUser(user, password);

            if (userRole != null)
            {
                if (userRole == "1")
                {
                    // Mở form Manager
                    Manager managerForm = new Manager();
                    managerForm.Show();
                }
                else if (userRole == "0")
                {
                    // lấy thông tin MaSV truyền vào public
                    try
                    {
                        thongtinSV.MaSV = txt_User.Text.ToString();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                    }
                    
                    // Mở form Student
                    Student studentForm = new Student();
                    studentForm.Show();
                }
                // Đóng form đăng nhập
                this.Hide();
            }
            else
            {
                MessageBox.Show("Thông tin đăng nhập không chính xác!");
            }
        }

        private string CheckUser(string user, string password)
        {
            string userRole = null;

            // Kết nối tới cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT VaiTro FROM GIANGVIEN WHERE MaGV = @user COLLATE SQL_Latin1_General_CP1_CS_AS AND MatKhau = @password COLLATE SQL_Latin1_General_CP1_CS_AS " +
                       "UNION ALL " +
                       "SELECT VaiTro FROM SINHVIEN WHERE MaSV = @user COLLATE SQL_Latin1_General_CP1_CS_AS AND MatKhau = @password COLLATE SQL_Latin1_General_CP1_CS_AS";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@user", user);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        userRole = reader["VaiTro"].ToString();
                    }
                    reader.Close();
                }
            }
            return userRole;
        }

        private void guna2ToggleSwitch1_CheckedChanged(object sender, EventArgs e)
        {
            // Kiểm tra xem người dùng có bật toggle switch không
            if (guna2ToggleSwitch1.Checked)
            {
                // Nếu bật, hiện mật khẩu
                txt_Password.UseSystemPasswordChar = false;
            }
            else
            {
                // Nếu tắt, ẩn mật khẩu
                txt_Password.UseSystemPasswordChar = true;
            }
        }

        private void txt_User_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Kiểm tra xem người dùng đã nhấn phím Enter chưa
            if (e.KeyChar == (char)Keys.Enter)
            {
                // Gọi phương thức xử lý đăng nhập
                btn_Login_Click(sender, e);
            }
        }

        private void txt_Password_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Kiểm tra xem người dùng đã nhấn phím Enter chưa
            if (e.KeyChar == (char)Keys.Enter)
            {
                // Gọi phương thức xử lý đăng nhập
                btn_Login_Click(sender, e);
            }
        }
    }
}
