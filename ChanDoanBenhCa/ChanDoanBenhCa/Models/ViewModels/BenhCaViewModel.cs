namespace ChanDoanBenhCa.Models.ViewModels
{
    public class BenhCaViewModel
    {
        public string? TenBc { get; set; }

        public string? MoTaChiTietBenhCa { get; set; }

        public IFormFile? AnhBenhCa { get; set; }

        public List<int>? SelectedTrieuChungIds { get; set; } // Danh sách MaTC
    }
}
