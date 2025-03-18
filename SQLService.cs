using POSSystem.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class SQLService
    {
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

        public static List<Parameters> GetColorList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["POSConnect"].ConnectionString;
            List<Parameters> colorList = new List<Parameters>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // 執行SQL命令
                string SQL = "SELECT * FROM Parameters WHERE [Category] = 'COLOR'";

                using (SqlCommand command = new SqlCommand(SQL, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Parameters parameter = new Parameters
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                ParentId = reader.IsDBNull(reader.GetOrdinal("ParentId")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("ParentId")),
                                Code = reader.GetString(reader.GetOrdinal("Code")),
                                Name = reader.GetString(reader.GetOrdinal("Name")),
                                Value = reader.IsDBNull(reader.GetOrdinal("Value")) ? null : reader.GetString(reader.GetOrdinal("Value")),
                                Type = reader.IsDBNull(reader.GetOrdinal("Type")) ? null : reader.GetString(reader.GetOrdinal("Type")),
                                Description = reader.IsDBNull(reader.GetOrdinal("Description")) ? null : reader.GetString(reader.GetOrdinal("Description")),
                                Category = reader.GetString(reader.GetOrdinal("Category")),
                                Status = reader.GetByte(reader.GetOrdinal("Status")),
                                BarCode = reader.GetString(reader.GetOrdinal("BarCode")),
                                CreatedDate = reader.GetDateTime(reader.GetOrdinal("CreatedDate")),
                                UpdatedDate = reader.GetDateTime(reader.GetOrdinal("UpdatedDate"))
                            };

                            colorList.Add(parameter);
                        }
                    }
                }
            }

            return colorList;
        }
    }
}
