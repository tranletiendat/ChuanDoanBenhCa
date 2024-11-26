using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Controllers
{
    public class TrieuChungBenhCaController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public TrieuChungBenhCaController(QuanLyBenhCaContext quanLyBenhCaContext)
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
            var data = _quanLyBenhCaContext.TrieuChungBenhCa!.ToList();
            return View(data);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(TrieuChungBenhCa TrieuChungBenhCa)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(TrieuChungBenhCa.TenTrieuChung) == true)
                {
                    ModelState.AddModelError("", "triệu chứng không để trống!!!");
                    return View(TrieuChungBenhCa);
                }

                var existingTrieuChung = _quanLyBenhCaContext.TrieuChungBenhCa!
                    .FirstOrDefault(t => t.TenTrieuChung == TrieuChungBenhCa.TenTrieuChung);

                if (existingTrieuChung != null)
                {
                    ModelState.AddModelError(string.Empty, "Triệu chứng đã tồn tại!");
                    return View(TrieuChungBenhCa);
                }

                int maxMaTc;
                if (_quanLyBenhCaContext.TrieuChungBenhCa!.Count() == 0)
                    maxMaTc = 1;
                else
                    maxMaTc = await _quanLyBenhCaContext.TrieuChungBenhCa!.MaxAsync(u => u.MaTcbc);

                TrieuChungBenhCa.MaTcbc = maxMaTc + 1;
                _quanLyBenhCaContext.Add(TrieuChungBenhCa);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(TrieuChungBenhCa);
        }

        public ActionResult Edit(int? id)
        {
            var TrieuChungBenhCa = _quanLyBenhCaContext.TrieuChungBenhCa!.Where(n => n.MaTcbc == id).FirstOrDefault();
            return View(TrieuChungBenhCa);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, TrieuChungBenhCa TrieuChungBenhCa)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(TrieuChungBenhCa.TenTrieuChung) == true)
                    {
                        ModelState.AddModelError("", "Tên đàn cá không để trống!!!");
                        return View(TrieuChungBenhCa);
                    }

                    var existingTrieuChung = _quanLyBenhCaContext.TrieuChungBenhCa!
                    .FirstOrDefault(t => t.TenTrieuChung == TrieuChungBenhCa.TenTrieuChung && t.MaTcbc != id);

                    if (existingTrieuChung != null)
                    {
                        ModelState.AddModelError(string.Empty, "Triệu chứng đã tồn tại!");
                        return View(TrieuChungBenhCa);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.TrieuChungBenhCa!.Where(n => n.MaTcbc == id).FirstOrDefault();
                    EditModel!.TenTrieuChung = TrieuChungBenhCa.TenTrieuChung;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TrieuChungBenhCaExists(TrieuChungBenhCa.MaTcbc))
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
            return View(TrieuChungBenhCa);
        }

        public ActionResult Delete(int Id)
        {
            var TrieuChungBenhCa = _quanLyBenhCaContext.TrieuChungBenhCa?.Where(n => n.MaTcbc == Id).FirstOrDefault();
            var ketQuaChuanDoan = _quanLyBenhCaContext.KetQuaChuanDoan!
                .Where(k => k.MaTcbc == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.KetQuaChuanDoan!.RemoveRange(ketQuaChuanDoan);
            _quanLyBenhCaContext.TrieuChungBenhCa?.Remove(TrieuChungBenhCa!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool TrieuChungBenhCaExists(int id)
        {
            return _quanLyBenhCaContext.TrieuChungBenhCa!.Any(e => e.MaTcbc == id);
        }
    }
}
