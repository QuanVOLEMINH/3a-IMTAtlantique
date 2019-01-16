<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MaSelectionDAnnonces.aspx.cs" Inherits="MaSelectionDAnnonces" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Ma Selection d'Annonces
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" SelectMethod="Select" TypeName="AnnoncesFavoritesDB">
        <DeleteParameters>
            <asp:Parameter Name="Ann_Id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" SkinID="tableMaitre" style="margin-right: 0px" DataKeyNames="Ann_Id" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="Ann_Email" HeaderText="Email" SortExpression="Ann_Email" />
            <asp:BoundField DataField="Ann_Ville" HeaderText="Ville" SortExpression="Ann_Ville" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

