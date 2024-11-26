using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class NguoiNuoiCa
{
    public int MaNnc { get; set; }

    public string? HoTenNnc { get; set; }

    public string? Email { get; set; }

    public string? Sdt { get; set; }

    public string? DiaChi { get; set; }

    public int? MaNd { get; set; }

    public virtual ICollection<BaiDang> BaiDangs { get; set; } = new List<BaiDang>();

    public virtual ICollection<DanCa> DanCas { get; set; } = new List<DanCa>();

    public virtual NguoiDung? MaNdNavigation { get; set; }
}
