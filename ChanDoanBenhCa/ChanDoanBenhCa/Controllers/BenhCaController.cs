using ChanDoanBenhCa.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Configuration;
using ChanDoanBenhCa.Models.ViewModels;

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
            // Lấy thông tin từ Session
            var quyen = HttpContext.Session.GetString("IsAdmin");

            if (string.IsNullOrEmpty(quyen) || quyen != "admin")
            {
                return RedirectToAction("Login", "Account");
            }

            // Lấy danh sách Bệnh cá cùng với ảnh liên quan
            var benhCas =  _quanLyBenhCaContext.BenhCa!
                                        .Include(bc => bc.AnhBenhCas) // Lấy các ảnh liên quan
                                        .ToList();

            return View(benhCas);

        }

        public IActionResult Create()
        {
            var viewModel = new BenhCaViewModel
            {
                SelectedTrieuChungIds = new List<int>() // Danh sách triệu chứng được chọn
            };

            // Lấy danh sách triệu chứng từ database
            ViewBag.TrieuChungs = _quanLyBenhCaContext.TrieuChungBenhCa!.ToList();
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Create(BenhCaViewModel BenhCa)
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

                BenhCa newbc = new BenhCa();
                newbc.MaBc = maxMaBc + 1;
                newbc.TenBc = BenhCa.TenBc;
                newbc.MoTaChiTietBenhCa = BenhCa.MoTaChiTietBenhCa;
                _quanLyBenhCaContext.Add(newbc);
                await _quanLyBenhCaContext.SaveChangesAsync();

                if (BenhCa.AnhBenhCa != null && BenhCa.AnhBenhCa.Length > 0)
                {
                    // Kiểm tra thư mục lưu ảnh
                    var imageDirectory = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images");
                    if (!Directory.Exists(imageDirectory))
                    {
                        Directory.CreateDirectory(imageDirectory);
                    }

                    var filePath = Path.Combine(imageDirectory, BenhCa.AnhBenhCa.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await BenhCa.AnhBenhCa.CopyToAsync(stream);
                    }

                    // Lưu thông tin vào bảng AnhBenhCa
                    var anhBenhCa = new AnhBenhCa
                    {
                        MaBenhCa = newbc.MaBc,
                        DuongDanAnh = "/images/" + BenhCa.AnhBenhCa.FileName // Đường dẫn tới ảnh
                    };

                    _quanLyBenhCaContext.AnhBenhCa!.Add(anhBenhCa);
                    await _quanLyBenhCaContext.SaveChangesAsync();
                }


                // Thêm các triệu chứng liên kết
                if (BenhCa.SelectedTrieuChungIds != null)
                {
                    foreach (var maTC in BenhCa.SelectedTrieuChungIds)
                    {
                        var chanDoan = new KetQuaChuanDoan
                        {
                            MaBc = newbc.MaBc,
                            MaTcbc = maTC
                        };
                        _quanLyBenhCaContext.KetQuaChuanDoan!.Add(chanDoan);
                    }
                }

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

            var ketQuaChuanDoan = _quanLyBenhCaContext.KetQuaChuanDoan!
                .Where(k => k.MaBc == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.KetQuaChuanDoan!.RemoveRange(ketQuaChuanDoan);

            var lichsuBenh = _quanLyBenhCaContext.LichSuBenh!
                .Where(k => k.MaBc == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.LichSuBenh!.RemoveRange(lichsuBenh);

            var ppdt = _quanLyBenhCaContext.PhuongPhapDieuTri!
                .Where(k => k.MaBenhCa == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.PhuongPhapDieuTri!.RemoveRange(ppdt);

            var bppn = _quanLyBenhCaContext.BienPhapPhongNgua!
                .Where(k => k.MaBenhCa == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.BienPhapPhongNgua!.RemoveRange(bppn);

            var lichSuChuanDoan = _quanLyBenhCaContext.LichSuChuanDoan!
                .Where(k => k.MaBenhCa == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.LichSuChuanDoan!.RemoveRange(lichSuChuanDoan);

            var anhBenhCa = _quanLyBenhCaContext.AnhBenhCa!
                .Where(k => k.MaBenhCa == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.AnhBenhCa!.RemoveRange(anhBenhCa);

            var tinTuc = _quanLyBenhCaContext.TinTucDichBenh!
                .Where(k => k.MaBc == Id) // Sử dụng Id của BenhCa để tìm các bản ghi liên quan
                .ToList();

            _quanLyBenhCaContext.TinTucDichBenh!.RemoveRange(tinTuc);

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

        public IActionResult SearchByTrieuChung()
        {
            var trieuChungList = _quanLyBenhCaContext.TrieuChungBenhCa!.Select(tc => new { tc.MaTcbc, tc.TenTrieuChung }).ToList();
            ViewBag.TrieuChungList = trieuChungList;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SearchByTrieuChung(List<int> selectedTrieuChung)
        {

            var benhCaList = _quanLyBenhCaContext.BenhCa!
                .Where(bc => _quanLyBenhCaContext.KetQuaChuanDoan!
                .Any(cd => cd.MaBc == bc.MaBc && selectedTrieuChung.Contains(cd.MaTcbc)))
                .Select(bc => new
                {
                    bc.MaBc,
                    bc.TenBc,
                    SoLuongTrieuChung = _quanLyBenhCaContext.KetQuaChuanDoan!
                    .Count(cd => cd.MaBc == bc.MaBc && selectedTrieuChung.Contains(cd.MaTcbc)), // Đếm số lượng triệu chứng liên quan
                    TrieuChungLienQuanList = _quanLyBenhCaContext.KetQuaChuanDoan!
                    .Where(cd => cd.MaBc == bc.MaBc && selectedTrieuChung.Contains(cd.MaTcbc))
                    .Select(cd => new { cd.MaTcbc, cd.TrieuChungBenhCa!.TenTrieuChung })
                    .ToList()
                })
                .OrderByDescending(bc => bc.SoLuongTrieuChung) // Sắp xếp theo số lượng triệu chứng giảm dần
                .FirstOrDefault(); // Lấy bệnh có nhiều triệu chứng nhất


            if(benhCaList != null)
            {
                // Lấy phương pháp điều trị và biện pháp phòng ngừa cho bệnh này
                var phuongPhapDieuTri = _quanLyBenhCaContext.PhuongPhapDieuTri!
                    .Where(pp => pp.MaBenhCa == benhCaList!.MaBc)
                    .Select(pp => new { pp.MaPpdt, pp.TenPpdt })
                    .ToList();

                var bienPhapPhongNgua = _quanLyBenhCaContext.BienPhapPhongNgua!
                    .Where(bp => bp.MaBenhCa == benhCaList!.MaBc)
                    .Select(bp => new { bp.MaBppn, bp.TenBppn })
                    .ToList();

                AnhBenhCa? url = _quanLyBenhCaContext.AnhBenhCa!
                    .Where(abc => abc.MaBenhCa == benhCaList!.MaBc) // Lấy các ảnh liên quan
                    .DefaultIfEmpty()
                    .FirstOrDefault();

                // Gửi phương pháp điều trị và biện pháp phòng ngừa tới View
                ViewBag.PhuongPhapDieuTri = phuongPhapDieuTri;
                ViewBag.BienPhapPhongNgua = bienPhapPhongNgua;
                ViewBag.TrieuChungLienQuanList = benhCaList!.TrieuChungLienQuanList;

                if (url != null)
                {
                    ViewBag.AnhBenhCa = url.DuongDanAnh;
                }
                else
                {
                    // Xử lý khi url là null, ví dụ: thông báo lỗi, gán giá trị mặc định, v.v.
                    ViewBag.AnhBenhCa = ""; // Ví dụ: gán URL mặc định
                }

                LichSuChuanDoan lscd = new LichSuChuanDoan();
                lscd.MaBenhCa = benhCaList!.MaBc;
                lscd.NgayTao = DateTime.Now;
                _quanLyBenhCaContext.LichSuChuanDoan!.Add(lscd);
                await _quanLyBenhCaContext.SaveChangesAsync();
            }
                

            var trieuChungList = _quanLyBenhCaContext.TrieuChungBenhCa!
                .Select(tc => new { tc.MaTcbc, tc.TenTrieuChung })
                .ToList();

            ViewBag.TrieuChungList = trieuChungList;
            ViewBag.BenhCaList = benhCaList;

            

            return View();
        }

    }
}
