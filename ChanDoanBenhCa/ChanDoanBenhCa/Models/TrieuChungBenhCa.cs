using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class TrieuChungBenhCa
{
    public int MaTcbc { get; set; }

    public string? TenTrieuChung { get; set; }

    public virtual ICollection<KetQuaChuanDoan> KetQuaChuanDoan { get; set; } = new List<KetQuaChuanDoan>();
}
