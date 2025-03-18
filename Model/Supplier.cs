using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem.Model
{
    public class Supplier
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string ContactPerson { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Website { get; set; }
        public string BusinessType { get; set; }
        public string TaxId { get; set; }
        public string PaymentTerms { get; set; }
        public bool Status { get; set; }
        public DateTime JoinDate { get; set; }
        public string Comments { get; set; }
        public string Barcode { get; set; }

        public string DisplayValueName => $"{Barcode}-{Name}";
    }
}
