using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;

namespace HUNRE
{
    public partial class Manager : Form
    {
        // Chuỗi kết nối
        string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        public Manager()
        {
            InitializeComponent();
        }

        private void guna2ControlBox2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Manager_Load(object sender, EventArgs e)
        {
            string sqlQuery = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI";
            Load_dgv_CauHoi(sqlQuery);
            LoadCbMaHP();

            btn_LuuCH.Enabled = false;
            btn_HuyCH.Enabled = false;
            btn_LuuSV.Enabled = false;
            btn_HuySV.Enabled = false;
            btn_LuuGV.Enabled = false;
            btn_HuyGV.Enabled = false;
            btn_LuuMT.Enabled = false;
            btn_HuyMT.Enabled = false;
            btnXuatBangDiem.Enabled = false;
            btnXuatBaiThi.Enabled = false;
            btn_XoaBaiThi.Enabled = false;
            Description(false);
        }

        public void LoadCbMaHP()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd = connection.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT MaHP FROM MONTHI";
                // Không cần thực thi lệnh không truy vấn ở đây vì chúng ta sẽ điền vào DataTable bên dưới.
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    var maHP = dr["MaHP"].ToString();
                    // Kiểm tra xem mục này đã tồn tại trong cb_MaHpCH chưa, nếu chưa thì thêm vào
                    if (!cb_MaHpCH.Items.Contains(maHP))
                    {
                        cb_MaHpCH.Items.Add(maHP);
                    }
                    // Kiểm tra xem mục này đã tồn tại trong cb_MonThiCH chưa, nếu chưa thì thêm vào
                    if (!cb_MonThiCH.Items.Contains(maHP))
                    {
                        cb_MonThiCH.Items.Add(maHP);
                    }
                    // Kiểm tra xem mục này đã tồn tại trong cbMaHP chưa, nếu chưa thì thêm vào
                    if (!cbMaHPBC.Items.Contains(maHP))
                    {
                        cbMaHPBC.Items.Add(maHP);
                    }
                }

                connection.Close();
            }
        }

        //Phần Câu Hỏi
        private void Load_dgv_CauHoi(string sqlQuery)
        {
            try
            {
                // Tạo kết nối
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo đối tượng SqlDataAdapter và truyền vào câu lệnh SQL và kết nối
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection);

                    // Tạo đối tượng DataTable để chứa dữ liệu
                    DataTable dataTable = new DataTable();

                    // Đổ dữ liệu từ SqlDataAdapter vào DataTable
                    adapter.Fill(dataTable);

                    // Đặt DataTable làm nguồn dữ liệu cho DataGridView
                    dgv_CauHoi.DataSource = dataTable;

                    // Đóng kết nối
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        //Phần Sinh Viên
        private void Load_dgv_SinhVien(string sqlQuery)
        {
            try
            {
                // Tạo kết nối
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo đối tượng SqlDataAdapter và truyền vào câu lệnh SQL và kết nối
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection);

                    // Tạo đối tượng DataTable để chứa dữ liệu
                    DataTable dataTable = new DataTable();

                    // Đổ dữ liệu từ SqlDataAdapter vào DataTable
                    adapter.Fill(dataTable);

                    // Đặt DataTable làm nguồn dữ liệu cho DataGridView
                    dgv_SinhVien.DataSource = dataTable;

                    // Đóng kết nối
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        //Phần Giảng Viên
        private void Load_dgv_GiangVien(string sqlQuery)
        {
            try
            {
                // Tạo kết nối
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo đối tượng SqlDataAdapter và truyền vào câu lệnh SQL và kết nối
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection);

                    // Tạo đối tượng DataTable để chứa dữ liệu
                    DataTable dataTable = new DataTable();

                    // Đổ dữ liệu từ SqlDataAdapter vào DataTable
                    adapter.Fill(dataTable);

                    // Đặt DataTable làm nguồn dữ liệu cho DataGridView
                    dgv_GiangVien.DataSource = dataTable;

                    // Đóng kết nối
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        //Phần Môn Thi
        private void Load_dgv_MonThi(string sqlQuery)
        {
            try
            {
                // Tạo kết nối
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo đối tượng SqlDataAdapter và truyền vào câu lệnh SQL và kết nối
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection);

                    // Tạo đối tượng DataTable để chứa dữ liệu
                    DataTable dataTable = new DataTable();

                    // Đổ dữ liệu từ SqlDataAdapter vào DataTable
                    adapter.Fill(dataTable);

                    // Đặt DataTable làm nguồn dữ liệu cho DataGridView
                    dgv_MonThi.DataSource = dataTable;

                    // Đóng kết nối
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        //Phần Báo Cáo
        private void Load_dgv_BaoCao(string sqlQuery)
        {
            btnXuatBangDiem.Enabled = true;
            try
            {
                // Tạo kết nối
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo đối tượng SqlDataAdapter và truyền vào câu lệnh SQL và kết nối
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection);

                    // Tạo đối tượng DataTable để chứa dữ liệu
                    DataTable dataTable = new DataTable();

                    // Đổ dữ liệu từ SqlDataAdapter vào DataTable
                    adapter.Fill(dataTable);

                    // Đặt DataTable làm nguồn dữ liệu cho DataGridView
                    dgv_BaoCao.DataSource = dataTable;

                    // Đóng kết nối
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        private void Description(Boolean a)
        {
            //Câu hỏi
            tb_MaCH.Enabled = a;
            cb_MaHpCH.Enabled = a;
            tb_NoiDungCH.ReadOnly = !a;
            cb_DapAnCH.Enabled = a;

            //Sinh viên
            tb_MaSV.Enabled = a;
            tb_HoDemSV.Enabled = a;
            tb_TenSV.Enabled = a;
            dt_NgaySinhSV.Enabled = a;
            tb_MatKhauSV.Enabled = a;
            tb_LopSV.Enabled = a;
            tb_NganhSV.Enabled = a;

            //Giảng viên
            tb_MaGV.Enabled = a;
            tb_HoDemGV.Enabled = a;
            tb_TenGV.Enabled = a;
            tb_MatKhauGV.Enabled = a;
            tb_KhoaGV.Enabled = a;

            //Môn thi
            tb_MaHpMT.Enabled = a;
            tb_TenMonMT.Enabled = a;
            tb_SoCauMT.Enabled = a;
            tb_ThoiLuongMT.Enabled = a;
            dt_NgayThiMT.Enabled = a;
            dt_GioThiMT.Enabled = a;

            //Báo cáo
            tbMaSVBC.Enabled = a;
            cbMaHPBC.Enabled = a;
            tbLopBC.Enabled = a;
        }

        private void Clean()
        {
            tb_MaCH.Clear();
            tb_NoiDungCH.Clear();
            cb_DapAnCH.SelectedIndex = -1;
            cb_MaHpCH.SelectedIndex = -1;

            tb_MaSV.Clear();
            tb_HoDemSV.Clear();
            tb_TenSV.Clear();
            dt_NgaySinhSV.Value = DateTime.Now;
            tb_MatKhauSV.Clear();
            tb_LopSV.Clear();
            tb_NganhSV.Clear();

            tb_MaGV.Clear();
            tb_HoDemGV.Clear();
            tb_TenGV.Clear();
            tb_MatKhauGV.Clear();
            tb_KhoaGV.Clear();

            tb_MaHpMT.Clear();
            tb_TenMonMT.Clear();
            tb_SoCauMT.Clear();           
            tb_ThoiLuongMT.Clear();            
            dt_NgayThiMT.Value = DateTime.Now;
            dt_GioThiMT.Value = DateTime.Now.Date;

            tbMaSVBC.Clear();
            cbMaHPBC.SelectedIndex = -1;
            tbLopBC.Clear();
        }

        private void guna2TabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Kiểm tra tabPage được chọn
            if (guna2TabControl1.SelectedTab == tab_CauHoi)
            {
                // Thực hiện load dữ liệu cụ thể cho tabPage Câu Hỏi
                string sqlQuery = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI";
                Load_dgv_CauHoi(sqlQuery);
                LoadCbMaHP();
            }
            else if (guna2TabControl1.SelectedTab == tab_SinhVien)
            {
                // Thực hiện load dữ liệu cụ thể cho tabPage Sinh Viên
                string sqlQuery = "SELECT MaSV AS 'Mã sinh viên', HoDem AS 'Họ đệm', Ten AS 'Tên', NgaySinh AS 'Ngày sinh', MatKhau AS 'Mật khẩu', Lop AS 'Lớp', Nganh AS 'Ngành', VaiTro AS 'Vai trò' FROM SINHVIEN";
                Load_dgv_SinhVien(sqlQuery);
            }
            else if (guna2TabControl1.SelectedTab == tab_GiangVien)
            {
                // Thực hiện load dữ liệu cụ thể cho tabPage Giảng Viên
                string sqlQuery = "SELECT MaGV AS 'Mã giảng viên', HoDem AS 'Họ đệm', Ten AS 'Tên', MatKhau AS 'Mật khẩu', Khoa AS 'Khoa', VaiTro AS 'Vai trò' FROM GIANGVIEN";
                Load_dgv_GiangVien(sqlQuery);
            }
            else if (guna2TabControl1.SelectedTab == tab_MonThi)
            {
                // Thực hiện load dữ liệu cụ thể cho tabPage Môn Thi
                string sqlQuery = "SELECT MaHP AS 'Mã học phần', TenHP AS 'Tên học phần', SoCau AS 'Số câu', TGLamBai AS 'Thời lượng', NgayThi AS 'Ngày thi', GioThi AS 'Giờ thi' FROM MONTHI";
                Load_dgv_MonThi(sqlQuery);
            }
        }

        //Chức năng Câu hỏi
        #region Chức năng Câu Hỏi
        private void dgv_CauHoi_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            tb_MaCH.Text = dgv_CauHoi[0, e.RowIndex].Value.ToString();
            cb_MaHpCH.Text = dgv_CauHoi[1, e.RowIndex].Value.ToString();
            tb_NoiDungCH.Text = dgv_CauHoi[2, e.RowIndex].Value.ToString();
            cb_DapAnCH.Text = dgv_CauHoi[3, e.RowIndex].Value.ToString();

            btn_SuaCH.Enabled = true;
            btn_XoaCH.Enabled = true;
            btn_LuuCH.Enabled = false;
            Description(false);
        }
        // Khai báo biến lưu trữ MaCH cũ
        private string oldMaCH;
        private void btn_LuuCH_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "";
                    if (btn_ThemCH.Enabled)
                    {
                        sql = "INSERT INTO CAUHOI (MaCH, MaHP, NoiDung, DapAn) VALUES (@MaCH, @MaHP, @NoiDung, @DapAn)";
                    }
                    else if (btn_SuaCH.Enabled)
                    {
                        sql = "UPDATE CAUHOI SET MaCH = @MaCH, MaHP = @MaHP, NoiDung = @NoiDung, DapAn = @DapAn WHERE MaCH = @OldMaCH";
                    }

                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.Parameters.AddWithValue("@MaCH", tb_MaCH.Text);
                        cmd.Parameters.AddWithValue("@MaHP", cb_MaHpCH.Text);
                        cmd.Parameters.AddWithValue("@NoiDung", tb_NoiDungCH.Text);
                        cmd.Parameters.AddWithValue("@DapAn", cb_DapAnCH.Text);

                        // Thêm tham số cho MaCH trong trường hợp Sửa câu hỏi
                        if (btn_SuaCH.Enabled)
                        {
                            cmd.Parameters.AddWithValue("@OldMaCH", oldMaCH); // oldMaCH là giá trị MaCH cũ trước khi sửa
                        }

                        cmd.ExecuteNonQuery();
                    }

                    string message = "";
                    if (btn_ThemCH.Enabled)
                    {
                        message = "Thêm câu hỏi thành công!";
                    }
                    else if (btn_SuaCH.Enabled)
                    {
                        message = "Sửa câu hỏi thành công!";
                    }
                    MessageBox.Show(message);
                    string sqlQuery = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI";
                    Load_dgv_CauHoi(sqlQuery);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
            Description(false);
            btn_ThemCH.Enabled = true;
            btn_SuaCH.Enabled = true;
            btn_XoaCH.Enabled = true;
            btn_LuuCH.Enabled = false;
            btn_HuyCH.Enabled = false;
        }

        private void btn_ThemCH_Click(object sender, EventArgs e)
        {
            Clean();
            Description(true);
            dgv_CauHoi.CurrentCell = dgv_CauHoi[0, dgv_CauHoi.RowCount - 1];
            tb_MaCH.Focus();
            btn_XoaCH.Enabled = false;
            btn_SuaCH.Enabled = false;
            btn_HuyCH.Enabled = true;
            btn_LuuCH.Enabled = true;
        }

        private void btn_SuaCH_Click(object sender, EventArgs e)
        {
            btn_ThemCH.Enabled = false;
            btn_XoaCH.Enabled = false;
            btn_LuuCH.Enabled = true;
            btn_HuyCH.Enabled = true;
            Description(true);
            if (dgv_CauHoi.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dgv_CauHoi.SelectedRows[0];

                // Hiển thị giá trị của MaCH trong textbox
                tb_MaCH.Text = row.Cells["Mã câu hỏi"].Value.ToString();

                // Lưu trữ giá trị của MaCH cũ
                oldMaCH = row.Cells["Mã câu hỏi"].Value.ToString();
            }
        }

        private void btn_XoaCH_Click(object sender, EventArgs e)
        {
            try
            {
                // Hiển thị hộp thoại xác nhận
                DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa câu hỏi này không?", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                // Nếu người dùng chọn Yes
                if (result == DialogResult.Yes)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string sql = "";
                        if (btn_XoaMT.Enabled)
                        {
                            sql = "DELETE FROM CAUHOI WHERE MaCH = '" + tb_MaCH.Text + "'";
                        }

                        using (SqlCommand cmd = new SqlCommand(sql, connection))
                        {
                            cmd.ExecuteNonQuery();
                        }

                        MessageBox.Show("Xóa câu hỏi thành công!");
                        string sqlQuery = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI";
                        Load_dgv_CauHoi(sqlQuery);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
        }

        private void btn_HuyCH_Click(object sender, EventArgs e)
        {
            Clean();
            Description(false);
            btn_ThemCH.Enabled = true;
            btn_SuaCH.Enabled = true;
            btn_XoaCH.Enabled = true;
            btn_LuuCH.Enabled = false;
            btn_HuyCH.Enabled = false;
        }
        private void btn_ImportCH_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog
                {
                    Filter = "Excel Files|*.xlsx;*.xls",
                    Title = "Select an Excel File"
                };

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string filePath = openFileDialog.FileName;

                    using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath)))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0]; // Lấy trang tính đầu tiên

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            // Thêm dữ liệu từ Excel vào bảng CAUHOI
                            string insertQuery = "INSERT INTO CAUHOI (MaCH, MaHP, NoiDung, DapAn) VALUES (@MaCH, @MaHP, @NoiDung, @DapAn)";
                            SqlCommand insertCommand = new SqlCommand(insertQuery, connection);

                            for (int row = worksheet.Dimension.Start.Row + 1; row <= worksheet.Dimension.End.Row; row++)
                            {
                                insertCommand.Parameters.Clear();

                                insertCommand.Parameters.AddWithValue("@MaCH", worksheet.Cells[row, 1].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@MaHP", worksheet.Cells[row, 2].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@NoiDung", worksheet.Cells[row, 3].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@DapAn", worksheet.Cells[row, 4].Value?.ToString());

                                insertCommand.ExecuteNonQuery();
                            }

                            MessageBox.Show("Import dữ liệu từ Excel thành công!");
                            string sqlQuery = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI";
                            Load_dgv_CauHoi(sqlQuery);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }
        private void btn_ExportCH_Click(object sender, EventArgs e)
        {
            try
            {
                // Tạo một đối tượng SaveFileDialog để cho phép người dùng chọn vị trí và tên tệp Excel để lưu
                SaveFileDialog saveFileDialog = new SaveFileDialog
                {
                    Filter = "Excel Files|*.xlsx",
                    Title = "Export Data to Excel",
                    FileName = "CAUHOI_Data.xlsx"
                };

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    // Tạo một đối tượng ExcelPackage để tạo tệp Excel
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        // Tạo một trang tính mới
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("CAUHOI");

                        // Lấy số lượng cột và dòng trong DataGridView
                        int colCount = dgv_CauHoi.Columns.Count;
                        int rowCount = dgv_CauHoi.Rows.Count;

                        // Lấy header cho cột
                        for (int i = 1; i <= colCount; i++)
                        {
                            worksheet.Cells[1, i].Value = dgv_CauHoi.Columns[i - 1].HeaderText;
                        }

                        // Lấy dữ liệu từ DataGridView
                        for (int row = 0; row < rowCount; row++)
                        {
                            for (int col = 0; col < colCount; col++)
                            {
                                worksheet.Cells[row + 2, col + 1].Value = dgv_CauHoi.Rows[row].Cells[col].Value?.ToString();
                            }
                        }

                        // Lưu tệp Excel
                        FileInfo excelFile = new FileInfo(saveFileDialog.FileName);
                        package.SaveAs(excelFile);
                        MessageBox.Show("Dữ liệu đã được xuất thành công vào tệp Excel! Đường dẫn: " + excelFile.FullName);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }
        #endregion

        //Chức năng Sinh viên
        #region Chức năng Sinh Viên
        private void dgv_SinhVien_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            tb_MaSV.Text = dgv_SinhVien[0, e.RowIndex].Value.ToString();
            tb_HoDemSV.Text = dgv_SinhVien[1, e.RowIndex].Value.ToString();
            tb_TenSV.Text = dgv_SinhVien[2, e.RowIndex].Value.ToString();
            dt_NgaySinhSV.Text = dgv_SinhVien[3, e.RowIndex].Value.ToString();
            tb_MatKhauSV.Text = dgv_SinhVien[4, e.RowIndex].Value.ToString();
            tb_LopSV.Text = dgv_SinhVien[5, e.RowIndex].Value.ToString();
            tb_NganhSV.Text = dgv_SinhVien[6, e.RowIndex].Value.ToString();

            btn_SuaSV.Enabled = true;
            btn_XoaSV.Enabled = true;
            btn_LuuSV.Enabled = false;
            Description(false);
        }
        // Khai báo biến lưu trữ MaSv cũ
        private string oldMaSV;
        private void btn_LuuSV_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "";
                    if (btn_ThemSV.Enabled)
                    {
                        sql = "INSERT INTO SINHVIEN (MaSV, HoDem, Ten, NgaySinh, MatKhau, Lop, Nganh, VaiTro) VALUES (@MaSV, @HoDem, @Ten, @NgaySinh, @MatKhau, @Lop, @Nganh, @VaiTro)";
                    }
                    else if (btn_SuaSV.Enabled)
                    {
                        sql = "UPDATE SINHVIEN SET MaSV = @MaSV, HoDem = @HoDem, Ten = @Ten, NgaySinh = @NgaySinh, MatKhau = @MatKhau, Lop = @Lop, Nganh = @Nganh, VaiTro = @VaiTro WHERE MaSV = @OldMaSV";
                    }

                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.Parameters.AddWithValue("@MaSV", tb_MaSV.Text);
                        cmd.Parameters.AddWithValue("@HoDem", tb_HoDemSV.Text);
                        cmd.Parameters.AddWithValue("@Ten", tb_TenSV.Text);
                        cmd.Parameters.AddWithValue("@NgaySinh", dt_NgaySinhSV.Value);
                        cmd.Parameters.AddWithValue("@MatKhau", tb_MatKhauSV.Text);
                        cmd.Parameters.AddWithValue("@Lop", tb_LopSV.Text);
                        cmd.Parameters.AddWithValue("@Nganh", tb_NganhSV.Text);
                        cmd.Parameters.AddWithValue("@VaiTro", 0);

                        // Thêm tham số cho MaSV trong trường hợp Sửa câu hỏi
                        if (btn_SuaSV.Enabled)
                        {
                            cmd.Parameters.AddWithValue("@OldMaSV", oldMaSV); // oldMaSV là giá trị MaSV cũ trước khi sửa
                        }
                        cmd.ExecuteNonQuery();
                    }

                    string message = "";
                    if (btn_ThemSV.Enabled)
                    {
                        message = "Thêm sinh viên thành công!";
                    }
                    else if (btn_SuaSV.Enabled)
                    {
                        message = "Sửa vinh viên thành công!";
                    }
                    MessageBox.Show(message);
                    string sqlQuery = "SELECT MaSV AS 'Mã sinh viên', HoDem AS 'Họ đệm', Ten AS 'Tên',NgaySinh AS 'Ngày sinh', MatKhau AS 'Mật khẩu', Lop AS 'Lớp', Nganh AS 'Ngành', VaiTro AS 'Vai trò' FROM SINHVIEN";
                    Load_dgv_SinhVien(sqlQuery);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
            Description(false);
            btn_ThemSV.Enabled = true;
            btn_SuaSV.Enabled = true;
            btn_XoaSV.Enabled = true;
            btn_LuuSV.Enabled = false;
            btn_HuySV.Enabled = false;
        }

        private void btn_ThemSV_Click(object sender, EventArgs e)
        {
            Clean();
            Description(true);
            dgv_SinhVien.CurrentCell = dgv_SinhVien[0, dgv_SinhVien.RowCount - 1];
            tb_MaSV.Focus();
            btn_XoaSV.Enabled = false;
            btn_SuaSV.Enabled = false;
            btn_HuySV.Enabled = true;
            btn_LuuSV.Enabled = true;
        }

        private void bt_SuaSV_Click(object sender, EventArgs e)
        {
            btn_ThemSV.Enabled = false;
            btn_XoaSV.Enabled = false;
            btn_LuuSV.Enabled = true;
            btn_HuySV.Enabled = true;
            Description(true);
            if (dgv_SinhVien.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dgv_SinhVien.SelectedRows[0];

                // Hiển thị giá trị của MaSV trong textbox
                tb_MaSV.Text = row.Cells["Mã sinh viên"].Value.ToString();

                // Lưu trữ giá trị của MaSV cũ
                oldMaSV = row.Cells["Mã sinh viên"].Value.ToString();
            }
        }

        private void bt_XoaSV_Click(object sender, EventArgs e)
        {
            try
            {
                // Hiển thị hộp thoại xác nhận
                DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa sinh viên này không?\nNếu xóa sinh viên này các kết quả và bài thi liên quan tới sinh viên cũng sẽ bị xóa.", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                // Nếu người dùng chọn Yes
                if (result == DialogResult.Yes)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string maSV = tb_MaSV.Text;

                        // Xóa dữ liệu từ bảng BAILAM
                        string sqlBAILAM = "DELETE FROM BAILAM WHERE MaSV = '" + maSV + "'";
                        using (SqlCommand cmdBAILAM = new SqlCommand(sqlBAILAM, connection))
                        {
                            cmdBAILAM.ExecuteNonQuery();
                        }

                        // Xóa dữ liệu từ bảng KETQUA
                        string sqlKETQUA = "DELETE FROM KETQUA WHERE MaSV = '" + maSV + "'";
                        using (SqlCommand cmdKETQUA = new SqlCommand(sqlKETQUA, connection))
                        {
                            cmdKETQUA.ExecuteNonQuery();
                        }

                        // Xóa dữ liệu từ bảng SINHVIEN
                        string sqlSINHVIEN = "DELETE FROM SINHVIEN WHERE MaSV = '" + maSV + "'";
                        using (SqlCommand cmdSINHVIEN = new SqlCommand(sqlSINHVIEN, connection))
                        {
                            cmdSINHVIEN.ExecuteNonQuery();
                        }

                        MessageBox.Show("Xóa sinh viên thành công!");
                        string sqlQuery = "SELECT MaSV AS 'Mã sinh viên', HoDem AS 'Họ đệm', Ten AS 'Tên',NgaySinh AS 'Ngày sinh', MatKhau AS 'Mật khẩu', Lop AS 'Lớp', Nganh AS 'Ngành', VaiTro AS 'Vai trò' FROM SINHVIEN";
                        Load_dgv_SinhVien(sqlQuery);
                    }
                }
                   
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
        }

        private void bt_HuySV_Click(object sender, EventArgs e)
        {
            Clean();
            Description(false);
            btn_ThemSV.Enabled = true;
            btn_SuaSV.Enabled = true;
            btn_XoaSV.Enabled = true;
            btn_LuuSV.Enabled = false;
            btn_HuySV.Enabled = false;
        }
        private void btn_ImportSV_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog
                {
                    Filter = "Excel Files|*.xlsx;*.xls",
                    Title = "Select an Excel File"
                };

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string filePath = openFileDialog.FileName;

                    using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath)))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0]; // Lấy trang tính đầu tiên

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            // Thêm dữ liệu từ Excel vào bảng SINHVIEN
                            string insertQuery = "INSERT INTO SINHVIEN (MaSV, HoDem, Ten, NgaySinh, MatKhau, Lop, Nganh, VaiTro) VALUES (@MaSV, @HoDem, @Ten, @NgaySinh, @MatKhau, @Lop, @Nganh, 0)";
                            SqlCommand insertCommand = new SqlCommand(insertQuery, connection);

                            for (int row = worksheet.Dimension.Start.Row + 1; row <= worksheet.Dimension.End.Row; row++)
                            {
                                insertCommand.Parameters.Clear();

                                insertCommand.Parameters.AddWithValue("@MaSV", worksheet.Cells[row, 1].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@HoDem", worksheet.Cells[row, 2].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@Ten", worksheet.Cells[row, 3].Value?.ToString());
                                // Chuyển đổi giá trị NgaySinh từ chuỗi sang DateTime
                                string ngaySinhStr = worksheet.Cells[row, 4].Value?.ToString();
                                DateTime ngaySinh;
                                if (DateTime.TryParse(ngaySinhStr, out ngaySinh))
                                {
                                    insertCommand.Parameters.AddWithValue("@NgaySinh", ngaySinh);
                                }
                                insertCommand.Parameters.AddWithValue("@MatKhau", worksheet.Cells[row, 5].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@Lop", worksheet.Cells[row, 6].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@Nganh", worksheet.Cells[row, 7].Value?.ToString());

                                insertCommand.ExecuteNonQuery();
                            }

                            MessageBox.Show("Import dữ liệu từ Excel thành công!");
                            string sqlQuery = "SELECT MaSV AS 'Mã sinh viên', HoDem AS 'Họ đệm', Ten AS 'Tên',NgaySinh AS 'Ngày sinh', MatKhau AS 'Mật khẩu', Lop AS 'Lớp', Nganh AS 'Ngành', VaiTro AS 'Vai trò' FROM SINHVIEN";
                            Load_dgv_SinhVien(sqlQuery);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        private void btn_ExportSV_Click(object sender, EventArgs e)
        {
            try
            {
                // Tạo một đối tượng SaveFileDialog để cho phép người dùng chọn vị trí và tên tệp Excel để lưu
                SaveFileDialog saveFileDialog = new SaveFileDialog
                {
                    Filter = "Excel Files|*.xlsx",
                    Title = "Export Data to Excel",
                    FileName = "SINHVIEN_Data.xlsx"
                };

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    // Tạo một đối tượng ExcelPackage để tạo tệp Excel
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        // Tạo một trang tính mới
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("SINHVIEN");

                        // Lấy số lượng cột và dòng trong DataGridView
                        int colCount = dgv_SinhVien.Columns.Count;
                        int rowCount = dgv_SinhVien.Rows.Count;

                        // Lấy header cho cột
                        for (int i = 1; i <= colCount; i++)
                        {
                            worksheet.Cells[1, i].Value = dgv_SinhVien.Columns[i - 1].HeaderText;
                        }

                        // Lấy dữ liệu từ DataGridView
                        for (int row = 0; row < rowCount; row++)
                        {
                            for (int col = 0; col < colCount; col++)
                            {
                                if (dgv_SinhVien.Columns[col].Name == "Ngày sinh") // Kiểm tra cột là cột Ngày sinh
                                {
                                    // Sử dụng ToShortDateString để chỉ lấy phần ngày tháng từ giá trị DateTime
                                    worksheet.Cells[row + 2, col + 1].Value = dgv_SinhVien.Rows[row].Cells[col].Value != null ? Convert.ToDateTime(dgv_SinhVien.Rows[row].Cells[col].Value).ToShortDateString() : "";
                                }
                                else
                                {
                                    worksheet.Cells[row + 2, col + 1].Value = dgv_SinhVien.Rows[row].Cells[col].Value?.ToString();
                                }
                            }
                        }


                        // Lưu tệp Excel
                        FileInfo excelFile = new FileInfo(saveFileDialog.FileName);
                        package.SaveAs(excelFile);
                        MessageBox.Show("Dữ liệu đã được xuất thành công vào tệp Excel! Đường dẫn: " + excelFile.FullName);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }
        #endregion

        //Chức năng Giảng viên
        #region Chức năng Giảng Viên
        private void dgv_GiangVien_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            tb_MaGV.Text = dgv_GiangVien[0, e.RowIndex].Value.ToString();
            tb_HoDemGV.Text = dgv_GiangVien[1, e.RowIndex].Value.ToString();
            tb_TenGV.Text = dgv_GiangVien[2, e.RowIndex].Value.ToString();
            tb_MatKhauGV.Text = dgv_GiangVien[3, e.RowIndex].Value.ToString();
            tb_KhoaGV.Text = dgv_GiangVien[4, e.RowIndex].Value.ToString();

            btn_SuaGV.Enabled = true;
            btn_XoaGV.Enabled = true;
            btn_LuuGV.Enabled = false;
            Description(false);
        }
        // Khai báo biến lưu trữ MaGV cũ
        private string oldMaGV;
        private void btn_LuuGV_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "";
                    if (btn_ThemGV.Enabled)
                    {
                        sql = "INSERT INTO GIANGVIEN (MaGV, HoDem, Ten, MatKhau, Khoa, VaiTro) VALUES (@MaGV, @HoDem, @Ten, @MatKhau, @Khoa, @VaiTro)";
                    }
                    else if (btn_SuaGV.Enabled)
                    {
                        sql = "UPDATE GIANGVIEN SET MaGV = @MaGV, HoDem = @HoDem, Ten = @Ten, MatKhau = @MatKhau, Khoa = @Khoa, VaiTro = @VaiTro WHERE MaGV = @OldMaGV";
                    }

                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.Parameters.AddWithValue("@MaGV", tb_MaGV.Text);
                        cmd.Parameters.AddWithValue("@HoDem", tb_HoDemGV.Text);
                        cmd.Parameters.AddWithValue("@Ten", tb_TenGV.Text);
                        cmd.Parameters.AddWithValue("@MatKhau", tb_MatKhauGV.Text);
                        cmd.Parameters.AddWithValue("@Khoa", tb_KhoaGV.Text);
                        cmd.Parameters.AddWithValue("@VaiTro", 1);

                        // Thêm tham số cho MaGV trong trường hợp Sửa câu hỏi
                        if (btn_SuaGV.Enabled)
                        {
                            cmd.Parameters.AddWithValue("@OldMaGV", oldMaGV); // oldMaGV là giá trị MaGV cũ trước khi sửa
                        }

                        cmd.ExecuteNonQuery();
                    }

                    string message = "";
                    if (btn_ThemGV.Enabled)
                    {
                        message = "Thêm giảng viên thành công!";
                    }
                    else if (btn_SuaGV.Enabled)
                    {
                        message = "Sửa giảng viên thành công!";
                    }
                    MessageBox.Show(message);
                    string sqlQuery = "SELECT MaGV AS 'Mã giảng viên', HoDem AS 'Họ đệm', Ten AS 'Tên', MatKhau AS 'Mật khẩu', Khoa AS 'Khoa', VaiTro AS 'Vai trò' FROM GIANGVIEN";
                    Load_dgv_GiangVien(sqlQuery);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
            Description(false);
            btn_ThemGV.Enabled = true;
            btn_SuaGV.Enabled = true;
            btn_XoaGV.Enabled = true;
            btn_LuuGV.Enabled = false;
            btn_HuyGV.Enabled = false;
        }

        private void btn_ThemGV_Click(object sender, EventArgs e)
        {
            Clean();
            Description(true);
            dgv_GiangVien.CurrentCell = dgv_GiangVien[0, dgv_GiangVien.RowCount - 1];
            tb_MaGV.Focus();
            btn_XoaGV.Enabled = false;
            btn_SuaGV.Enabled = false;
            btn_HuyGV.Enabled = true;
            btn_LuuGV.Enabled = true;
        }

        private void btn_SuaGV_Click(object sender, EventArgs e)
        {
            btn_ThemGV.Enabled = false;
            btn_XoaGV.Enabled = false;
            btn_LuuGV.Enabled = true;
            btn_HuyGV.Enabled = true;
            Description(true);
            if (dgv_GiangVien.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dgv_GiangVien.SelectedRows[0];

                // Hiển thị giá trị của MaGV trong textbox
                tb_MaGV.Text = row.Cells["Mã giảng viên"].Value.ToString();

                // Lưu trữ giá trị của MaGV cũ
                oldMaGV = row.Cells["Mã giảng viên"].Value.ToString();
            }
        }

        private void btn_XoaGV_Click(object sender, EventArgs e)
        {
            try
            {
                // Hiển thị hộp thoại xác nhận
                DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa giảng viên này không?", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                // Nếu người dùng chọn Yes
                if (result == DialogResult.Yes)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string sql = "";
                        if (btn_XoaGV.Enabled)
                        {
                            sql = "DELETE FROM GIANGVIEN WHERE MaGV = '" + tb_MaGV.Text + "'";
                        }

                        using (SqlCommand cmd = new SqlCommand(sql, connection))
                        {
                            cmd.ExecuteNonQuery();
                        }

                        MessageBox.Show("Xóa giảng viên thành công!");
                        string sqlQuery = "SELECT MaGV AS 'Mã giảng viên', HoDem AS 'Họ đệm', Ten AS 'Tên', MatKhau AS 'Mật khẩu', Khoa AS 'Khoa', VaiTro AS 'Vai trò' FROM GIANGVIEN";
                        Load_dgv_GiangVien(sqlQuery);
                    }
                }                   
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
        }

        private void btn_HuyGV_Click(object sender, EventArgs e)
        {
            Clean();
            Description(false);
            btn_ThemGV.Enabled = true;
            btn_SuaSV.Enabled = true;
            btn_XoaGV.Enabled = true;
            btn_LuuGV.Enabled = false;
            btn_HuyGV.Enabled = false;
        }
        private void btn_ImportGV_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog
                {
                    Filter = "Excel Files|*.xlsx;*.xls",
                    Title = "Select an Excel File"
                };

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string filePath = openFileDialog.FileName;

                    using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath)))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0]; // Lấy trang tính đầu tiên

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            // Thêm dữ liệu từ Excel vào bảng GIANGVIEN
                            string insertQuery = "INSERT INTO GIANGVIEN (MaGV, HoDem, Ten, MatKhau, Khoa, VaiTro) VALUES (@MaGV, @HoDem, @Ten, @MatKhau, @Khoa, 1)";
                            SqlCommand insertCommand = new SqlCommand(insertQuery, connection);

                            for (int row = worksheet.Dimension.Start.Row + 1; row <= worksheet.Dimension.End.Row; row++)
                            {
                                insertCommand.Parameters.Clear();

                                insertCommand.Parameters.AddWithValue("@MaGV", worksheet.Cells[row, 1].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@HoDem", worksheet.Cells[row, 2].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@Ten", worksheet.Cells[row, 3].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@MatKhau", worksheet.Cells[row, 4].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@Khoa", worksheet.Cells[row, 5].Value?.ToString());

                                insertCommand.ExecuteNonQuery();
                            }

                            MessageBox.Show("Import dữ liệu từ Excel thành công!");
                            string sqlQuery = "SELECT MaGV AS 'Mã giảng viên', HoDem AS 'Họ đệm', Ten AS 'Tên', MatKhau AS 'Mật khẩu', Khoa AS 'Khoa', VaiTro AS 'Vai trò' FROM GIANGVIEN";
                            Load_dgv_GiangVien(sqlQuery);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        private void btn_ExportGV_Click(object sender, EventArgs e)
        {
            try
            {
                // Tạo một đối tượng SaveFileDialog để cho phép người dùng chọn vị trí và tên tệp Excel để lưu
                SaveFileDialog saveFileDialog = new SaveFileDialog
                {
                    Filter = "Excel Files|*.xlsx",
                    Title = "Export Data to Excel",
                    FileName = "GIANGVIEN_Data.xlsx"
                };

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    // Tạo một đối tượng ExcelPackage để tạo tệp Excel
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        // Tạo một trang tính mới
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("GIANGVIEN");

                        // Lấy số lượng cột và dòng trong DataGridView
                        int colCount = dgv_GiangVien.Columns.Count;
                        int rowCount = dgv_GiangVien.Rows.Count;

                        // Lấy header cho cột
                        for (int i = 1; i <= colCount; i++)
                        {
                            worksheet.Cells[1, i].Value = dgv_GiangVien.Columns[i - 1].HeaderText;
                        }

                        // Lấy dữ liệu từ DataGridView
                        for (int row = 0; row < rowCount; row++)
                        {
                            for (int col = 0; col < colCount; col++)
                            {
                                worksheet.Cells[row + 2, col + 1].Value = dgv_GiangVien.Rows[row].Cells[col].Value?.ToString();
                            }
                        }

                        // Lưu tệp Excel
                        FileInfo excelFile = new FileInfo(saveFileDialog.FileName);
                        package.SaveAs(excelFile);
                        MessageBox.Show("Dữ liệu đã được xuất thành công vào tệp Excel! Đường dẫn: " + excelFile.FullName);
                    }    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }
        #endregion

        //Chức năng Môn thi
        #region Chức năng Môn Thi
        private void dgv_MonThi_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            tb_MaHpMT.Text = dgv_MonThi[0, e.RowIndex].Value.ToString();
            tb_TenMonMT.Text = dgv_MonThi[1, e.RowIndex].Value.ToString();
            tb_SoCauMT.Text = dgv_MonThi[2, e.RowIndex].Value.ToString();
            tb_ThoiLuongMT.Text = dgv_MonThi[3, e.RowIndex].Value.ToString();
            dt_NgayThiMT.Text = dgv_MonThi[4, e.RowIndex].Value.ToString();
            dt_GioThiMT.Text = dgv_MonThi[5, e.RowIndex].Value.ToString();

            btn_SuaMT.Enabled = true;
            btn_XoaMT.Enabled = true;
            btn_LuuMT.Enabled = false;
            Description(false);
        }
        // Khai báo biến lưu trữ MaHP cũ
        private string oldMaHP;
        private void btn_LuuMT_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "";
                    if (btn_ThemMT.Enabled)
                    {
                        sql = "INSERT INTO MONTHI (MaHP, TenHP, SoCau, TGLamBai, NgayThi, GioThi) VALUES (@MaHP, @TenHP, @SoCau, @TGLamBai, @NgayThi, @GioThi)";
                    }
                    else if (btn_SuaMT.Enabled)
                    {
                        sql = "UPDATE MONTHI SET MaHP = @MaHP, TenHP = @TenHP, SoCau = @SoCau, TGLamBai = @TGLamBai, NgayThi = @NgayThi, GioThi = @GioThi WHERE MaHP = @OldMaHP";
                    }

                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.Parameters.AddWithValue("@MaHP", tb_MaHpMT.Text);
                        cmd.Parameters.AddWithValue("@TenHP", tb_TenMonMT.Text);
                        cmd.Parameters.AddWithValue("@SoCau", tb_SoCauMT.Text);
                        cmd.Parameters.AddWithValue("@TGLamBai", tb_ThoiLuongMT.Text);
                        cmd.Parameters.AddWithValue("@NgayThi", dt_NgayThiMT.Value);
                        cmd.Parameters.AddWithValue("@GioThi", dt_GioThiMT.Value);

                        // Thêm tham số cho MaHP trong trường hợp Sửa câu hỏi
                        if (btn_SuaMT.Enabled)
                        {
                            cmd.Parameters.AddWithValue("@OldMaHP", oldMaHP); // oldMaHP là giá trị MaHP cũ trước khi sửa
                        }
                        cmd.ExecuteNonQuery();
                    }

                    string message = "";
                    if (btn_ThemMT.Enabled)
                    {
                        message = "Thêm môn thi thành công!";
                    }
                    else if (btn_SuaMT.Enabled)
                    {
                        message = "Sửa môn thi thành công!";
                    }
                    MessageBox.Show(message);
                    string sqlQuery = "SELECT MaHP AS 'Mã học phần', TenHP AS 'Tên học phần', SoCau AS 'Số câu', TGLamBai AS 'Thời lượng', NgayThi AS 'Ngày thi', GioThi AS 'Giờ thi' FROM MONTHI";
                    Load_dgv_MonThi(sqlQuery);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
            Description(false);            
            btn_ThemMT.Enabled = true;
            btn_SuaMT.Enabled = true;
            btn_XoaMT.Enabled = true;
            btn_LuuMT.Enabled = false;
            btn_HuyMT.Enabled = false;           
        }

        private void btn_ThemMT_Click(object sender, EventArgs e)
        {
            Clean();
            Description(true);            
            dgv_MonThi.CurrentCell = dgv_MonThi[0, dgv_MonThi.RowCount - 1];
            tb_MaHpMT.Focus();
            btn_XoaMT.Enabled = false;
            btn_SuaMT.Enabled = false;
            btn_HuyMT.Enabled = true;
            btn_LuuMT.Enabled = true;           
        }

        private void btn_SuaMT_Click(object sender, EventArgs e)
        {
            btn_ThemMT.Enabled = false;
            btn_XoaMT.Enabled = false;
            btn_LuuMT.Enabled = true;
            btn_HuyMT.Enabled = true;
            Description(true);
            if (dgv_MonThi.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dgv_MonThi.SelectedRows[0];

                // Hiển thị giá trị của MaMT trong textbox
                tb_MaHpMT.Text = row.Cells["Mã học phần"].Value.ToString();

                // Lưu trữ giá trị của MaMT cũ
                oldMaHP = row.Cells["Mã học phần"].Value.ToString();
            }
        }

        private void btn_XoaMT_Click(object sender, EventArgs e)
        {
            try
            {
                // Hiển thị hộp thoại xác nhận
                DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa môn thi này không?\nNếu xóa môn thi này các câu hỏi, kết quả và bài thi liên quan tới môn thi cũng sẽ bị xóa.", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                // Nếu người dùng chọn Yes
                if (result == DialogResult.Yes)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string maHP = tb_MaHpMT.Text;

                        // Xóa dữ liệu từ bảng BAILAM
                        string sqlBAILAM = "DELETE FROM BAILAM WHERE MaHP = '" + maHP + "'";
                        using (SqlCommand cmdBAILAM = new SqlCommand(sqlBAILAM, connection))
                        {
                            cmdBAILAM.ExecuteNonQuery();
                        }

                        // Xóa dữ liệu từ bảng KETQUA
                        string sqlKETQUA = "DELETE FROM KETQUA WHERE MaHP = '" + maHP + "'";
                        using (SqlCommand cmdKETQUA = new SqlCommand(sqlKETQUA, connection))
                        {
                            cmdKETQUA.ExecuteNonQuery();
                        }

                        // Xóa dữ liệu từ bảng CAUHOI
                        string sqlCAUHOI = "DELETE FROM CAUHOI WHERE MaHP = '" + maHP + "'";
                        using (SqlCommand cmdCAUHOI = new SqlCommand(sqlCAUHOI, connection))
                        {
                            cmdCAUHOI.ExecuteNonQuery();
                        }

                        // Xóa dữ liệu từ bảng MONTHI
                        string sqlMONTHI = "DELETE FROM MONTHI WHERE MaHP = '" + maHP + "'";
                        using (SqlCommand cmdMONTHI = new SqlCommand(sqlMONTHI, connection))
                        {
                            cmdMONTHI.ExecuteNonQuery();
                        }

                        MessageBox.Show("Xóa môn thi thành công!");
                        string sqlQuery = "SELECT MaHP AS 'Mã học phần', TenHP AS 'Tên học phần', SoCau AS 'Số câu', TGLamBai AS 'Thời lượng', NgayThi AS 'Ngày thi', GioThi AS 'Giờ thi' FROM MONTHI";
                        Load_dgv_MonThi(sqlQuery);
                    }
                }                   
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
        }

        private void btn_HuyMT_Click(object sender, EventArgs e)
        {
            Clean();
            Description(false);
            btn_ThemMT.Enabled = true;
            btn_SuaMT.Enabled = true;
            btn_XoaMT.Enabled = true;
            btn_LuuMT.Enabled = false;
            btn_HuyMT.Enabled = false;  
        }
        private void btn_ImportMT_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog
                {
                    Filter = "Excel Files|*.xlsx;*.xls",
                    Title = "Select an Excel File"
                };

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string filePath = openFileDialog.FileName;

                    using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath)))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0]; // Lấy trang tính đầu tiên

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            // Thêm dữ liệu từ Excel vào bảng MONTHI
                            string insertQuery = "INSERT INTO MONTHI (MaHP, TenHP, SoCau, TGLamBai, NgayThi, GioThi) VALUES (@MaHP, @TenHP, @SoCau, @TGLamBai, @NgayThi, @GioThi)";
                            SqlCommand insertCommand = new SqlCommand(insertQuery, connection);

                            for (int row = worksheet.Dimension.Start.Row + 1; row <= worksheet.Dimension.End.Row; row++)
                            {
                                insertCommand.Parameters.Clear();
                                insertCommand.Parameters.AddWithValue("@MaHP", worksheet.Cells[row, 1].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@TenHP", worksheet.Cells[row, 2].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@SoCau", worksheet.Cells[row, 3].Value?.ToString());
                                insertCommand.Parameters.AddWithValue("@TGLamBai", worksheet.Cells[row, 4].Value?.ToString());

                                // Chuyển đổi giá trị NgayThi từ chuỗi sang DateTime
                                string ngayThiStr = worksheet.Cells[row, 5].Value?.ToString();
                                DateTime ngayThi;
                                if (DateTime.TryParse(ngayThiStr, out ngayThi))
                                {
                                    insertCommand.Parameters.AddWithValue("@NgayThi", ngayThi.Date);
                                }

                                // Chuyển đổi giá trị GioThi từ chuỗi sang TimeSpan
                                string gioThiStr = worksheet.Cells[row, 6].Value?.ToString();
                                TimeSpan gioThi;
                                if (TimeSpan.TryParse(gioThiStr, out gioThi))
                                {
                                    insertCommand.Parameters.AddWithValue("@GioThi", gioThi);
                                }

                                insertCommand.ExecuteNonQuery();
                            }

                            MessageBox.Show("Import dữ liệu từ Excel thành công!");
                            string sqlQuery = "SELECT MaHP AS 'Mã học phần', TenHP AS 'Tên học phần', SoCau AS 'Số câu', TGLamBai AS 'Thời lượng', NgayThi AS 'Ngày thi', GioThi AS 'Giờ thi' FROM MONTHI";
                            Load_dgv_MonThi(sqlQuery);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        private void btn_ExportMT_Click(object sender, EventArgs e)
        {
            try
            {
                // Tạo một đối tượng SaveFileDialog để cho phép người dùng chọn vị trí và tên tệp Excel để lưu
                SaveFileDialog saveFileDialog = new SaveFileDialog
                {
                    Filter = "Excel Files|*.xlsx",
                    Title = "Export Data to Excel",
                    FileName = "MONTHI_Data.xlsx"
                };

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    // Tạo một đối tượng ExcelPackage để tạo tệp Excel
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        // Tạo một trang tính mới
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("MONTHI");

                        // Lấy số lượng cột và dòng trong DataGridView
                        int colCount = dgv_MonThi.Columns.Count;
                        int rowCount = dgv_MonThi.Rows.Count;

                        // Lấy header cho cột
                        for (int i = 1; i <= colCount; i++)
                        {
                            worksheet.Cells[1, i].Value = dgv_MonThi.Columns[i - 1].HeaderText;
                        }

                        // Lấy dữ liệu từ DataGridView
                        for (int row = 0; row < rowCount; row++)
                        {
                            for (int col = 0; col < colCount; col++)
                            {
                                if (dgv_MonThi.Columns[col].Name == "Ngày thi") // Kiểm tra cột là cột Ngày thi
                                {
                                    // Sử dụng ToShortDateString để chỉ lấy phần ngày tháng từ giá trị DateTime
                                    worksheet.Cells[row + 2, col + 1].Value = dgv_MonThi.Rows[row].Cells[col].Value != null ? Convert.ToDateTime(dgv_MonThi.Rows[row].Cells[col].Value).ToShortDateString() : "";
                                }
                                else
                                {
                                    worksheet.Cells[row + 2, col + 1].Value = dgv_MonThi.Rows[row].Cells[col].Value?.ToString();
                                }
                            }
                        }

                        // Lưu tệp Excel
                        FileInfo excelFile = new FileInfo(saveFileDialog.FileName);
                        package.SaveAs(excelFile);
                        MessageBox.Show("Dữ liệu đã được xuất thành công vào tệp Excel! Đường dẫn: " + excelFile.FullName);
                    }                  
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }
        #endregion

        //Chức năng Tìm kiếm
        #region Chức năng Tìm Kiếm
        public void searchByMaHP()
        {
            String sql = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI WHERE MaHP LIKE '%" + cb_MonThiCH.Text + "%'";
            Load_dgv_CauHoi(sql);

        }

        private void cb_MonThiCH_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cb_MonThiCH.Text != "" && cb_MonThiCH.Text != "ALL")
            {
                searchByMaHP();
                tb_TimKiem_CauHoi.Text = "";
            }
            else
            {
                String sql = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI";
                Load_dgv_CauHoi(sql);
                tb_TimKiem_CauHoi.Text = "";
            }
        }

        private void tb_TimKiem_CauHoi_TextChanged(object sender, EventArgs e)
        {
            if (cb_MonThiCH.Text != "" && cb_MonThiCH.Text != "ALL")
            {
                searchByMaHP();
                String sql = "SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI WHERE MaHP LIKE '%" + cb_MonThiCH.Text + "%' AND MaCH LIKE '%" + tb_TimKiem_CauHoi.Text + "%'";
                Load_dgv_CauHoi(sql);
            }
            else
            {
                String sql = " SELECT MaCH AS 'Mã câu hỏi', MaHP AS 'Mã học phần', NoiDung AS 'Nội dung câu hỏi', DapAn AS 'Đáp án' FROM CAUHOI WHERE MaCH LIKE '%" + tb_TimKiem_CauHoi.Text + "%'";
                Load_dgv_CauHoi(sql);
            }
        }

        private void tb_TimKiem_MonThi_TextChanged(object sender, EventArgs e)
        {
            String sql = "SELECT MaHP AS 'Mã học phần', TenHP AS 'Tên học phần', SoCau AS 'Số câu', TGLamBai AS 'Thời lượng', NgayThi AS 'Ngày thi', GioThi AS 'Giờ thi' FROM MONTHI WHERE MaHP LIKE '%" + tb_TimKiem_MonThi.Text + "%' OR TenHP LIKE N'%" + tb_TimKiem_MonThi.Text + "%'";
            Load_dgv_MonThi(sql);
        }

        private void tb_TimKiem_SV_TextChanged(object sender, EventArgs e)
        {
            String sql = "SELECT MaSV AS 'Mã sinh viên', HoDem AS 'Họ đệm', Ten AS 'Tên',NgaySinh AS 'Ngày sinh', MatKhau AS 'Mật khẩu', Lop AS 'Lớp', Nganh AS 'Ngành', VaiTro AS 'Vai trò' FROM SINHVIEN WHERE MaSV LIKE '%" + tb_TimKiem_SV.Text + "%' OR Ten LIKE N'%" + tb_TimKiem_SV.Text + "%'";
            Load_dgv_SinhVien(sql);
        }

        private void tb_TimKiem_GV_TextChanged(object sender, EventArgs e)
        {
            String sql = "SELECT MaGV AS 'Mã giảng viên', HoDem AS 'Họ đệm', Ten AS 'Tên', MatKhau AS 'Mật khẩu', Khoa AS 'Khoa', VaiTro AS 'Vai trò' FROM GIANGVIEN WHERE MaGV LIKE '%" + tb_TimKiem_GV.Text + "%' OR Ten LIKE N'%" + tb_TimKiem_GV.Text + "%'";
            Load_dgv_GiangVien(sql);
        }

        public void reportByMaHP()
        {
            string sql = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', MONTHI.MaHP as 'Mã HP', MONTHI.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV INNER JOIN MONTHI ON KETQUA.MaHP = MONTHI.MaHP WHERE MONTHI.MaHP LIKE '%" + cbMaHPBC.Text + "%'";
            Load_dgv_BaoCao(sql);
        }
        
        private void cbMaHPBC_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbMaHPBC.Text != "" && cbMaHPBC.Text != "ALL")
            {
                reportByMaHP();
                tbMaSVBC.Text = "";
            }
            else
            {
                String sql = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', MONTHI.MaHP as 'Mã HP', MONTHI.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV INNER JOIN MONTHI ON KETQUA.MaHP = MONTHI.MaHP";
                Load_dgv_BaoCao(sql);
                tbMaSVBC.Text = "";
            }
        }

        private void tbMaSVBC_TextChanged(object sender, EventArgs e)
        {
            if (cbMaHPBC.Text != "" && cbMaHPBC.Text != "ALL")
            {
                reportByMaHP();
                String sql = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', MONTHI.MaHP as 'Mã HP', MONTHI.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV INNER JOIN MONTHI ON KETQUA.MaHP = MONTHI.MaHP WHERE MONTHI.MAHP LIKE '%" + cbMaHPBC.Text + "%' AND SINHVIEN.MaSV LIKE '%" + tbMaSVBC.Text + "%'";
                Load_dgv_BaoCao(sql);
            }
            else
            {
                String sql = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', MONTHI.MaHP as 'Mã HP', MONTHI.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV INNER JOIN MONTHI ON KETQUA.MaHP = MONTHI.MaHP WHERE SINHVIEN.MaSV LIKE '%" + tbMaSVBC.Text + "%'";
                Load_dgv_BaoCao(sql);
            }
        }
        private void tbLopBC_TextChanged(object sender, EventArgs e)
        {
            if (cbMaHPBC.Text != "" && cbMaHPBC.Text != "ALL")
            {
                reportByMaHP();
                String sql = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', MONTHI.MaHP as 'Mã HP', MONTHI.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV INNER JOIN MONTHI ON KETQUA.MaHP = MONTHI.MaHP WHERE MONTHI.MaHP LIKE '%" + cbMaHPBC.Text + "%' AND SINHVIEN.Lop LIKE '%" + tbLopBC.Text + "%'";
                Load_dgv_BaoCao(sql);
            }
            else
            {
                String sql = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', MONTHI.MaHP as 'Mã HP', MONTHI.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV INNER JOIN MONTHI ON KETQUA.MaHP = MONTHI.MaHP WHERE SINHVIEN.Lop LIKE '%" + tbLopBC.Text + "%'";
                Load_dgv_BaoCao(sql);
            }
        }

        #endregion

        //Chức năng Báo cáo
        #region Chức năng Báo cáo
        private void btn_BangDiem_Click(object sender, EventArgs e)
        {
            Clean();
            Description(true);
            btnXuatBangDiem.Enabled = true;
            // Thực hiện load dữ liệu cụ thể cho bảng điểm
            string sqlQuery = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', KETQUA.MaHP as 'Mã HP', KETQUA.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV";
            Load_dgv_BaoCao(sqlQuery);
        }

        private void dgv_BaoCao_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnXuatBaiThi.Enabled = true;
            btn_XoaBaiThi.Enabled = true;
        }

        private void dgv_BaoCao_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow selectedRow = dgv_BaoCao.Rows[e.RowIndex];

            // Lấy thông tin từ dòng được chọn
            thongtinBaiThi.MaSV = selectedRow.Cells["Mã SV"].Value.ToString();
            thongtinBaiThi.MaHP = selectedRow.Cells["Mã HP"].Value.ToString();
            thongtinBaiThi.Diem = selectedRow.Cells["Điểm"].Value.ToString();

            // Mở form ChiTiet
            ChiTiet chiTietForm = new ChiTiet();
            chiTietForm.Show();
        }

        private void btnXuatBangDiem_Click(object sender, EventArgs e)
        {
            try
            {
                // Tạo một đối tượng SaveFileDialog để cho phép người dùng chọn vị trí và tên tệp Excel để lưu
                SaveFileDialog saveFileDialog = new SaveFileDialog
                {
                    Filter = "Excel Files|*.xlsx",
                    Title = "Export Data to Excel",
                    FileName = "BANGDIEM_Data.xlsx"
                };

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    // Tạo một đối tượng ExcelPackage để tạo tệp Excel
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        // Tạo một trang tính mới
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("BANGDIEM");

                        // Lấy số lượng cột và dòng trong DataGridView
                        int colCount = dgv_BaoCao.Columns.Count;
                        int rowCount = dgv_BaoCao.Rows.Count;

                        // Lấy header cho cột
                        for (int i = 1; i <= colCount; i++)
                        {
                            worksheet.Cells[1, i].Value = dgv_BaoCao.Columns[i - 1].HeaderText;
                        }

                        // Lấy dữ liệu từ DataGridView
                        for (int row = 0; row < rowCount; row++)
                        {
                            for (int col = 0; col < colCount; col++)
                            {
                                if (dgv_BaoCao.Columns[col].Name == "Ngày sinh") // Kiểm tra cột là cột Ngày sinh
                                {
                                    // Sử dụng ToShortDateString để chỉ lấy phần ngày tháng từ giá trị DateTime
                                    worksheet.Cells[row + 2, col + 1].Value = dgv_BaoCao.Rows[row].Cells[col].Value != null ? Convert.ToDateTime(dgv_BaoCao.Rows[row].Cells[col].Value).ToShortDateString() : "";
                                }
                                else
                                {
                                    worksheet.Cells[row + 2, col + 1].Value = dgv_BaoCao.Rows[row].Cells[col].Value?.ToString();
                                }
                            }
                        }

                        // Lưu tệp Excel
                        FileInfo excelFile = new FileInfo(saveFileDialog.FileName);
                        package.SaveAs(excelFile);
                        MessageBox.Show("Dữ liệu đã được xuất thành công vào tệp Excel! Đường dẫn: " + excelFile.FullName);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
        }

        private void btnXuatBaiThi_Click(object sender, EventArgs e)
        {
            // Lấy thông tin từ dòng được chọn
            DataGridViewRow selectedRow = dgv_BaoCao.SelectedRows[0];

            // Tạo đối tượng BaiThi và gán thông tin
            BaiThi baiThi = new BaiThi
            {
                MaSV = selectedRow.Cells["Mã SV"].Value.ToString(),
                MaHP = selectedRow.Cells["Mã HP"].Value.ToString(),
            };

            // Chuyển hướng sang form PrintBaiThi và truyền các giá trị cần thiết
            PrintBaiThi printForm = new PrintBaiThi(baiThi.MaSV, baiThi.MaHP);
            printForm.Show();
        }

        private void btn_XoaBaiThi_Click(object sender, EventArgs e)
        {
            try
            {
                // Hiển thị hộp thoại xác nhận
                DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa kết quả bài thi này không?", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                // Nếu người dùng chọn Yes
                if (result == DialogResult.Yes)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        // Lấy MaSV và MaHP từ dòng được chọn trong DataGridView
                        string maSV = dgv_BaoCao.SelectedRows[0].Cells["Mã SV"].Value.ToString();
                        string maHP = dgv_BaoCao.SelectedRows[0].Cells["Mã HP"].Value.ToString();

                        // Xây dựng câu lệnh SQL để xóa bản ghi trong bảng KETQUA
                        string sqlDeleteKETQUA = "DELETE FROM KETQUA WHERE MaSV = @MaSV AND MaHP = @MaHP";
                        using (SqlCommand cmdDeleteKETQUA = new SqlCommand(sqlDeleteKETQUA, connection))
                        {
                            cmdDeleteKETQUA.Parameters.AddWithValue("@MaSV", maSV);
                            cmdDeleteKETQUA.Parameters.AddWithValue("@MaHP", maHP);
                            cmdDeleteKETQUA.ExecuteNonQuery();
                        }

                        // Xây dựng câu lệnh SQL để xóa bản ghi trong bảng BAILAM
                        string sqlDeleteBAILAM = "DELETE FROM BAILAM WHERE MaSV = @MaSV AND MaHP = @MaHP";
                        using (SqlCommand cmdDeleteBAILAM = new SqlCommand(sqlDeleteBAILAM, connection))
                        {
                            cmdDeleteBAILAM.Parameters.AddWithValue("@MaSV", maSV);
                            cmdDeleteBAILAM.Parameters.AddWithValue("@MaHP", maHP);
                            cmdDeleteBAILAM.ExecuteNonQuery();
                        }

                        MessageBox.Show("Đã xóa kết quả bài thi thành công!");
                        string sqlQuery = "SELECT SINHVIEN.MaSV as 'Mã SV', SINHVIEN.HoDem as 'Họ đệm', SINHVIEN.Ten as 'Tên', SINHVIEN.NgaySinh as 'Ngày sinh', SINHVIEN.Lop as 'Lớp', KETQUA.MaHP as 'Mã HP', KETQUA.TenHP as 'Tên học phần', KETQUA.Diem AS 'Điểm', KETQUA.LanThi as 'Lần thi' FROM KETQUA INNER JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV";
                        Load_dgv_BaoCao(sqlQuery);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
            }
            Clean();
        }
        #endregion

        //Đăng xuất
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
