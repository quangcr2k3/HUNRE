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
    public partial class ListCH_DA : UserControl
    {
        public ListCH_DA()
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

        public Label LabelDapAn
        {
            get { return lbDapAn; }
        }
    }
}
