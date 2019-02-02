<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogue.aspx.cs" Inherits="Catalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Catalogue
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Veuillez choisir la région qui vous intéresse:</h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:laVinotheque %>" SelectCommand="SELECT DISTINCT [region] FROM [vins]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="region" DataValueField="region"></asp:DropDownList>
</asp:Content>

