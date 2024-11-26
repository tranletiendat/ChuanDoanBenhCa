using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Controllers
{
    public class DanCaController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public DanCaController(QuanLyBenhCaContext quanLyBenhCaContext)
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
            var data = _quanLyBenhCaContext.DanCa!.ToList();
            return View(data);
        }

        public IActionResult Create()
        {
            // Lấy danh sách người dùng từ cơ sở dữ liệu
            var nnc = _quanLyBenhCaContext.NguoiNuoiCa!.ToList();

            // Truyền danh sách người dùng vào ViewBag
            ViewBag.Nnc = new SelectList(nnc, "MaNnc", "HoTenNnc");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(DanCa DanCa)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(DanCa.TenDanCa) == true)
                {
                    ModelState.AddModelError("", "Tên đàn cá không để trống!!!");
                    return View(DanCa);
                }

                if (DanCa.SoLuong <= 0)
                {
                    ModelState.AddModelError("", "Số lượng phải lớn hơn 0!");
                    return View(DanCa);
                }

                if (string.IsNullOrWhiteSpace(DanCa.TrangThai) == true)
                {
                    ModelState.AddModelError("", "Trạng thái đàn cá không để trống!!!");
                    return View(DanCa);
                }

                int maxMaDc;
                if (_quanLyBenhCaContext.DanCa!.Count() == 0)
                    maxMaDc = 1;
                else
                    maxMaDc = await _quanLyBenhCaContext.DanCa!.MaxAsync(u => u.MaDc);

                DanCa.MaDc = maxMaDc + 1;
                _quanLyBenhCaContext.Add(DanCa);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(DanCa);
        }

        public ActionResult Edit(int? id)
        {
            var DanCa = _quanLyBenhCaContext.DanCa!.Where(n => n.MaDc == id).FirstOrDefault();
            return View(DanCa);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, DanCa DanCa)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(DanCa.TenDanCa) == true)
                    {
                        ModelState.AddModelError("", "Tên đàn cá không để trống!!!");
                        return View(DanCa);
                    }

                    if (DanCa.SoLuong <= 0)
                    {
                        ModelState.AddModelError("", "Số lượng phải lớn hơn 0!");
                        return View(DanCa);
                    }

                    if (string.IsNullOrWhiteSpace(DanCa.TrangThai) == true)
                    {
                        ModelState.AddModelError("", "Trạng thái đàn cá không để trống!!!");
                        return View(DanCa);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.DanCa!.Where(n => n.MaDc == id).FirstOrDefault();
                    EditModel!.TenDanCa = DanCa.TenDanCa;
                    EditModel!.SoLuong = DanCa.SoLuong;
                    EditModel!.TrangThai = DanCa.TrangThai;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DanCaExists(DanCa.MaDc))
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
            return View(DanCa);
        }

        public ActionResult Delete(int Id)
        {
            var DanCa = _quanLyBenhCaContext.DanCa?.Where(n => n.MaDc == Id).FirstOrDefault();
            _quanLyBenhCaContext.DanCa?.Remove(DanCa!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool DanCaExists(int id)
        {
            return _quanLyBenhCaContext.DanCa!.Any(e => e.MaDc == id);
        }
    }
}
