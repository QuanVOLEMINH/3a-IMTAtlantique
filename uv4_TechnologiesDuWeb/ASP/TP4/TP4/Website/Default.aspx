<%@ Page MasterPageFile="~/MasterPage.master" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
   Accueil
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <asp:Label ID="Label1" runat="server" EnableTheming="false" Text="Bienvenu"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="This is a label with theming width. "></asp:Label>
</asp:Content>
