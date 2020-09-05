<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AvSolutions._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        
        <h1><%: Title %></h1><!-- This displays the Welcome message on the homepage using the h1 tag within the CSS -->
        <hr /><!-- This will display a horizontal line on the homepage -->
        
        <section><!-- Homepage form section -->
            <h2>Ultimate AV Solutions can help with all your Home Entertainment Solutions.</h2><!-- Displays the message on the homepage using the h2 tags within the CSS -->
            <p>We are all about the latest technology in Televisions, Soundbars and other Audio equipment. 
               You can order any of our entertainment systems today. 
               Each of our technologies has detailed information to help you choose the product that best suits you.</p><!-- Displays a greeting message on the homepage using the p tag within the CSS -->
        </section><!-- Homepage form section End -->

</asp:Content>