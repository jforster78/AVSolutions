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
    public partial class ProductSearch : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //GetProduct Method to query the product database and display the product by product name.
        public IQueryable<Product> GetProductSearch([QueryString("productName")] string keyword)
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
            if (!String.IsNullOrEmpty(keyword))
            {
                query = query.Where(p => p.ProductName.Contains(keyword));
            }
            return query;
        }
    }
}