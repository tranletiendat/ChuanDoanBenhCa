using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ClosedXML.Excel;
using ChanDoanBenhCa.Models;
using ChanDoanBenhCa.Models.ViewModels;


namespace ChanDoanBenhCa.Controllers
{
    public class BaoCaoThongKeController : Controller
    {
        private readonly QuanLyBenhCaContext _quanLyBenhCaContext;

        public BaoCaoThongKeController(QuanLyBenhCaContext quanLyBenhCaContext)
        {
            _quanLyBenhCaContext = quanLyBenhCaContext;
        }

        public async Task<IActionResult> BaoCaoThongKe()
        {
            DateTime currentDate = DateTime.Now;

            var data = await _quanLyBenhCaContext.BenhCa!
                .Select(bc => new
                {
                    TenBc = bc.TenBc,
                    SoLanChuanDoan = _quanLyBenhCaContext.LichSuChuanDoan!
                        .Where(ls => ls.NgayTao.Month == currentDate.Month &&
                                     ls.NgayTao.Year == currentDate.Year &&
                                     ls.MaBenhCa == bc.MaBc)
                        .Count()
                })
                .ToListAsync();

            return View(data);
        }

        public async Task<IActionResult> XuatBaoCaoThongKe()
        {
            var stream = await XuatBaoCaoThongKeStream(); // Sử dụng hàm đã viết để xuất dữ liệu
            var excelName = $"BaoCaoThongKeThang-{DateTime.Now:MM}.xlsx";
            return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", excelName);
        }


        public async Task<MemoryStream> XuatBaoCaoThongKeStream()
        {
            var stream = new MemoryStream();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("BÁO CÁO THỐNG KÊ");

                // Thiết lập tiêu đề
                worksheet.Cell("A1").Value = "BẢNG BÁO CÁO THỐNG KÊ KẾT QUẢ CHUẨN ĐOÁN THÁNG " + DateTime.Now.ToString("MM");
                worksheet.Cell("C3").Value = DateTime.Now.ToString("HH'h'mm 'ngày' dd-MM-yyyy");

                worksheet.Range("A1:C1").Merge();
                worksheet.Cell("A1").Style.Font.SetBold(true);
                worksheet.Cell("A1").Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

                // Tiêu đề cột
                string[] headers = { "STT", "Tên Bệnh Cá", "Số lần chuẩn đoán"};
                for (int i = 0; i < headers.Length; i++)
                {
                    worksheet.Cell(5, i + 1).Value = headers[i];
                    worksheet.Cell(5, i + 1).Style.Font.SetBold(true);
                    worksheet.Cell(5, i + 1).Style.Border.OutsideBorder = XLBorderStyleValues.Thin;
                    worksheet.Cell(5, i + 1).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                }

                // Thiết lập độ rộng cột
                worksheet.Column(1).Width = 10;
                worksheet.Column(2).Width = 50;
                worksheet.Column(3).Width = 20;

                DateTime currentDate = DateTime.Now;

                var data = await _quanLyBenhCaContext.BenhCa!
                .Select(bc => new
                {
                    TenBc = bc.TenBc,
                    SoLanChuanDoan = _quanLyBenhCaContext.LichSuChuanDoan!
                        .Where(ls => ls.NgayTao.Month == currentDate.Month &&
                                     ls.NgayTao.Year == currentDate.Year &&
                                     ls.MaBenhCa == bc.MaBc)
                        .Count()
                })
                .ToListAsync();

                // Điền dữ liệu vào bảng
                int currentRow = 6;
                int stt = 1;
                foreach (var item in data)
                {
                    worksheet.Cell(currentRow, 1).Value = stt;
                    worksheet.Cell(currentRow, 2).Value = item.TenBc;
                    worksheet.Cell(currentRow, 3).Value = item.SoLanChuanDoan;

                    // Thiết lập viền cho mỗi ô trong hàng
                    for (int col = 1; col <= 3; col++)
                    {
                        worksheet.Cell(currentRow, col).Style.Border.OutsideBorder = XLBorderStyleValues.Thin;
                        if (col != 2)
                        {
                            worksheet.Cell(currentRow, col).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                            worksheet.Cell(currentRow, col).Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
                        }
                    }

                    currentRow++;
                    stt++;
                }

                workbook.SaveAs(stream);
            }

            stream.Position = 0;
            return stream;
        }
    }
}
