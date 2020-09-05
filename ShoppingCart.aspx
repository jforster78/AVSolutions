<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="AvSolutions.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="ShoppingCartTitle" runat="server" class="ContentHead">
        <h2><%: Title %></h2><!-- This displays the header on the page using the h2 tag within the CSS and uses the @page title (Shopping Cart) -->
        <hr /><!-- horizintal line -->
    </div>
    <br />

    <section><!-- Shopping Cart section -->
        <!-- The GridView control displays the values of a data source in a table. Each column represents a field, while each row represents a record -->
        <!-- The TemplateField class is used by data-bound controls (such as GridView and DetailsView) to display custom content for each record displayed -->
        <!-- ItemTemplate specifies the content to display for the items in a TemplateField object -->
        <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
            ItemType="AvSolutions.Models.CartItem" SelectMethod="GetShoppingCartItems" 
            CssClass="table table-striped table-bordered" >   
            <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />     
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />        
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
            <asp:TemplateField   HeaderText="Quantity">            
                    <ItemTemplate>
                        <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox><!-- This displays the quantity within a textbox --> 
                    </ItemTemplate>        
            </asp:TemplateField>    
            <asp:TemplateField HeaderText="Item Total">            
                    <ItemTemplate>
                        <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%><!-- This displays the price based on the quantity -->
                    </ItemTemplate>        
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Remove Item">            
                    <ItemTemplate>
                        <asp:CheckBox id="Remove" runat="server"></asp:CheckBox><!-- This is a checkbox to remove products from the cart -->
                    </ItemTemplate>        
            </asp:TemplateField>    
            </Columns>    
        </asp:GridView>
        <!-- The GridView control displays the values of a data source in a table. Each column represents a field, while each row represents a record End -->
        <!-- The TemplateField class is used by data-bound controls (such as GridView and DetailsView) to display custom content for each record displayed End -->
        <!-- ItemTemplate specifies the content to display for the items in a TemplateField object End -->

        <div><!-- Displays the total order cost -->
            <strong>
                <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label><!-- Displays the order Total text -->
                <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label><!-- Displays the actual total price -->
            </strong> 
        </div><!-- Displays the total order cost end -->
    
        <br /><!-- Line break -->
    
        <div><!-- Buttons to update and checkout -->
            <asp:Button ID="UpdateBtn" CssClass="btn" style="margin-left: 0;" runat="server" Text="Update" OnClick="UpdateBtn_Click" />&nbsp;<!-- Displays the button using the class btn within the CSS and uses a OnClick function -->
            <asp:Button ID="CheckoutBtn" CssClass="btn" style="margin-left: 0;" runat="server" Text="Checkout" OnClick="CheckoutBtn_Click" /><!-- Displays the button using the class btn within the CSS and uses a OnClick function -->
        </div><!-- Buttons to update and checkout end -->
    </section><!-- Shopping Cart section End -->

</asp:Content>