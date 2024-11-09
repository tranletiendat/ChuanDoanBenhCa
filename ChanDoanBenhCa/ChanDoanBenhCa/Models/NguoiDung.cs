using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class NguoiDung
{
    public int MaNd { get; set; }

    public string? TenNd { get; set; }

    public string? MatKhau { get; set; }

    public string? QuyenNguoiDung { get; set; }

    public virtual ICollection<NguoiNuoiCa> NguoiNuoiCas { get; set; } = new List<NguoiNuoiCa>();
}
