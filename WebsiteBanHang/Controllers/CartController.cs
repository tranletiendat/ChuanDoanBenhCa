using System;
using System.Collections.Generic;
using System.Web.Mvc;
using WebsiteBanHang.Context;
using WebsiteBanHang.Models;
namespace WebsiteBanHang.Controllers
{
    public class CartController : Controller
    {
        WebsiteBanHangEntities6 objWebsiteBanHangEntities = new WebsiteBanHangEntities6();
        // GET: Cart
        public ActionResult Index()
        {
         
            return View((List<CartModel>)Session["cart"]);
        }
      
        public ActionResult AddToCart(int id,int quantity)
        {
            if (Session["cart"] == null)
            {
                List<CartModel> cart = new List<CartModel>();
                cart.Add(new CartModel { Product = objWebsiteBanHangEntities.Product.Find(id), Quantity = quantity });
                Session["cart"] = cart;
                Session["count"] = 1;
            }
            else
            {
                List<CartModel> cart = (List<CartModel>)Session["cart"];
                //kiem tra san pham co trong gio hang chua
                int index = isExist(id);
                if (index != -1)
                {
                    //Neu ton tai thi cong them so luong    
                    cart[index].Quantity += quantity;
                }
                else
                {
                    //Neu khong ton tai thi them vao
                    cart.Add(new CartModel { Product = objWebsiteBanHangEntities.Product.Find(id), Quantity = quantity });
                    //tinh lai so san pham trong gio hang
                    Session["count"]= Convert.ToInt32(Session["count"]) +1;

                }
                Session["cart"] = cart;
            }
            return Json(new { Message = "Thanh cong", JsonRequestBehavior.AllowGet });
           
        }
        private int isExist(int id)
        {
            List<CartModel> cart = (List<CartModel>)Session["cart"];
            for(int i=0;i<cart.Count;i++)
            
                if (cart[i].Product.Id.Equals(id))
                    return i;
            return -1;
        }
        public ActionResult Remove(int Id)
        {
            List<CartModel> li = (List<CartModel>)Session["cart"];
            li.RemoveAll(x => x.Product.Id == Id);
            Session["cart"] = li;
            Session["count"] = Convert.ToInt32(Session["count"])-1;
            return Json(new { Message = "Thanh cong", JsonRequestBehavior.AllowGet });
        }
    }
}