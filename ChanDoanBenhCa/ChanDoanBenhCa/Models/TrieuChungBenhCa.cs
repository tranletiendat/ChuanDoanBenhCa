using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class TrieuChungBenhCa
{
    public int MaTcbc { get; set; }

    public string? TenTrieuChung { get; set; }

    public virtual ICollection<BenhCa> MaBcs { get; set; } = new List<BenhCa>();
}
