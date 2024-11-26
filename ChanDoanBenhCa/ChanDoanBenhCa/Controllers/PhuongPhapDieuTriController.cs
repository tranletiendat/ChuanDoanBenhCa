using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Controllers
{
    public class PhuongPhapDieuTriController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public PhuongPhapDieuTriController(QuanLyBenhCaContext quanLyBenhCaContext)
        {
            _quanLyBenhCaContext = quanLyBenhCaContext;
        }

        public IActionResult Index()
        {
            // Lấy thông tin từ Session
            var quyen = HttpContext.Session.GetString("IsAdmin");

            if (string.IsNullOrEmpty(quyen) || quyen != "admin")
            {
                return RedirectToAction("Login", "Account");
            }
            var data = _quanLyBenhCaContext.PhuongPhapDieuTri!.ToList();
            return View(data);
        }

        public IActionResult Create()
        {
            var benhCaList = _quanLyBenhCaContext.BenhCa!.Select(b => new SelectListItem
            {
                Value = b.MaBc.ToString(),
                Text = b.TenBc
            }).ToList();

            // Gán danh sách vào ViewBag.Bc
            ViewBag.Bc = benhCaList;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(PhuongPhapDieuTri PhuongPhapDieuTri)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(PhuongPhapDieuTri.TenPpdt) == true)
                {
                    ModelState.AddModelError("", "Tên phương pháp điều trị không để trống!!!");
                    return View(PhuongPhapDieuTri);
                }

                int maxMaBc;
                if (_quanLyBenhCaContext.PhuongPhapDieuTri!.Count() == 0)
                    maxMaBc = 1;
                else
                    maxMaBc = await _quanLyBenhCaContext.PhuongPhapDieuTri!.MaxAsync(u => u.MaPpdt);

                PhuongPhapDieuTri.MaPpdt = maxMaBc + 1;
                if (!_quanLyBenhCaContext.PhuongPhapDieuTri!.Any(p => p.MaBenhCa == PhuongPhapDieuTri.MaBenhCa))
                {
                    _quanLyBenhCaContext.PhuongPhapDieuTri!.Add(PhuongPhapDieuTri);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                else
                {
                    // Thêm thông báo lỗi khi giá trị MaBenhCa đã tồn tại
                    ModelState.AddModelError("MaBenhCa", "Bệnh cá này đã có phương pháp điều trị.");

                    // Trả về lại view với dữ liệu người dùng đã nhập để hiển thị thông báo lỗi
                    return View(PhuongPhapDieuTri);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(PhuongPhapDieuTri);
        }

        public ActionResult Edit(int? id)
        {
            var benhCaList = _quanLyBenhCaContext.BenhCa!.Select(b => new SelectListItem
            {
                Value = b.MaBc.ToString(),
                Text = b.TenBc
            }).ToList();

            // Gán danh sách vào ViewBag.Bc
            ViewBag.Bc = benhCaList;

            var PhuongPhapDieuTri = _quanLyBenhCaContext.PhuongPhapDieuTri!.Where(n => n.MaPpdt == id).FirstOrDefault();
            return View(PhuongPhapDieuTri);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, PhuongPhapDieuTri PhuongPhapDieuTri)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(PhuongPhapDieuTri.TenPpdt) == true)
                    {
                        ModelState.AddModelError("", "Tên phương pháp điều trị không để trống!!!");
                        return View(PhuongPhapDieuTri);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.PhuongPhapDieuTri!.Where(n => n.MaPpdt == id).FirstOrDefault();
                    EditModel!.TenPpdt = PhuongPhapDieuTri.TenPpdt;
                    EditModel!.MaBenhCa = PhuongPhapDieuTri.MaBenhCa;

                    if (!_quanLyBenhCaContext.PhuongPhapDieuTri!.Any(p => p.MaBenhCa == PhuongPhapDieuTri.MaBenhCa && p.MaPpdt != id))
                    {
                        _quanLyBenhCaContext.Update(EditModel);
                        await _quanLyBenhCaContext.SaveChangesAsync();
                    }
                    else
                    {
                        // Thêm thông báo lỗi khi giá trị MaBenhCa đã tồn tại
                        ModelState.AddModelError("MaBenhCa", "Bệnh cá này đã có phương pháp điều trị.");

                        // Trả về lại view với dữ liệu người dùng đã nhập để hiển thị thông báo lỗi
                        return View(PhuongPhapDieuTri);
                    }
                    
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BenhCaExists(PhuongPhapDieuTri.MaPpdt))
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
            return View(PhuongPhapDieuTri);
        }

        public ActionResult Delete(int Id)
        {
            var PhuongPhapDieuTri = _quanLyBenhCaContext.PhuongPhapDieuTri?.Where(n => n.MaPpdt == Id).FirstOrDefault();
            _quanLyBenhCaContext.PhuongPhapDieuTri?.Remove(PhuongPhapDieuTri!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool BenhCaExists(int id)
        {
            return _quanLyBenhCaContext.PhuongPhapDieuTri!.Any(e => e.MaPpdt == id);
        }
    }
}
