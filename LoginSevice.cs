using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem
{
    public  class LoginSevice
    {
        public static bool LoginCheck(string account, string password)
        {
            return SQLService.LoginCheck(account, password);
        }
    }
}
