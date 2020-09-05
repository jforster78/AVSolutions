using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using AvSolutions.Logic;

namespace AvSolutions
{
    //AddToCart class
    public partial class AddToCart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* When the page is loaded the product ID is retieved from the query string.
            Then an instance of the shopping cart is created and used to call the AddToCart Method. */

            string rawId = Request.QueryString["ProductID"];
            int productId;
            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
            {
                using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
                {
                    usersShoppingCart.AddToCart(Convert.ToInt16(rawId));
                }

            }
            else
            {
                Debug.Fail("ERROR : We should never get to AddToCart.aspx without a ProductId.");
                throw new Exception("ERROR : It is illegal to load AddToCart.aspx without setting a ProductId.");
            }

            //Redirects to the shopping cart where the user can see an updated list of items in the cart.
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}