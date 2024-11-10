using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBenhCa.Controllers
{
    public class NguoiDungsController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public NguoiDungsController(QuanLyBenhCaContext quanLyBenhCaContext) 
        {
            _quanLyBenhCaContext = quanLyBenhCaContext;
        }

        public IActionResult Index()
        {
            var data = _quanLyBenhCaContext.NguoiDung?.ToList();
            return View(data);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(NguoiDung NguoiDung)
        {
            if (ModelState.IsValid)
            {
                bool exists = _quanLyBenhCaContext.NguoiDung!.Any(e => e.TenNd == NguoiDung.TenNd);
                if (exists == true)
                {
                    ModelState.AddModelError("", "Tên người dùng đã tồn tại!!!");
                    return View(NguoiDung);
                }
                // Kiểm tra và lấy giá trị MaNd mới
                int maxMaNd = await _quanLyBenhCaContext.NguoiDung!.MaxAsync(u => u.MaNd);
                NguoiDung.MaNd = maxMaNd + 1;
                _quanLyBenhCaContext.Add(NguoiDung);
                await _quanLyBenhCaContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(NguoiDung);
        }

        public ActionResult Edit(int? id)
        {
            var NguoiDung = _quanLyBenhCaContext.NguoiDung!.Where(n => n.MaNd == id).FirstOrDefault();
            return View(NguoiDung);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, NguoiDung NguoiDung)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(NguoiDung.TenNd) == true)
                    {
                        ModelState.AddModelError("", "Tên người dùng không được để trống!!!");
                        return View(NguoiDung);
                    }

                    if (string.IsNullOrWhiteSpace(NguoiDung.MatKhau) == true)
                    {
                        ModelState.AddModelError("", "Mật khẩu người dùng không được để trống!!!");
                        return View(NguoiDung);
                    }

                    if (string.IsNullOrWhiteSpace(NguoiDung.QuyenNguoiDung) == true)
                    {
                        ModelState.AddModelError("", "Quyền người dùng không được để trống!!!");
                        return View(NguoiDung);
                    }
                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.NguoiDung!.Where(n => n.MaNd == id).FirstOrDefault();
                    EditModel!.TenNd = NguoiDung.TenNd;
                    EditModel.MatKhau = NguoiDung.MatKhau;
                    EditModel.QuyenNguoiDung = NguoiDung.QuyenNguoiDung;
                    _quanLyBenhCaContext.Update(EditModel);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NguoiDungExists(NguoiDung.MaNd))
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
            return View(NguoiDung);
        }

        public ActionResult Delete(int Id)
        {
            var nguoiDung = _quanLyBenhCaContext.NguoiDung?.Where(n => n.MaNd == Id).FirstOrDefault();
            _quanLyBenhCaContext.NguoiDung?.Remove(nguoiDung!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool NguoiDungExists(int id)
        {
            return _quanLyBenhCaContext.NguoiDung!.Any(e => e.MaNd == id);
        }

    }
}
