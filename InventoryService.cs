using POSSystem.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class InventoryService
    {
        public static List<Parameters> GetColorList()
        {
            return InventorySQLService.GetColorList();
        }

        internal static List<Parameters> GetCategoryList()
        {
            return InventorySQLService.GetCategoryList();
        }

        internal static List<Supplier> GetSupplierList()
        {
            return InventorySQLService.GetSupplierList();
        }
    }
}
