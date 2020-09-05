<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="AvSolutions.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <h2><%: Page.Title %></h2><!-- This displays the header on the page using the h2 tag within the CSS and uses the @page title (Products) -->
        <hr /><!-- horizintal line -->
        <br /><!-- Line break -->

    <section><!-- ProductList section -->
        <!-- ListView control enables you to bind to data items that are returned from a data source and display them. You can display data in pages. You can display items individually, or you can group them and uses the select method property. -->
        <!-- EmptyDataTemplate is displayed in a ListView control when the data source that is bound to the control does not contain any records. The template is rendered instead of the LayoutTemplate template. -->
        <!-- EmptyItemTemplate is displayed in a ListView control when there are no more data items to display in the last group of the current page. This can occur only if GroupItemCount is set to a value greater than 1. -->
        <!-- GroupTemplate creates a tiled layout in the ListView control. In a tiled table layout, the items are repeated horizontally in a row. The numbers of times that an item is repeated is specified by the GroupItemCount property. -->
        <!-- ItemTemplate is required by the ListView control. It contains controls to display the field values of a record -->
        <!-- LayoutTemplate is to define a custom user interface for the root container of the ListView control.  It must have the runat attribute set to "server" and the ID attribute set to the value of the ItemPlaceholderID or the GroupPlaceholderID property for groups. -->
        <asp:ListView ID="productList" runat="server" DataKeyNames="ProductID" GroupItemCount="4" ItemType="AvSolutions.Models.Product" SelectMethod="GetProducts">
            <EmptyDataTemplate>
                <table ><!-- Creates a table -->
                    <tr><!-- This is a table row -->
                        <td>No data was returned.</td><!-- This will display if there is no data retrieved from the database -->
                    </tr><!-- This is a table row End -->
                </table><!-- Creates a table End -->
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td /><!-- This is for table data -->
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server"><!-- This is for table data -->
                    <table style="border:solid lightgrey 1px; margin-bottom: 20px;"><!-- Creates a table with a lightgrey 1px border -->
                        <tr><!-- This is a table row -->
                            <td><!-- This is for table data -->
                                <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>"><!-- This is a link to the ProductDetails page based on the ProductId -->
                                <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>" style="height: 175px; width: 250px;" /></a><!-- Will display the image through model binding of the ProductId using the img tag -->
                            </td><!-- This is for table data -->
                        </tr><!-- This is a table row End -->
                        <tr><!-- This is a table row -->
                            <td><!-- This is for table data -->
                                <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>"><!-- This is a link to the ProductDetails page based on the ProductId -->
                                    <span class="ProductListItem stepin"><!-- This will display the ProductName using the class stepin within the CSS -->
                                        <%#:Item.ProductName%>
                                    </span>
                                </a><!-- This is a link to the ProductDetails page based on the ProductId End -->
                                <br /><!-- Line break -->
                                    <span class="stepin">
                                        <strong>Price: </strong><%#:String.Format("{0:c}", Item.UnitPrice)%><!-- This will display the Price using the class stepin within the CSS -->
                                    </span>
                                <br /><!-- Line break -->
                                <br /><!-- Line break -->
                                <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>"><!-- This will add the product to the cart through model binding based on the ProductId -->             
                                    <span class="ProductListItem stepin"> 
                                        <strong>Add To Cart<strong><!-- This will display the Add To Cart text using the class stepin within the CSS -->
                                    </span>           
                                </a><!-- This will add the product to the cart through model binding based on the ProductId End -->
                            </td><!-- This is for table data -->
                        </tr><!-- This is a table row End -->
                        <tr><!-- This is a table row -->
                            <td>&nbsp;</td><!-- This is for spacing  -->
                        </tr><!-- This is a table row End -->
                    </table><!-- Creates a table with a lightgrey 1px border End -->
                </td><!-- This is for table data -->
            </ItemTemplate>
            <LayoutTemplate>
                <table style="width:100%;"><!-- Creates a table with a 100% width -->
                    <tbody><!-- This is a table body -->
                        <tr><!-- This is a table row -->
                            <td><!-- This is for table data -->
                                <table id="groupPlaceholderContainer" runat="server" style="width:100%"><!-- Creates a table with a 100% width -->
                                    <tr id="groupPlaceholder"></tr>
                                </table><!-- Creates a table with a 100% width End -->
                            </td><!-- This is for table data -->
                        </tr><!-- This is a table row End -->
                        <tr><!-- This is a table row -->
                            <td></td><!-- This is for table -->
                        </tr><!-- This is a table row End -->
                        <tr></tr><!-- This is a table row -->
                    </tbody><!-- This is a table body -->
                </table><!-- Creates a table with a 100% width End -->
            </LayoutTemplate>
        </asp:ListView>
        <!-- ListView control enables you to bind to data items that are returned from a data source and display them. You can display data in pages. You can display items individually, or you can group them and uses the select method property End. -->
        <!-- EmptyDataTemplate is displayed in a ListView control when the data source that is bound to the control does not contain any records. The template is rendered instead of the LayoutTemplate template End. -->
        <!-- EmptyItemTemplate is displayed in a ListView control when there are no more data items to display in the last group of the current page. This can occur only if GroupItemCount is set to a value greater than 1 End. -->
        <!-- GroupTemplate creates a tiled layout in the ListView control. In a tiled table layout, the items are repeated horizontally in a row. The numbers of times that an item is repeated is specified by the GroupItemCount property End. -->
        <!-- ItemTemplate is required by the ListView control. It contains controls to display the field values of a record End. -->
        <!-- LayoutTemplate is to define a custom user interface for the root container of the ListView control.  It must have the runat attribute set to "server" and the ID attribute set to the value of the ItemPlaceholderID or the GroupPlaceholderID property for groups End. -->
    </section><!-- ProductList section End -->

</asp:Content>