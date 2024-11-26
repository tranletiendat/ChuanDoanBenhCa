using System.ComponentModel.DataAnnotations.Schema;

namespace ChanDoanBenhCa.Models
{
    public partial class LichSuChuanDoan
    {
        public int MaLSCD { get; set; }

        public DateTime NgayTao { get; set; }

        [Column("MaBC")]
        public int? MaBenhCa { get; set; }

        public virtual BenhCa? MaBenhCaNavigation { get; set; }
    }
}
