using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Context;

namespace WebsiteBanHang.Controllers
{
    public class ProductController : Controller
    {
        WebsiteBanHangEntities6 objWebsiteBanHangEntities = new WebsiteBanHangEntities6();
        // GET: Product

        public ActionResult Detail(int Id)
        {
            var objProduct = objWebsiteBanHangEntities.Product.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        public ActionResult Index()
        {
            var lstProducts = objWebsiteBanHangEntities.Product.ToList();

            return View(lstProducts);
        }

        public ActionResult Create()
        {
            return View(new Product() { Price = 0, PriceDiscount = 0 });
        }
        [HttpPost]
        public ActionResult Create(Product model)
        {
            //Lưu dữ liệu vào db
            if (string.IsNullOrEmpty(model.Name) == true)
            {
                ModelState.AddModelError("", "Tên sản phẩm không được để trống!!!");
                return View(model);
            }
            if (model.Price <= 0)
            {
                ModelState.AddModelError("", "Giá bán phải lớn hơn 0!!!");
                return View(model);
            }
            //Lưu
            WebsiteBanHangEntities6 db = new WebsiteBanHangEntities6();
            db.Product.Add(model);
            db.SaveChanges();
            if (model.Id > 0)
            {
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "Lỗi không lưu được vào DB!!!");
                return View(model);
            }
        }

        public ActionResult Edit(int Id)
        {
            var productModel = objWebsiteBanHangEntities.Product.Where(n => n.Id == Id).FirstOrDefault();
            return View(productModel);
        }
        [HttpPost]
        public ActionResult Edit(Product model)
        {
            //Lưu dữ liệu vào db
            if (string.IsNullOrEmpty(model.Name) == true)
            {
                ModelState.AddModelError("", "Tên sản phẩm không được để trống!!!");
                return View(model);
            }
            if (model.Price <= 0)
            {
                ModelState.AddModelError("", "Giá bán phải lớn hơn 0!!!");
                return View(model);
            }
            //Tìm đối tượng cần sửa
            var EditModel = objWebsiteBanHangEntities.Product.Where(n => n.Id == model.Id).FirstOrDefault();
            //Gắn giá trị mới cho đối tượng
            EditModel.Name = model.Name;
            EditModel.Avatar = model.Avatar;
            EditModel.CategoryId = model.CategoryId;
            EditModel.ShortDes = model.ShortDes;
            EditModel.FullDescription = model.FullDescription;
            EditModel.Price = model.Price;
            EditModel.PriceDiscount = model.PriceDiscount;
            EditModel.TypeId = model.TypeId;
            EditModel.Slug = model.Slug;
            EditModel.BrandId = model.BrandId;
            var id = objWebsiteBanHangEntities.SaveChanges();
            if (id > 0)
            {
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "Lỗi không lưu được vào DB!!!");
                return View(model);
            }
        }

        public ActionResult Delete(int Id)
        {
            var productModel = objWebsiteBanHangEntities.Product.Where(n => n.Id == Id).FirstOrDefault();
            objWebsiteBanHangEntities.Product.Remove(productModel);
            objWebsiteBanHangEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}