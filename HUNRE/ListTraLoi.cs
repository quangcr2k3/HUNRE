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
    public partial class ListTraLoi : UserControl
    {
        public ListTraLoi()
        {
            InitializeComponent();
        }
        public Label LabelCauSo
        {
            get { return lbCauSo; }
        }

        public RadioButton Rd_A
        {
            get { return rd_A; }
        }

        public RadioButton Rd_B
        {
            get { return rd_B; }
        }

        public RadioButton Rd_C
        {
            get { return rd_C; }
        }

        public RadioButton Rd_D
        {
            get { return rd_D; }
        }
    }
}
