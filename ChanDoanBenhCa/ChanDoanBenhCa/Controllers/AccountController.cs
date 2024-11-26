using ChanDoanBenhCa.Models;
using ChanDoanBenhCa.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;

namespace ChanDoanBenhCa.Controllers
{
    public class AccountController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;
        private static List<NguoiDung> _users = new List<NguoiDung>();

        public AccountController(QuanLyBenhCaContext quanLyBenhCaContext)
        {
            _quanLyBenhCaContext = quanLyBenhCaContext;
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (_users.Any(u => u.TenNd == model.Username))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại.");
                    return View(model);
                }

                // Kiểm tra và lấy giá trị MaNd mới
                int maxMaNd = await _quanLyBenhCaContext.NguoiDung!.MaxAsync(u => u.MaNd);
                NguoiDung newbie = new NguoiDung();
                newbie.MaNd = maxMaNd + 1;
                newbie.TenNd = model.Username;
                newbie.MatKhau = HashPassword(model.Password!);
                newbie.QuyenNguoiDung = "users";
                _quanLyBenhCaContext.Add(newbie);
                await _quanLyBenhCaContext.SaveChangesAsync();

                TempData["SuccessMessage"] = "Đăng ký thành công.";
                return RedirectToAction("Login");
            }

            return View(model);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = _quanLyBenhCaContext.NguoiDung!.Where(n => n.TenNd == model.Username).FirstOrDefault();
                if (user != null && VerifyPassword(model.Password!, user.MatKhau!))
                {
                    // Lưu trạng thái đăng nhập
                    HttpContext.Session.SetInt32("UserId", user.MaNd);
                    HttpContext.Session.SetString("UserName", user.TenNd!);
                    HttpContext.Session.SetString("IsAdmin", user.QuyenNguoiDung!);


                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng.");
            }

            return View();
        }

        public IActionResult Logout()
        {
            // Xóa toàn bộ Session
            HttpContext.Session.Clear();

            return RedirectToAction("Login");
        }

        public static string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var bytes = Encoding.UTF8.GetBytes(password);
                var hash = sha256.ComputeHash(bytes);

                return Convert.ToBase64String(hash);
            }
        }

        public static bool VerifyPassword(string inputPassword, string hashedPassword)
        {
            var hashInput = HashPassword(inputPassword);
            return hashInput == hashedPassword;
        }
    }
}
