﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public class Product
    {
        public int Id { get; set; }

        public string Code { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Category { get; set; }

        public DateTime AddedDate { get; set; } = DateTime.Now;

        public string ImageUrl { get; set; }

        public string Status { get; set; } = "Available";

        public int? SupplierId { get; set; }
    }
}
