using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Controllers
{
    public class BenhCaController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public BenhCaController(QuanLyBenhCaContext quanLyBenhCaContext)
        {
            _quanLyBenhCaContext = quanLyBenhCaContext;
        }

        public IActionResult Index()
        {
            var data = _quanLyBenhCaContext.BenhCa!.ToList();
            return View(data);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(BenhCa BenhCa)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(BenhCa.TenBc) == true)
                {
                    ModelState.AddModelError("", "Tên bệnh cá không để trống!!!");
                    return View(BenhCa);
                }

                if (string.IsNullOrWhiteSpace(BenhCa.MoTaChiTietBenhCa) == true)
                {
                    ModelState.AddModelError("", "Mô tả bệnh cá không để trống!!!");
                    return View(BenhCa);
                }

                int maxMaBc;
                if (_quanLyBenhCaContext.BenhCa!.Count() == 0)
                    maxMaBc = 1;
                else
                    maxMaBc = await _quanLyBenhCaContext.BenhCa!.MaxAsync(u => u.MaBc);

                BenhCa.MaBc = maxMaBc + 1;
                _quanLyBenhCaContext.Add(BenhCa);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(BenhCa);
        }

        public ActionResult Edit(int? id)
        {
            var BenhCa = _quanLyBenhCaContext.BenhCa!.Where(n => n.MaBc == id).FirstOrDefault();
            return View(BenhCa);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, BenhCa BenhCa)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(BenhCa.TenBc) == true)
                    {
                        ModelState.AddModelError("", "Tên bệnh cá không để trống!!!");
                        return View(BenhCa);
                    }

                    if (string.IsNullOrWhiteSpace(BenhCa.MoTaChiTietBenhCa) == true)
                    {
                        ModelState.AddModelError("", "Mô tả bệnh cá không để trống!!!");
                        return View(BenhCa);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.BenhCa!.Where(n => n.MaBc == id).FirstOrDefault();
                    EditModel!.TenBc = BenhCa.TenBc;
                    EditModel!.MoTaChiTietBenhCa = BenhCa.MoTaChiTietBenhCa;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BenhCaExists(BenhCa.MaBc))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(BenhCa);
        }

        public ActionResult Delete(int Id)
        {
            var BenhCa = _quanLyBenhCaContext.BenhCa?.Where(n => n.MaBc == Id).FirstOrDefault();
            _quanLyBenhCaContext.BenhCa?.Remove(BenhCa!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool BenhCaExists(int id)
        {
            return _quanLyBenhCaContext.BenhCa!.Any(e => e.MaBc == id);
        }

        public async Task<IActionResult> Search(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
            {
                return View(await _quanLyBenhCaContext.BenhCa!.ToListAsync());
            }

            // Tìm kiếm theo tên bệnh hoặc mô tả triệu chứng
            var result = await _quanLyBenhCaContext.BenhCa!
                .Where(b => b.TenBc!.Contains(searchTerm) || b.MoTaChiTietBenhCa!.Contains(searchTerm))
                .ToListAsync();

            return View(result);
        }

        public IActionResult SearchByTrieuChung()
        {
            var trieuChungList = _quanLyBenhCaContext.TrieuChungBenhCa!.Select(tc => new { tc.MaTcbc, tc.TenTrieuChung }).ToList();
            ViewBag.TrieuChungList = trieuChungList;
            return View();
        }

        [HttpPost]
        public IActionResult SearchByTrieuChung(List<int> selectedTrieuChung)
        {

            var benhCaList = _quanLyBenhCaContext.BenhCa!
                .Where(bc => _quanLyBenhCaContext.KetQuaChuanDoan!
                    .Any(cd => cd.MaBc == bc.MaBc && selectedTrieuChung.Contains(cd.MaTcbc)))
                .Select(bc => new
                {
                    bc.MaBc,
                    bc.TenBc,
                    SoLuongTrieuChung = _quanLyBenhCaContext.KetQuaChuanDoan!
                        .Count(cd => cd.MaBc == bc.MaBc && selectedTrieuChung.Contains(cd.MaTcbc)), // Đếm số lượng triệu chứng liên quan
                    TrieuChungLienQuanList = _quanLyBenhCaContext.KetQuaChuanDoan!
                        .Where(cd => cd.MaBc == bc.MaBc && selectedTrieuChung.Contains(cd.MaTcbc))
                        .Select(cd => new { cd.MaTcbc, cd.TrieuChungBenhCa!.TenTrieuChung })
                        .ToList()
                })
                .OrderByDescending(bc => bc.SoLuongTrieuChung) // Sắp xếp theo số lượng triệu chứng giảm dần
                .FirstOrDefault(); // Lấy bệnh có nhiều triệu chứng nhất




            if (benhCaList != null)
            {
                // Lấy phương pháp điều trị và biện pháp phòng ngừa cho bệnh này
                var phuongPhapDieuTri = _quanLyBenhCaContext.PhuongPhapDieuTri!
                    .Where(pp => pp.MaBenhCa == benhCaList!.MaBc)
                    .Select(pp => new { pp.MaPpdt, pp.TenPpdt })
                    .ToList();

                var bienPhapPhongNgua = _quanLyBenhCaContext.BienPhapPhongNgua!
                    .Where(bp => bp.MaBenhCa == benhCaList!.MaBc)
                    .Select(bp => new { bp.MaBppn, bp.TenBppn })
                    .ToList();

                // Gửi phương pháp điều trị và biện pháp phòng ngừa tới View
                ViewBag.PhuongPhapDieuTri = phuongPhapDieuTri;
                ViewBag.BienPhapPhongNgua = bienPhapPhongNgua;
                ViewBag.TrieuChungLienQuanList = benhCaList!.TrieuChungLienQuanList;
            }

            var trieuChungList = _quanLyBenhCaContext.TrieuChungBenhCa!
                .Select(tc => new { tc.MaTcbc, tc.TenTrieuChung })
                .ToList();

            ViewBag.TrieuChungList = trieuChungList;
            ViewBag.BenhCaList = benhCaList;

            return View();
        }



    }
}
