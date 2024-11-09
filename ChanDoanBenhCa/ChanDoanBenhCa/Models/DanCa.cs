using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class DanCa
{
    public int MaDc { get; set; }

    public string? TenDanCa { get; set; }

    public int? SoLuong { get; set; }

    public string? TrangThai { get; set; }

    public int? MaNnc { get; set; }

    public virtual ICollection<LichSuBenh> LichSuBenhs { get; set; } = new List<LichSuBenh>();

    public virtual NguoiNuoiCa? MaNncNavigation { get; set; }
}
