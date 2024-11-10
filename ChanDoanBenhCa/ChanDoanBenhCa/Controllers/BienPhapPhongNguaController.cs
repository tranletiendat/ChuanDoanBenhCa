using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ChanDoanBienPhapPhongNgua.Controllers
{
    public class BienPhapPhongNguaController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public BienPhapPhongNguaController(QuanLyBenhCaContext quanLyBienPhapPhongNguaContext)
        {
            _quanLyBenhCaContext = quanLyBienPhapPhongNguaContext;
        }

        public IActionResult Index()
        {
            var data = _quanLyBenhCaContext.BienPhapPhongNgua!.ToList();
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
        public async Task<IActionResult> Create(BienPhapPhongNgua BienPhapPhongNgua)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(BienPhapPhongNgua.TenBppn) == true)
                {
                    ModelState.AddModelError("", "Biện pháp không để trống!!!");
                    return View(BienPhapPhongNgua);
                }

                int maxMaBc;
                if (_quanLyBenhCaContext.BienPhapPhongNgua!.Count() == 0)
                    maxMaBc = 1;
                else
                    maxMaBc = await _quanLyBenhCaContext.BienPhapPhongNgua!.MaxAsync(u => u.MaBppn);

                BienPhapPhongNgua.MaBppn = maxMaBc + 1;
                if (!_quanLyBenhCaContext.BienPhapPhongNgua!.Any(p => p.MaBenhCa == BienPhapPhongNgua.MaBenhCa))
                {
                    _quanLyBenhCaContext.Add(BienPhapPhongNgua);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }
                else
                {
                    // Thêm thông báo lỗi khi giá trị MaBenhCa đã tồn tại
                    ModelState.AddModelError("MaBenhCa", "Bệnh cá này đã có biện pháp phong ngừa.");

                    // Trả về lại view với dữ liệu người dùng đã nhập để hiển thị thông báo lỗi
                    return View(BienPhapPhongNgua);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(BienPhapPhongNgua);
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

            var BienPhapPhongNgua = _quanLyBenhCaContext.BienPhapPhongNgua!.Where(n => n.MaBppn == id).FirstOrDefault();
            return View(BienPhapPhongNgua);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, BienPhapPhongNgua BienPhapPhongNgua)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Lưu dữ liệu vào db
                    if (string.IsNullOrWhiteSpace(BienPhapPhongNgua.TenBppn) == true)
                    {
                        ModelState.AddModelError("", "Tên bệnh cá không để trống!!!");
                        return View(BienPhapPhongNgua);
                    }

                    //Tìm đối tượng cần sửa
                    var EditModel = _quanLyBenhCaContext.BienPhapPhongNgua!.Where(n => n.MaBppn == id).FirstOrDefault();
                    EditModel!.TenBppn = BienPhapPhongNgua.TenBppn;
                    EditModel.MaBenhCa = BienPhapPhongNgua.MaBenhCa;

                    if (!_quanLyBenhCaContext.BienPhapPhongNgua!.Any(p => p.MaBenhCa == BienPhapPhongNgua.MaBenhCa && p.MaBppn != id))
                    {
                        _quanLyBenhCaContext.Update(EditModel);
                        await _quanLyBenhCaContext.SaveChangesAsync();
                    }
                    else
                    {
                        // Thêm thông báo lỗi khi giá trị MaBenhCa đã tồn tại
                        ModelState.AddModelError("MaBenhCa", "Bệnh cá này đã có biện pháp phong ngừa.");

                        // Trả về lại view với dữ liệu người dùng đã nhập để hiển thị thông báo lỗi
                        return View(BienPhapPhongNgua);
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BienPhapPhongNguaExists(BienPhapPhongNgua.MaBppn))
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
            return View(BienPhapPhongNgua);
        }

        public ActionResult Delete(int Id)
        {
            var BienPhapPhongNgua = _quanLyBenhCaContext.BienPhapPhongNgua?.Where(n => n.MaBppn == Id).FirstOrDefault();
            _quanLyBenhCaContext.BienPhapPhongNgua?.Remove(BienPhapPhongNgua!);
            _quanLyBenhCaContext.SaveChanges();
            return RedirectToAction("Index");
        }

        private bool BienPhapPhongNguaExists(int id)
        {
            return _quanLyBenhCaContext.BienPhapPhongNgua!.Any(e => e.MaBppn == id);
        }
    }
}
