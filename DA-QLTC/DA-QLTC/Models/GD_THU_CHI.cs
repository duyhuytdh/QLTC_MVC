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
    
    public partial class GD_THU_CHI
    {
        public decimal ID { get; set; }
        public System.DateTime THOI_GIAN { get; set; }
        public decimal ID_THU_CHI { get; set; }
        public decimal SO_TIEN { get; set; }
        public decimal ID_DVT { get; set; }
        public decimal ID_QUY { get; set; }
        public string GHI_CHU { get; set; }
    
        public virtual DM_DVT DM_DVT { get; set; }
        public virtual DM_QUY DM_QUY { get; set; }
        public virtual DM_THU_CHI DM_THU_CHI { get; set; }
    }
}
