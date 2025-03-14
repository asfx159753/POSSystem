using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class ProductDetail
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public string Size { get; set; }

        public string Color { get; set; }

        public string SKU { get; set; }

        public decimal CostPrice { get; set; }

        public decimal RetailPrice { get; set; }

        public int Stock { get; set; } = 0;

        public string Barcode { get; set; }

        public string ImageUrl { get; set; }

        public string Status { get; set; } = "Available";

        public virtual Product Product { get; set; }
    }
}
