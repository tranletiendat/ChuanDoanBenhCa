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
    }
}
