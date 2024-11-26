using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class BaiDang
{
    public int MaBd { get; set; }

    public string? MoTa { get; set; }

    public int? MaNnc { get; set; }

    public virtual NguoiNuoiCa? MaNncNavigation { get; set; }
}
