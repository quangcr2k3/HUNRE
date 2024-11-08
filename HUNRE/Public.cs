using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HUNRE
{
    public struct thongtinSV
    {
        public static string MaSV;
    }
    public struct thongtinMT 
    {
        public static string MaHP;
    }
    public struct thongtinBaiThi
    {
        public static string MaSV;
        public static string MaHP;
        public static string Diem;
    }
    class BaiThi
    {
        public string MaSV {  get; set; }
        public string MaHP { get; set; }
        public string Diem { get; set; }
    }
}
