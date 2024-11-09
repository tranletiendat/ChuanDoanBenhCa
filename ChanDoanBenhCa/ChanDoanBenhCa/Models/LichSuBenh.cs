using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class LichSuBenh
{
    public DateOnly NgayPhatHien { get; set; }

    public string? KetQuaDieuTri { get; set; }

    public int MaDc { get; set; }

    public int MaBc { get; set; }

    public virtual BenhCa MaBcNavigation { get; set; } = null!;

    public virtual DanCa MaDcNavigation { get; set; } = null!;
}
