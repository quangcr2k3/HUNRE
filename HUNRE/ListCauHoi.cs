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
    public partial class ListCauHoi : UserControl
    {
        public ListCauHoi()
        {
            InitializeComponent();
        }

        public Label LabelCauSo
        {
            get { return lbCauSo; }
        }

        public Label LabelNoiDungCH
        {
            get { return lbNoiDungCH; }
        }
    }
}
