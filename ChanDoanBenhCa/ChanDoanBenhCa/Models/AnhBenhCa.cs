using System.ComponentModel.DataAnnotations.Schema;

namespace ChanDoanBenhCa.Models
{
    public partial class AnhBenhCa
    {
        public int MaImg { get; set; }

        public string? DuongDanAnh { get; set; }

        [Column("MaBC")]
        public int? MaBenhCa { get; set; }

        public virtual BenhCa? MaBenhCaNavigation { get; set; }

    }
}
