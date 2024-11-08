using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;

namespace HUNRE
{
    public partial class PrintBaiThi : Form
    {
        // Chuỗi kết nối
        string connectionString = ConfigurationManager.ConnectionStrings["HUNRE.Properties.Settings.TRACNGHIEMConnectionString"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        // Biến lưu trữ các giá trị truyền từ form trước
        string maSV;
        string maHP;

        public PrintBaiThi(string maSV, string maHP)
        {
            InitializeComponent();

            // Lưu các giá trị được truyền từ form trước
            this.maSV = maSV;
            this.maHP = maHP;
        }


        private void ReportBaiThi_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    reportViewer1.LocalReport.ReportEmbeddedResource = "HUNRE.ReportBaiThi.rdlc";
                    reportViewer1.LocalReport.DataSources.Clear();
                    string sqlQueryTT = @"SELECT SV.MaSV, SV.HoDem, SV.Ten, SV.Lop, KQ.MaHP, KQ.TenHP, KQ.SoCau, KQ.TGLamBai, KQ.NgayThi, KQ.GioThi, KQ.Diem, KQ.TGNopBai FROM SINHVIEN SV INNER JOIN KETQUA KQ ON SV.MaSV = KQ.MaSV WHERE SV.MaSV = @MaSV AND KQ.MaHP = @MaHP";

                    using (SqlCommand command = new SqlCommand(sqlQueryTT, connection))
                    {
                        command.Parameters.AddWithValue("@MaSV", maSV);
                        command.Parameters.AddWithValue("@MaHP", maHP);

                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable THONGTIN = new DataTable();

                        adapter.Fill(THONGTIN);
                        reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("ThongTinData", THONGTIN));

                    }

                    string sqlQueryDT = @"SELECT CauSo, MaCH, NoiDung, DapAn, TraLoi FROM BAILAM WHERE MaSV = @MaSV AND MaHP = @MaHP ORDER BY CauSo;";

                    using (SqlCommand command = new SqlCommand(sqlQueryDT, connection))
                    {
                        command.Parameters.AddWithValue("@MaSV", maSV);
                        command.Parameters.AddWithValue("@MaHP", maHP);

                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable DETHI = new DataTable();

                        adapter.Fill(DETHI);
                        reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DeThiData", DETHI));
                    }
                    reportViewer1.RefreshReport();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
