using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Microsoft.Data.SqlClient;

namespace UTEid.Database
{
    class MY_DB
    {
        // Chuỗi kết nối bạn vừa lấy từ Properties
        // Lưu ý: Thêm @ trước chuỗi để xử lý các ký tự đặc biệt như dấu gạch chéo
        private SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=UTEid;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");

        // Hàm lấy kết nối
        public SqlConnection getConnection
        {
            get { return con; }
        }

        // Hàm mở kết nối
        public void openConnection()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        // Hàm đóng kết nối
        public void closeConnection()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}