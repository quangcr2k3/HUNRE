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
    public partial class Baithi : Form
    {
        // Chuỗi kết nối
        string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        private int remainingSeconds; // Biến đếm thời gian còn lại
        private List<string> maCHRandom = new List<string>(); // Mảng để lưu trữ các MaCH đã random

        public Baithi()
        {
            InitializeComponent();
        }

        private void Baithi_Load(object sender, EventArgs e)
        {
            // Kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Tạo một đối tượng DataTable để lưu trữ kết quả từ cơ sở dữ liệu
                DataTable dtSV = new DataTable();
                DataTable dtMT = new DataTable();

                // Lấy thông tin thí sinh
                // 1. Nhận thông tin Mã sinh viên từ form login và mã học phần từ usercontrol List môn thi thông qua class public
                string maSV = thongtinSV.MaSV;
                string maHP = thongtinMT.MaHP;

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
                string sqlMT = "SELECT * FROM MONTHI WHERE MaHP = @MaHP";
                // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
                SqlCommand cmdMT = new SqlCommand(sqlMT, connection);
                cmdMT.Parameters.AddWithValue("@MaHP", maHP);

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

                    // Số câu của môn thi
                    int soCauMonThi = Convert.ToInt32(dtMT.Rows[0]["SoCau"]);

                    // Tạo và cấu hình các ListDapAn
                    for (int i = 0; i < soCauMonThi; i++)
                    {
                        // Tạo một ListDapAn mới
                        ListDapAn listDapAn = new ListDapAn();
                        // Cấu hình các thuộc tính của ListDapAn nếu cần

                        // Cập nhật nội dung của lbCauSo
                        listDapAn.LabelCauSo.Text = "Câu " + (i + 1) + ":";

                        // Thêm ListDapAn vào flpDapAn
                        flpDapAn.Controls.Add(listDapAn);
                    }
                    // Truy vấn câu hỏi từ cơ sở dữ liệu
                    string sqlCauHoi = "SELECT TOP (@SoCau) * FROM CAUHOI WHERE MaHP = @MaHP ORDER BY NEWID()";
                    SqlCommand cmdCauHoi = new SqlCommand(sqlCauHoi, connection);
                    cmdCauHoi.Parameters.AddWithValue("@SoCau", soCauMonThi); // Số lượng câu hỏi cần lấy
                    cmdCauHoi.Parameters.AddWithValue("@MaHP", maHP);
                    SqlDataAdapter adapterCauHoi = new SqlDataAdapter(cmdCauHoi);
                    DataTable dtCauHoi = new DataTable();
                    adapterCauHoi.Fill(dtCauHoi);

                    // Kiểm tra nếu có ít nhất một câu hỏi được trả về
                    if (dtCauHoi.Rows.Count > 0)
                    {
                        // Duyệt qua từng hàng câu hỏi và hiển thị chúng trong FlowLayoutPanel
                        for (int i = 0; i < dtCauHoi.Rows.Count; i++)
                        {
                            // Lưu trữ MaCH vào mảng
                            string maCH = dtCauHoi.Rows[i]["MaCH"].ToString();
                            maCHRandom.Add(maCH);

                            // Tạo một ListCauHoi mới
                            ListCauHoi listCauHoi = new ListCauHoi();

                            // Hiển thị số thứ tự câu hỏi
                            listCauHoi.LabelCauSo.Text = "Câu " + (i + 1) + ":";

                            // Hiển thị nội dung câu hỏi
                            listCauHoi.LabelNoiDungCH.Text = dtCauHoi.Rows[i]["NoiDung"].ToString();

                            // Thiết lập thuộc tính Anchor để giữ cố định chiều trái, trên, và phải
                            listCauHoi.Anchor = AnchorStyles.Left | AnchorStyles.Top | AnchorStyles.Right;

                            // Thiết lập thuộc tính AutoSize để tự động điều chỉnh chiều cao dựa trên nội dung
                            listCauHoi.AutoSize = true;


                            // Thêm ListCauHoi vào FlowLayoutPanel
                            flpCauHoi.Controls.Add(listCauHoi);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Không có câu hỏi nào được tìm thấy!");
                    }
                }

                // Chuyển đổi thời gian làm bài từ định dạng phút sang giờ:phút:giây
                int totalTimeInMinutes = Convert.ToInt32(dtMT.Rows[0]["TGLamBai"]);
                TimeSpan timeSpan = TimeSpan.FromMinutes(totalTimeInMinutes);

                // Cập nhật nội dung cho ba label lbGio, lbPhut, lbGiay
                lbGio.Text = timeSpan.Hours.ToString("D2");
                lbPhut.Text = timeSpan.Minutes.ToString("D2");
                lbGiay.Text = timeSpan.Seconds.ToString("D2");

                // Gán thời gian còn lại bằng tổng số giây
                remainingSeconds = (int)timeSpan.TotalSeconds;

                // Khởi động Timer
                timer1.Start();
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            // Giảm biến đếm thời gian đi một giây
            remainingSeconds--;

            if (remainingSeconds >= 0)
            {
                // Chuyển đổi thời gian còn lại thành định dạng giờ:phút:giây
                TimeSpan timeSpan = TimeSpan.FromSeconds(remainingSeconds);

                // Cập nhật nội dung cho ba label lbGio, lbPhut, lbGiay
                lbGio.Text = timeSpan.Hours.ToString("D2");
                lbPhut.Text = timeSpan.Minutes.ToString("D2");
                lbGiay.Text = timeSpan.Seconds.ToString("D2");
            }
            else
            {
                // Khi thời gian còn lại đạt 0, bạn có thể thực hiện các hành động kết thúc bài thi ở đây
                timer1.Stop(); // Dừng Timer
                MessageBox.Show("Đã hết thời gian làm bài!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                // Khai báo mảng để lưu đáp án của người dùng
                string[] userAnswers = new string[maCHRandom.Count];
                int[] cauSoList = new int[maCHRandom.Count]; // Mảng để lưu số thứ tự câu hỏi

                // Lặp qua các ListDapAn để lấy đáp án đã chọn của người dùng và lưu vào mảng
                for (int i = 0; i < maCHRandom.Count; i++)
                {
                    ListDapAn listDapAn = (ListDapAn)flpDapAn.Controls[i];
                    userAnswers[i] = listDapAn.GetSelectedAnswer();
                    // Trích xuất số thứ tự câu hỏi từ LabelCauSo
                    string cauSo = listDapAn.LabelCauSo.Text.Replace("Câu ", "").Replace(":", ""); // Loại bỏ "Câu " và ":" để chỉ lấy số
                    cauSoList[i] = int.Parse(cauSo); // Chuyển đổi sang kiểu số nguyên
                }

                // Khai báo biến để đếm số câu đúng và tính điểm
                int correctAnswers = 0;

                // Duyệt qua từng câu hỏi và so sánh đáp án của người dùng với đáp án đúng từ cơ sở dữ liệu
                for (int i = 0; i < maCHRandom.Count; i++)
                {
                    // Lấy đáp án đúng của câu hỏi từ cơ sở dữ liệu
                    string correctAnswer = GetCorrectAnswer(maCHRandom[i]);

                    // So sánh đáp án của người dùng với đáp án đúng
                    if (userAnswers[i] == correctAnswer)
                    {
                        // Nếu đáp án đúng, tăng biến đếm số câu đúng lên 1
                        correctAnswers++;
                    }
                }

                // Tính điểm
                double score = (double)correctAnswers / maCHRandom.Count * 10;

                // Làm tròn điểm tới 2 chữ số thập phân
                score = Math.Round(score, 2);

                // Lưu thông tin bài làm vào CSDL
                SaveExamResult(thongtinSV.MaSV, maCHRandom, userAnswers.ToList(), cauSoList.ToList(), thongtinMT.MaHP, score);

                // Hiển thị kết quả
                MessageBox.Show($"Số câu đúng: {correctAnswers}/{maCHRandom.Count}\nĐiểm số: {score}", "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Đóng Form BaiThi
                this.Close();
            }
        }

        // Phương thức để lưu thông tin bài làm vào CSDL
        private void SaveExamResult(string maSV, List<string> maCHList, List<string> traLoiList, List<int> cauSoList, string maHP, double diem)
        {
            // Lấy thời gian hiện tại
            DateTime tgNopBai = DateTime.Now;

            // Kết nối đến CSDL
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Bắt đầu một giao dịch để đảm bảo tính nhất quán dữ liệu
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Tạo một đối tượng SqlCommand để thực hiện các truy vấn
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.Transaction = transaction;

                    // Thêm thông tin vào bảng BAILAM
                    for (int i = 0; i < maCHList.Count; i++)
                    {
                        string sqlBaiLam = "INSERT INTO BAILAM (CauSo, MaSV, MaHP, MaCH, NoiDung, DapAn, TraLoi) VALUES (@CauSo, @MaSV, @MaHP, @MaCH, @NoiDung, @DapAn, @TraLoi)";
                        cmd.CommandText = sqlBaiLam;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@CauSo", cauSoList[i]);
                        cmd.Parameters.AddWithValue("@MaSV", maSV);
                        cmd.Parameters.AddWithValue("@MaHP", maHP);
                        cmd.Parameters.AddWithValue("@MaCH", maCHList[i]);
                        // Lấy nội dung từ bảng CAUHOI dựa vào MaCH
                        string noiDung = GetQuestionContent(maCHList[i]);
                        cmd.Parameters.AddWithValue("@NoiDung", noiDung);
                        // Lấy đáp án từ bảng CAUHOI dựa vào MaCH
                        string dapAn = GetCorrectAnswer(maCHList[i]);
                        cmd.Parameters.AddWithValue("@DapAn", dapAn);
                        cmd.Parameters.AddWithValue("@TraLoi", traLoiList[i]);
                        cmd.ExecuteNonQuery();
                    }

                    // Thêm thông tin vào bảng KETQUA
                    string sqlKetQua = "INSERT INTO KETQUA (MaSV, MaHP, TenHP, SoCau, TGLamBai, NgayThi, GioThi, Diem, LanThi, TGNopBai) VALUES (@MaSV, @MaHP, @TenHP, @SoCau, @TGLamBai, @NgayThi, @GioThi, @Diem, @LanThi, @TGNopBai)";
                    cmd.CommandText = sqlKetQua;
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@MaSV", maSV);
                    cmd.Parameters.AddWithValue("@MaHP", maHP);
                    // Lấy thông tin từ bảng MONTHI dựa vào MaHP
                    string sqlThongTinMonThi = "SELECT TenHP, SoCau, TGLamBai, NgayThi, GioThi FROM MONTHI WHERE MaHP = @MaHP";
                    SqlCommand cmdThongTinMonThi = new SqlCommand(sqlThongTinMonThi, connection, transaction);
                    cmdThongTinMonThi.Parameters.AddWithValue("@MaHP", maHP);
                    // Thực hiện truy vấn và đọc dữ liệu
                    using (SqlDataReader reader = cmdThongTinMonThi.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Gán giá trị của các cột từ bảng MONTHI cho các tham số của câu lệnh chèn dữ liệu vào bảng KETQUA
                            cmd.Parameters.AddWithValue("@TenHP", reader["TenHP"].ToString());
                            cmd.Parameters.AddWithValue("@SoCau", Convert.ToInt32(reader["SoCau"]));
                            cmd.Parameters.AddWithValue("@TGLamBai", Convert.ToInt32(reader["TGLamBai"]));
                            cmd.Parameters.AddWithValue("@NgayThi", Convert.ToDateTime(reader["NgayThi"]));
                            cmd.Parameters.AddWithValue("@GioThi", TimeSpan.Parse(reader["GioThi"].ToString()));
                        }
                    }
                    cmd.Parameters.AddWithValue("@Diem", diem);

                    // Tạo truy vấn để đếm số lần thi đã lưu trong CSDL
                    string sqlCountLanThi = "SELECT COUNT(*) FROM KETQUA WHERE MaSV = @MaSV AND MaHP = @MaHP";
                    SqlCommand cmdCountLanThi = new SqlCommand(sqlCountLanThi, connection, transaction);
                    cmdCountLanThi.Parameters.AddWithValue("@MaSV", maSV);
                    cmdCountLanThi.Parameters.AddWithValue("@MaHP", maHP);

                    // Thực hiện truy vấn và lấy số bản ghi trả về
                    int numberOfRecords = Convert.ToInt32(cmdCountLanThi.ExecuteScalar());

                    // Tăng lần thi lên 1 nếu có ít nhất một bản ghi tồn tại
                    int lanThi = (numberOfRecords > 0) ? (numberOfRecords + 1) : 1;

                    // Tiếp tục với thêm giá trị LanThi vào truy vấn chèn dữ liệu
                    cmd.Parameters.AddWithValue("@LanThi", lanThi);
                    cmd.Parameters.AddWithValue("@TGNopBai", tgNopBai);
                    cmd.ExecuteNonQuery();

                    // Hoàn thành giao dịch
                    transaction.Commit();

                    MessageBox.Show("Lưu thông tin bài thi thành công!");
                }
                catch (Exception ex)
                {
                    // Nếu có lỗi xảy ra, rollback giao dịch
                    transaction.Rollback();
                    MessageBox.Show("Lỗi khi lưu thông tin bài thi: " + ex.Message);
                }
            }
        }

        private void btn_Done_Click(object sender, EventArgs e)
        {
            // Hiển thị hộp thoại xác nhận
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn nộp bài không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            // Kiểm tra xem người dùng đã chọn Yes hay không
            if (result == DialogResult.Yes)
            {
                // Dừng timer
                timer1.Stop();
                // Khai báo mảng để lưu đáp án của người dùng
                string[] userAnswers = new string[maCHRandom.Count];
                int[] cauSoList = new int[maCHRandom.Count]; // Mảng để lưu số thứ tự câu hỏi

                // Lặp qua các ListDapAn để lấy đáp án đã chọn của người dùng và lưu vào mảng
                for (int i = 0; i < maCHRandom.Count; i++)
                {
                    ListDapAn listDapAn = (ListDapAn)flpDapAn.Controls[i];
                    userAnswers[i] = listDapAn.GetSelectedAnswer();
                    // Trích xuất số thứ tự câu hỏi từ LabelCauSo
                    string cauSo = listDapAn.LabelCauSo.Text.Replace("Câu ", "").Replace(":", ""); // Loại bỏ "Câu " và ":" để chỉ lấy số
                    cauSoList[i] = int.Parse(cauSo); // Chuyển đổi sang kiểu số nguyên
                }

                // Khai báo biến để đếm số câu đúng và tính điểm
                int correctAnswers = 0;

                // Duyệt qua từng câu hỏi và so sánh đáp án của người dùng với đáp án đúng từ cơ sở dữ liệu
                for (int i = 0; i < maCHRandom.Count; i++)
                {
                    // Lấy đáp án đúng của câu hỏi từ cơ sở dữ liệu
                    string correctAnswer = GetCorrectAnswer(maCHRandom[i]);

                    // So sánh đáp án của người dùng với đáp án đúng
                    if (userAnswers[i] == correctAnswer)
                    {
                        // Nếu đáp án đúng, tăng biến đếm số câu đúng lên 1
                        correctAnswers++;
                    }
                }

                // Tính điểm
                double score = (double)correctAnswers / maCHRandom.Count * 10;

                // Làm tròn điểm tới 2 chữ số thập phân
                score = Math.Round(score, 2);

                // Lưu thông tin bài làm vào CSDL
                SaveExamResult(thongtinSV.MaSV, maCHRandom, userAnswers.ToList(), cauSoList.ToList(), thongtinMT.MaHP, score);

                // Hiển thị kết quả
                MessageBox.Show($"Số câu đúng: {correctAnswers}/{maCHRandom.Count}\nĐiểm số: {score}", "Kết quả", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Đóng Form BaiThi
                this.Close();
            }
            // Nếu người dùng chọn No, không làm gì cả, đóng hộp thoại
        }


        private void BaiThi_FormClosed(object sender, FormClosedEventArgs e)
        {
            // Mở lại Form Student
            Student studentForm = new Student();
            studentForm.Show();
        }

        // Phương thức để lấy đáp án đúng của một câu hỏi dựa vào MaCH
        private string GetCorrectAnswer(string maCH)
        {
            string correctAnswer = ""; // Khởi tạo đáp án đúng

            // Kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Truy vấn để lấy đáp án của câu hỏi dựa vào MaCH
                string sql = "SELECT DapAn FROM CAUHOI WHERE MaCH = @MaCH";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@MaCH", maCH);

                // Thực thi truy vấn và lấy đáp án đúng
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    correctAnswer = result.ToString();
                }
            }

            return correctAnswer;
        }

        private string GetQuestionContent(string maCH)
        {
            string questionContent = ""; // Khởi tạo nội dung câu hỏi

            // Kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Truy vấn để lấy nội dung của câu hỏi dựa vào MaCH
                string sql = "SELECT NoiDung FROM CAUHOI WHERE MaCH = @MaCH";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@MaCH", maCH);

                // Thực thi truy vấn và lấy nội dung của câu hỏi
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    questionContent = result.ToString();
                }
            }

            return questionContent;
        }
    }
}
