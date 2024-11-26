using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class TinTucDichBenh
{
    public int MaTtdb { get; set; }

    public string? TenTtdb { get; set; }

    public DateOnly? NgayDang { get; set; }

    public string? MoTa { get; set; }

    public int? MaBc { get; set; }

    public virtual BenhCa? MaBcNavigation { get; set; }
}
