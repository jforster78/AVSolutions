﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AvSolutions.Models;
using System.Web.ModelBinding;

namespace AvSolutions
{
    public partial class ProductList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //GetProducts Method to query the product database and display the products by category id.
        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.CategoryID == categoryId);
            }
            return query;
        }
    }
}