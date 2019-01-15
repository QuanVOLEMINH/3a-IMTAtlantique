<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdministrerAnnonces.aspx.cs" Inherits="AdministrerAnnonces" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Administrer Annonces
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
        <asp:SqlDataSource ID="dsAnnonces2" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" DeleteCommand="DELETE FROM [Annonces] WHERE [Ann_Id] = @Ann_Id" InsertCommand="INSERT INTO [Annonces] ([Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Ann_UserEmail], [Reg_Id], [Cat_Id]) VALUES (@Ann_Texte, @Ann_Telephone, @Ann_Email, @Ann_Prix, @Ann_Ville, @Ann_CodePostal, @Ann_UserEmail, @Reg_Id, @Cat_Id)" ProviderName="<%$ ConnectionStrings:csAffairesSansRisque.ProviderName %>" SelectCommand="SELECT [Ann_Id], [Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Ann_UserEmail], [Reg_Id], [Cat_Id] FROM [Annonces]" UpdateCommand="UPDATE [Annonces] SET [Ann_Texte] = @Ann_Texte, [Ann_Telephone] = @Ann_Telephone, [Ann_Email] = @Ann_Email, [Ann_Prix] = @Ann_Prix, [Ann_Ville] = @Ann_Ville, [Ann_CodePostal] = @Ann_CodePostal, [Ann_UserEmail] = @Ann_UserEmail, [Reg_Id] = @Reg_Id, [Cat_Id] = @Cat_Id WHERE [Ann_Id] = @Ann_Id">
            <DeleteParameters>
                <asp:Parameter Name="Ann_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ann_Texte" Type="String" />
                <asp:Parameter Name="Ann_Telephone" Type="String" />
                <asp:Parameter Name="Ann_Email" Type="String" />
                <asp:Parameter Name="Ann_Prix" Type="String" />
                <asp:Parameter Name="Ann_Ville" Type="String" />
                <asp:Parameter Name="Ann_CodePostal" Type="String" />
                <asp:Parameter Name="Ann_UserEmail" Type="String" />
                <asp:Parameter Name="Reg_Id" Type="Int32" />
                <asp:Parameter Name="Cat_Id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ann_Texte" Type="String" />
                <asp:Parameter Name="Ann_Telephone" Type="String" />
                <asp:Parameter Name="Ann_Email" Type="String" />
                <asp:Parameter Name="Ann_Prix" Type="String" />
                <asp:Parameter Name="Ann_Ville" Type="String" />
                <asp:Parameter Name="Ann_CodePostal" Type="String" />
                <asp:Parameter Name="Ann_UserEmail" Type="String" />
                <asp:Parameter Name="Reg_Id" Type="Int32" />
                <asp:Parameter Name="Cat_Id" Type="Int32" />
                <asp:Parameter Name="Ann_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="dsAnnonces2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ann_Id" SkinID="tableMaitre">
            <Columns>
                <asp:BoundField DataField="Ann_Ville" HeaderText="Ville" SortExpression="Ann_Ville" />
                <asp:BoundField DataField="Ann_CodePostal" HeaderText="Code postal" SortExpression="Ann_CodePostal" />
                <asp:BoundField DataField="Ann_Email" HeaderText="Email" SortExpression="Ann_Email" />
                <asp:HyperLinkField DataNavigateUrlFields="Ann_Id" DataNavigateUrlFormatString="DetailsAnnonce.aspx?ID={0}" HeaderText="Details" Text="Details" />
            </Columns>
        </asp:GridView>
</asp:Content>

