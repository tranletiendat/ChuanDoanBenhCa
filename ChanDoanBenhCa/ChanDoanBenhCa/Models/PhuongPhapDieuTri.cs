using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class PhuongPhapDieuTri
{
    public int MaPpdt { get; set; }

    public string? TenPpdt { get; set; }

    public int? MaBenhCa { get; set; }

    public virtual BenhCa? MaBenhCaNavigation { get; set; }
}
