using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem.Model
{
    public class Parameters
    {
        public int Id { get; set; }
        public int? ParentId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Value { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }
        public byte Status { get; set; }
        public string BarCode { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}
