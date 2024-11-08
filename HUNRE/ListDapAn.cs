using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HUNRE
{
    public partial class ListDapAn : UserControl
    {
        public ListDapAn()
        {
            InitializeComponent();
        }

        public Label LabelCauSo
        {
            get { return lbCauSo; }
        }
        // Trong class ListDapAn
        public string GetSelectedAnswer()
        {
            // Kiểm tra xem RadioButton nào được chọn và trả về đáp án tương ứng
            if (rd_A.Checked)
            {
                return "A";
            }
            else if (rd_B.Checked)
            {
                return "B";
            }
            else if (rd_C.Checked)
            {
                return "C";
            }
            else if (rd_D.Checked)
            {
                return "D";
            }
            else
            {
                // Nếu không có RadioButton nào được chọn, trả về ký tự rỗng
                return "";
            }
        }

    }
}
