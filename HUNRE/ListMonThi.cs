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
    public partial class ListMonThi : UserControl
    {
        public ListMonThi()
        {
            InitializeComponent();
        }

        private string _tenHP;
        private string _maHP;
        private string _soCau;
        private string _tgLamBai;
        // Khai báo một biến private để lưu trữ trạng thái của nút btnVaoThi
        private bool _btnVaoThiEnabled = true;

        // Khai báo một sự kiện để thông báo khi trạng thái của nút btnVaoThi thay đổi
        public event EventHandler BtnVaoThiEnabledChanged;

        [Category("Custom Props")]
        public string TenHP
        {
            get { return _tenHP; }
            set { _tenHP = value; lbTenHP.Text = value; }
        }

        [Category("Custom Props")]
        public string MaHP
        {
            get { return _maHP; }
            set { _maHP = value; lbMaHP.Text = value; }
        }


        [Category("Custom Props")]
        public string SoCau
        {
            get { return _soCau; }
            set { _soCau = value; lbSoCau.Text = value; }
        }

        [Category("Custom Props")]
        public string TGLamBai
        {
            get { return _tgLamBai; }
            set { _tgLamBai = value; blTGLamBai.Text = value; }
        }

        // Thêm một thuộc tính để điều khiển trạng thái của nút btnVaoThi
        [Category("Custom Props")]
        public bool BtnVaoThiEnabled
        {
            get { return _btnVaoThiEnabled; }
            set
            {
                _btnVaoThiEnabled = value;
                // Cập nhật trạng thái của nút btnVaoThi khi thuộc tính này thay đổi
                btnVaoThi.Enabled = value;

                // Kích hoạt sự kiện để thông báo rằng trạng thái của nút btnVaoThi đã thay đổi
                OnBtnVaoThiEnabledChanged(EventArgs.Empty);
            }
        }

        // Phương thức này được sử dụng để kích hoạt sự kiện BtnVaoThiEnabledChanged
        protected virtual void OnBtnVaoThiEnabledChanged(EventArgs e)
        {
            BtnVaoThiEnabledChanged?.Invoke(this, e);
        }
        private void btnVaoThi_Click(object sender, EventArgs e)
        {
            // Chuỗi kết nối
            string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand();

            // 1. Nhận thông tin Mã sinh viên từ form login thông qua class public
            string maSV = thongtinSV.MaSV;
            // Lấy mã học phần từ property MaHP
            string maHP = MaHP;
            // Lấy tên môn học từ property TenHP
            string tenMonHoc = TenHP;

            // Kiểm tra kết quả thi của sinh viên với mã SV và mã HP tương ứng
            string query = "SELECT Diem FROM KETQUA WHERE MaSV = @MaSV AND MaHP = @MaHP";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MaSV", maSV);
                command.Parameters.AddWithValue("@MaHP", maHP);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Kiểm tra xem có kết quả trả về hay không
                    if (reader.Read())
                    {
                        // Có kết quả trả về
                        string diem = reader["Diem"].ToString();
                        MessageBox.Show($"Bạn đã làm bài thi môn {tenMonHoc}\nĐiểm của bạn là: {diem}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        // Không có kết quả trả về
                        DialogResult result = MessageBox.Show($"Bạn có chắc chắn muốn vào thi môn {tenMonHoc} không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                        if (result == DialogResult.Yes)
                        {
                            thongtinMT.MaHP = maHP;
                            Baithi baiThiForm = new Baithi();
                            baiThiForm.Show();
                            Form studentForm = this.FindForm();
                            if (studentForm != null)
                            {
                                studentForm.Close();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }
            }
        }

    }
}
