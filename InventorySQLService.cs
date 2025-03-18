using POSSystem.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class InventorySQLService
    {
        public static List<Parameters> GetColorList()
        {
            string SQL = "SELECT * FROM Parameters WHERE [Category] = 'COLOR'";

            return CommonSQLService.ExecuteQuery(SQL, reader =>
            {
                List<Parameters> colorList = new List<Parameters>();
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
                return colorList;
            });
        }

        internal static List<Parameters> GetCategoryList()
        {
            string SQL = "SELECT * FROM Parameters WHERE [Category] = 'PRODUCT_TYPE'";

            return CommonSQLService.ExecuteQuery(SQL, reader =>
            {
                List<Parameters> CategoryList = new List<Parameters>();
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

                    CategoryList.Add(parameter);
                }
                return CategoryList;
            });
        }

        internal static List<Supplier> GetSupplierList()
        {
            string SQL = "SELECT * FROM Supplier";

            return CommonSQLService.ExecuteQuery(SQL, reader =>
            {
                List<Supplier> supplierList = new List<Supplier>();
                while (reader.Read())
                {
                    Supplier supplier = new Supplier
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("Id")),
                        Code = reader.GetString(reader.GetOrdinal("Code")),
                        Name = reader.GetString(reader.GetOrdinal("Name")),
                        ContactPerson = reader.IsDBNull(reader.GetOrdinal("ContactPerson")) ? null : reader.GetString(reader.GetOrdinal("ContactPerson")),
                        Phone = reader.IsDBNull(reader.GetOrdinal("Phone")) ? null : reader.GetString(reader.GetOrdinal("Phone")),
                        Email = reader.IsDBNull(reader.GetOrdinal("Email")) ? null : reader.GetString(reader.GetOrdinal("Email")),
                        Address = reader.IsDBNull(reader.GetOrdinal("Address")) ? null : reader.GetString(reader.GetOrdinal("Address")),
                        City = reader.IsDBNull(reader.GetOrdinal("City")) ? null : reader.GetString(reader.GetOrdinal("City")),
                        Country = reader.IsDBNull(reader.GetOrdinal("Country")) ? null : reader.GetString(reader.GetOrdinal("Country")),
                        Website = reader.IsDBNull(reader.GetOrdinal("Website")) ? null : reader.GetString(reader.GetOrdinal("Website")),
                        BusinessType = reader.IsDBNull(reader.GetOrdinal("BusinessType")) ? null : reader.GetString(reader.GetOrdinal("BusinessType")),
                        TaxId = reader.IsDBNull(reader.GetOrdinal("TaxId")) ? null : reader.GetString(reader.GetOrdinal("TaxId")),
                        PaymentTerms = reader.IsDBNull(reader.GetOrdinal("PaymentTerms")) ? null : reader.GetString(reader.GetOrdinal("PaymentTerms")),
                        Status = reader.GetBoolean(reader.GetOrdinal("Status")),
                        JoinDate = reader.GetDateTime(reader.GetOrdinal("JoinDate")),
                        Comments = reader.IsDBNull(reader.GetOrdinal("Comments")) ? null : reader.GetString(reader.GetOrdinal("Comments")),
                        Barcode = reader.GetString(reader.GetOrdinal("Barcode"))
                    };

                    supplierList.Add(supplier);
                }
                return supplierList;
            });
        }
    }
}
