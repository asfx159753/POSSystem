using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class SQLService
    {

        /// <summary>
        /// 登入帳號檢查
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static bool LoginCheck(string account, string password) 
        {
            string connectionString = ConfigurationManager.ConnectionStrings["POSConnect"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // 執行SQL命令
                string SQL = "SELECT COUNT(*) FROM [SYS_User] WHERE [Account] = @Account AND [Password] = @Password";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@Account",(object)account??DBNull.Value),
                    new SqlParameter("@Password",(object)password??DBNull.Value),
                };

                using (SqlCommand command = new SqlCommand(SQL, connection))
                {
                    command.Parameters.AddRange(parameters.ToArray());
                    int count = (int)command.ExecuteScalar();

                    // 如果count大於0，表示有符合的資料，返回TRUE；否則返回FALSE
                    bool exists = count > 0;

                    return exists;
                }
            }
        }
    }
}
