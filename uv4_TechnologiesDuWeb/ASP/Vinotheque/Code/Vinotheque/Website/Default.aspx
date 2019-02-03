<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Default page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Bienvenue au site Web de la société "La Vinothèque", fondée en 1962</h2>
    <h3>Nous vous proposons des vins de qualité provenant de 10 régions françaises    </h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:laVinotheque %>" SelectCommand="SELECT DISTINCT [region] FROM [vins]"></asp:SqlDataSource>
    <ol>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>

                <li><%# Eval("region") %></li>

            </ItemTemplate>
        </asp:Repeater>
    </ol>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Catalogue.aspx" CssClass="button">Voir notre catalogue</asp:HyperLink>
    

</asp:Content>

