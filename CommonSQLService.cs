using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class CommonSQLService
    {
        public static List<T> ExecuteQuery<T>(string sql, Func<SqlDataReader, List<T>> readFunc, List<SqlParameter> parameters = null)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["POSConnect"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters.ToArray());
                    }
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        return readFunc(reader);
                    }
                }
            }
        }
    }
}
