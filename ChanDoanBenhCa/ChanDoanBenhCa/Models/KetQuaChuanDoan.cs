namespace ChanDoanBenhCa.Models
{
    public class KetQuaChuanDoan
    {
        public int MaBc { get; set; }
        public int MaTcbc { get; set; }

        public virtual BenhCa? BenhCa { get; set; }
        public virtual TrieuChungBenhCa? TrieuChungBenhCa { get; set; }
    }
}
