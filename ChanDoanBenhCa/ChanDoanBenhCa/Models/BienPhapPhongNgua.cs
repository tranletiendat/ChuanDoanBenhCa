using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class BienPhapPhongNgua
{
    public int MaBppn { get; set; }

    public string? TenBppn { get; set; }

    public int? MaBenhCa { get; set; }

    public virtual BenhCa? MaBenhCaNavigation { get; set; }
}
