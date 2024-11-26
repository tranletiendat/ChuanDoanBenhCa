using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Controllers
{
    public class TinTucDichBenhController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public TinTucDichBenhController(QuanLyBenhCaContext quanLyTinTucDichBenhContext)
        {
            _quanLyBenhCaContext = quanLyTinTucDichBenhContext;
        }

        public IActionResult Index()
        {
            var data = _quanLyBenhCaContext.TinTucDichBenh!.ToList();
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
        public async Task<IActionResult> Create(TinTucDichBenh TinTucDichBenh)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(TinTucDichBenh.TenTtdb) == true)
                {
                    ModelState.AddModelError("", "Tên bệnh cá không để trống!!!");
                    return View(TinTucDichBenh);
                }

                if (string.IsNullOrWhiteSpace(TinTucDichBenh.MoTa) == true)
                {
                    ModelState.AddModelError("", "Mô tả bệnh cá không để trống!!!");
                    return View(TinTucDichBenh);
                }

                int maxMaBc;
                if (_quanLyBenhCaContext.TinTucDichBenh!.Count() == 0)
                    maxMaBc = 1;
                else
                    maxMaBc = await _quanLyBenhCaContext.TinTucDichBenh!.MaxAsync(u => u.MaTtdb);

                TinTucDichBenh.MaTtdb = maxMaBc + 1;

                DateOnly currentDateOnly = DateOnly.FromDateTime(DateTime.Now);
                TinTucDichBenh.NgayDang = currentDateOnly;

                _quanLyBenhCaContext.Add(TinTucDichBenh);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(TinTucDichBenh);
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

            var TinTucDichBenh = _quanLyBenhCaContext.TinTucDichBenh!.Where(n => n.MaTtdb == id).FirstOrDefault();
            return View(TinTucDichBenh);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, TinTucDichBenh TinTucDichBenh)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(TinTucDichBenh.TenTtdb) == true)
                    {
                        ModelState.AddModelError("", "Tên bệnh cá không để trống!!!");
                        return View(TinTucDichBenh);
                    }

                    if (string.IsNullOrWhiteSpace(TinTucDichBenh.MoTa) == true)
                    {
                        ModelState.AddModelError("", "Mô tả bệnh cá không để trống!!!");
                        return View(TinTucDichBenh);
                    }

                    DateOnly currentDateOnly = DateOnly.FromDateTime(DateTime.Now);

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.TinTucDichBenh!.Where(n => n.MaTtdb == id).FirstOrDefault();
                    EditModel!.TenTtdb = TinTucDichBenh.TenTtdb;
                    EditModel!.MoTa = TinTucDichBenh.MoTa;
                    EditModel!.NgayDang = currentDateOnly;
                    EditModel!.MaBc = TinTucDichBenh.MaBc;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TinTucDichBenhExists(TinTucDichBenh.MaTtdb))
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
            return View(TinTucDichBenh);
        }

        public ActionResult Delete(int Id)
        {
            var TinTucDichBenh = _quanLyBenhCaContext.TinTucDichBenh?.Where(n => n.MaTtdb == Id).FirstOrDefault();
            _quanLyBenhCaContext.TinTucDichBenh?.Remove(TinTucDichBenh!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool TinTucDichBenhExists(int id)
        {
            return _quanLyBenhCaContext.TinTucDichBenh!.Any(e => e.MaTtdb == id);
        }
    }
}
