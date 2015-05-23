using DA_QLTC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DA_QLTC.App_Start
{
    public class UserControl
    {
        List<USER> lst_user;
        string user_name;
        public decimal get_id_user()
        {
            QLTC_MVCEntities db = new QLTC_MVCEntities();
            lst_user = db.USERs.Where(x => x.ACCOUNT_NAME == System.Web.HttpContext.Current.User.Identity.Name).ToList();
            if (lst_user.Count > 0)
            {
                return lst_user[0].ID;
            }
            return -1;
        }
       public void set_user_name(string ip_str_user_name)
        {
            this.user_name = ip_str_user_name; 
        }
    }
}