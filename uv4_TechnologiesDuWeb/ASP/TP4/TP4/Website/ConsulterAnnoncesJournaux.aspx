<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsulterAnnoncesJournaux.aspx.cs" Inherits="ConsulterAnnoncesJournaux" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Consulter Annonces Journaux
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">

        <asp:SqlDataSource ID="dsAnnonces2" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" DeleteCommand="DELETE FROM [Annonces] WHERE [Ann_Id] = @Ann_Id" InsertCommand="INSERT INTO [Annonces] ([Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Ann_UserEmail], [Reg_Id], [Cat_Id]) VALUES (@Ann_Texte, @Ann_Telephone, @Ann_Email, @Ann_Prix, @Ann_Ville, @Ann_CodePostal, @Ann_UserEmail, @Reg_Id, @Cat_Id)" SelectCommand="SELECT [Ann_Id], [Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Ann_UserEmail], [Reg_Id], [Cat_Id] FROM [Annonces]" UpdateCommand="UPDATE [Annonces] SET [Ann_Texte] = @Ann_Texte, [Ann_Telephone] = @Ann_Telephone, [Ann_Email] = @Ann_Email, [Ann_Prix] = @Ann_Prix, [Ann_Ville] = @Ann_Ville, [Ann_CodePostal] = @Ann_CodePostal, [Ann_UserEmail] = @Ann_UserEmail, [Reg_Id] = @Reg_Id, [Cat_Id] = @Cat_Id WHERE [Ann_Id] = @Ann_Id">
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
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Ann_Ville" HeaderText="Ville" SortExpression="Ann_Ville" />
                <asp:BoundField DataField="Ann_CodePostal" HeaderText="Code postal" SortExpression="Ann_CodePostal" />
                <asp:BoundField DataField="Ann_Email" HeaderText="Email" SortExpression="Ann_Email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsJournaux" runat="server" ConnectionString="<%$ ConnectionStrings:csAffairesSansRisque %>" SelectCommand="SELECT * FROM [ListeJournauxParAnnonce] WHERE ([Ann_Id] = @Ann_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Ann_Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsJournaux" SkinID="tableDetails">
            <Columns>
                <asp:BoundField DataField="Jou_Publication" HeaderText="Jou_Publication" SortExpression="Jou_Publication" />
                <asp:BoundField DataField="Jou_Tirage" HeaderText="Jou_Tirage" SortExpression="Jou_Tirage" />
                <asp:BoundField DataField="Jou_LimiteDepot" HeaderText="Jou_LimiteDepot" SortExpression="Jou_LimiteDepot" />
                <asp:BoundField DataField="Jou_Parution" HeaderText="Jou_Parution" SortExpression="Jou_Parution" />
            </Columns>
        </asp:GridView>
</asp:Content>

