using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace ChanDoanBenhCa.Controllers
{
    public class BaiDangController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public BaiDangController(QuanLyBenhCaContext quanLyBenhCaContext)
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
            var data = _quanLyBenhCaContext.BaiDang!.ToList();
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
        public async Task<IActionResult> Create(BaiDang BaiDang)
        {
            if (ModelState.IsValid)
            {
                int maxMaBd;
                if (_quanLyBenhCaContext.BaiDang!.Count() == 0)
                    maxMaBd = 1;
                else
                    maxMaBd = await _quanLyBenhCaContext.BaiDang!.MaxAsync(u => u.MaBd);
                BaiDang.MaBd = maxMaBd + 1;
                _quanLyBenhCaContext.Add(BaiDang);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(BaiDang);
        }

        public ActionResult Edit(int? id)
        {
            var BaiDang = _quanLyBenhCaContext.BaiDang!.Where(n => n.MaBd == id).FirstOrDefault();
            return View(BaiDang);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, BaiDang BaiDang)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(BaiDang.MoTa) == true)
                    {
                        ModelState.AddModelError("", "Nội dung bài đăng không để trống!!!");
                        return View(BaiDang);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.BaiDang!.Where(n => n.MaBd == id).FirstOrDefault();
                    EditModel!.MoTa = BaiDang.MoTa;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BaiDangExists(BaiDang.MaBd))
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
            return View(BaiDang);
        }

        public ActionResult Delete(int Id)
        {
            var BaiDang = _quanLyBenhCaContext.BaiDang?.Where(n => n.MaBd == Id).FirstOrDefault();
            _quanLyBenhCaContext.BaiDang?.Remove(BaiDang!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool BaiDangExists(int id)
        {
            return _quanLyBenhCaContext.BaiDang!.Any(e => e.MaBd == id);
        }
    }
}
