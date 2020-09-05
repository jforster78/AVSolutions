<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="AvSolutions.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <!-- FormView control is used for a more flexible layout when displaying a single record using the select method property. -->
    <!-- ItemTemplate is used to render the particular record displayed in the FormView. -->
    <asp:FormView ID="productDetail" runat="server" ItemType="AvSolutions.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.ProductName %></h1><!-- This will display the ProductName through model binding using the h1 tag within the CSS -->
            </div>
            <hr /><!-- horizintal line -->
            <table><!-- Creates a table -->
                <tr><!-- This is a table row -->
                    <td><!-- This is used for table data -->
                        <img src="/Catalog/Images/<%#:Item.ImagePath %>" style="height:350px; width:500px" alt="<%#:Item.ProductName %>"/><!-- Will display the image through model binding of the ProductId -->
                    </td><!-- This is used for table data -->
                    <td>&nbsp;</td><!-- This is used for table data -->  
                    <td style="vertical-align: top; text-align:left;"><!-- This is used for table data -->
                        <br /><!-- Line break -->
                        <br /><!-- Line break -->
                        <strong>Description:</strong>&nbsp;<%#:Item.Description %><!-- This will display the Description in bold through model binding based on the ProductId -->
                        <br /><!-- Line break -->
                        <strong>Price:</strong>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %><!-- This will display the UnitPrice in bold through model binding based on the ProductId -->
                        <br /><!-- Line break -->
                        <strong>Product Number:</strong>&nbsp;<%#:Item.ProductID %><!-- This will display the productID in bold through model binding based on the ProductId -->
                        <br /><!-- Line break -->
                        <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>"><!-- This will add the product to the cart through model binding based on the ProductId -->
                        <br /><!-- Line break -->
                        <strong class="ProductListItem">Add To Cart<strong><!-- This will display the Add To Cart textin bold using the class ProductListItem within the CSS -->
                        </a><!-- This will add the product to the cart through model binding based on the ProductId End -->
                    </td><!-- This is used for table data -->
                </tr><!-- This is a table row End -->
            </table><!-- Creates a table End -->
        </ItemTemplate>
    </asp:FormView>
    <!-- ItemTemplate is used to render the particular record displayed in the FormView End. -->
    <!-- FormView control is used for a more flexible layout when displaying a single record using the select method property End -->

</asp:Content>