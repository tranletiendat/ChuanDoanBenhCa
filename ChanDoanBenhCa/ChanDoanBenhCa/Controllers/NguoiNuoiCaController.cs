using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace ChanDoanBenhCa.Controllers
{
    public class NguoiNuoiCaController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public NguoiNuoiCaController(QuanLyBenhCaContext quanLyBenhCaContext)
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
            var data = _quanLyBenhCaContext.NguoiNuoiCa?.ToList();
            return View(data);
        }

        public IActionResult Create()
        {
            // Lấy danh sách người dùng từ cơ sở dữ liệu
            var users = _quanLyBenhCaContext.NguoiDung!.ToList();

            // Truyền danh sách người dùng vào ViewBag
            ViewBag.Users = new SelectList(users, "MaNd", "TenNd"); // "MaNd" là khóa chính, "TenNd" là tên người dùng

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(NguoiNuoiCa NguoiNuoiCa)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra và lấy giá trị MaNd mới
                int maxMaNNC = await _quanLyBenhCaContext.NguoiNuoiCa!.MaxAsync(u => u.MaNnc);
                NguoiNuoiCa.MaNnc = maxMaNNC + 1;
                _quanLyBenhCaContext.Add(NguoiNuoiCa);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(NguoiNuoiCa);
        }

        public ActionResult Edit(int? id)
        {
            var NguoiNuoiCa = _quanLyBenhCaContext.NguoiNuoiCa!.Where(n => n.MaNnc == id).FirstOrDefault();
            return View(NguoiNuoiCa);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, NguoiNuoiCa NguoiNuoiCa)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(NguoiNuoiCa.HoTenNnc) == true)
                    {
                        ModelState.AddModelError("", "Tên người nuôi cá không được để trống!!!");
                        return View(NguoiNuoiCa);
                    }

                    if (string.IsNullOrWhiteSpace(NguoiNuoiCa.Email))
                    {
                        ModelState.AddModelError("", "Email người nuôi cá không được để trống!!!");
                        return View(NguoiNuoiCa);
                    }

                    // Kiểm tra định dạng email
                    var emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
                    if (!Regex.IsMatch(NguoiNuoiCa.Email, emailPattern))
                    {
                        ModelState.AddModelError("", "Email không đúng định dạng!!!");
                        return View(NguoiNuoiCa);
                    }

                    if (string.IsNullOrWhiteSpace(NguoiNuoiCa.Sdt))
                    {
                        ModelState.AddModelError("", "Số điện thoại không được để trống!!!");
                        return View(NguoiNuoiCa);
                    }

                    // Kiểm tra định dạng số điện thoại Việt Nam
                    var phonePattern = @"^(09|03|07|08|05)\d{8}$";
                    if (!Regex.IsMatch(NguoiNuoiCa.Sdt, phonePattern))
                    {
                        ModelState.AddModelError("", "Số điện thoại không đúng định dạng!!! Số điện thoại Việt Nam phải bắt đầu bằng 09, 03, 07, 08 hoặc 05 và có 10 chữ số.");
                        return View(NguoiNuoiCa);
                    }

                    if (string.IsNullOrWhiteSpace(NguoiNuoiCa.DiaChi))
                    {
                        ModelState.AddModelError("", "Địa chỉ không được để trống!!!");
                        return View(NguoiNuoiCa);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.NguoiNuoiCa!.Where(n => n.MaNnc == id).FirstOrDefault();
                    EditModel!.HoTenNnc = NguoiNuoiCa.HoTenNnc;
                    EditModel.Email = NguoiNuoiCa.Email;
                    EditModel.Sdt = NguoiNuoiCa.Sdt;
                    EditModel.DiaChi = NguoiNuoiCa.DiaChi;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NguoiNuoiCaExists(NguoiNuoiCa.MaNnc))
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
            return View(NguoiNuoiCa);
        }

        public ActionResult Delete(int Id)
        {
            var NguoiNuoiCa = _quanLyBenhCaContext.NguoiNuoiCa?.Where(n => n.MaNnc == Id).FirstOrDefault();
            _quanLyBenhCaContext.NguoiNuoiCa?.Remove(NguoiNuoiCa!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool NguoiNuoiCaExists(int id)
        {
            return _quanLyBenhCaContext.NguoiNuoiCa!.Any(e => e.MaNnc == id);
        }
    }
}
