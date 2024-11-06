using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Context;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    public class PaymentController : Controller
    {
        WebsiteBanHangEntities6 objWebsiteBanHangEntities = new WebsiteBanHangEntities6();
        // GET: Payment
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                //lay thong tin gio hang tu bien session
                var lstCart = (List<CartModel>)Session["cart"];
                //gan du lieu cho order
                Order objorder = new Order();
                objorder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objorder.Id = int.Parse(Session["idUser"].ToString());
                objorder.CreatedOnUtc = DateTime.Now;
                objorder.Status = 1;
                objWebsiteBanHangEntities.Order.Add(objorder);
                //luu thong tin vao bang order
                objWebsiteBanHangEntities.SaveChanges();

                //lay orderId vua moi tao de luu vao bang OrderDetail
                int intOrderId = objorder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();
                foreach (var item in lstCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = intOrderId;
                    obj.ProductId = item.Product.Id;
                    lstOrderDetail.Add(obj);
                    
                }
                objWebsiteBanHangEntities.OrderDetail.AddRange(lstOrderDetail);
                objWebsiteBanHangEntities.SaveChanges();
            }
            return View();
        }
    }
}