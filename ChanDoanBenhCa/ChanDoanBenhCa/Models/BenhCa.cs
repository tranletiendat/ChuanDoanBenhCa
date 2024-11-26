using System;
using System.Collections.Generic;

namespace ChanDoanBenhCa.Models;

public partial class BenhCa
{
    public int MaBc { get; set; }

    public string? TenBc { get; set; }

    public string? MoTaChiTietBenhCa { get; set; }

    public virtual BienPhapPhongNgua? BienPhapPhongNgua { get; set; }

    public virtual ICollection<LichSuBenh> LichSuBenhs { get; set; } = new List<LichSuBenh>();

    public virtual PhuongPhapDieuTri? PhuongPhapDieuTri { get; set; }

    public virtual ICollection<TinTucDichBenh> TinTucDichBenhs { get; set; } = new List<TinTucDichBenh>();

    public virtual ICollection<KetQuaChuanDoan> KetQuaChuanDoan { get; set; } = new List<KetQuaChuanDoan>();
}
