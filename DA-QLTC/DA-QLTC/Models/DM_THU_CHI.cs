//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DA_QLTC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DM_THU_CHI
    {
        public DM_THU_CHI()
        {
            this.GD_THU_CHI = new HashSet<GD_THU_CHI>();
        }
    
        public decimal ID { get; set; }
        public string TEN { get; set; }
        public decimal ID_LOAI { get; set; }
        public decimal ID_USER { get; set; }
        public string GHI_CHU { get; set; }
    
        public virtual DM_TU_DIEN DM_TU_DIEN { get; set; }
        public virtual USER USER { get; set; }
        public virtual ICollection<GD_THU_CHI> GD_THU_CHI { get; set; }
    }
}
