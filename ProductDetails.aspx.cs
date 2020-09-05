using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AvSolutions.Models;
using System.Web.ModelBinding;

namespace AvSolutions
{
    public partial class ProductDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //GetProduct Method to query the product database and display the products if they have a product id.
        public IQueryable<Product> GetProduct([QueryString("productID")] int? productId)
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID == productId);
            }
            return query;
        }
    }
}