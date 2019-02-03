<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recapitulative.aspx.cs" Inherits="Recapitulative" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Recapitulative
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Verifiez votre caddie:</h3>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="CaddieDB"></asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ShowHeaderWhenEmpty="True" CssClass="table">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Denomination">
                <ItemTemplate>
                    <%# Eval("nom") %>
                    (<%# Eval("region") %>)
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantite">
                <ItemTemplate>
                    <%# Eval("quantite") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prix unitaire">
                <ItemTemplate>
                    <%# Eval("prix") %>€
                    (<%# Service.convertEuroToFrancs(Convert.ToSingle(Eval("prix")))%>FF)
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <%# Profile.MaCaddie.GetToTalByIdVin((int)Eval("idvin"), Convert.ToSingle(Eval("prix"))) %>€
                    (<%# Service.convertEuroToFrancs(Profile.MaCaddie.GetToTalByIdVin((int)Eval("idvin"), Convert.ToSingle(Eval("prix"))))%>FF)
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="CaddiePriceDB"></asp:ObjectDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource2" CssClass="price">
        <ItemTemplate>
            <h4>Total Hors Taxe:  <%# Eval("total") %>€ (<%# Service.convertEuroToFrancs(Convert.ToSingle(Eval("total")))%>FF)</h4>
            <h4>TVA:  <%# Service.TVARate()*100 %>%): <%# Service.TaxAmount(Convert.ToSingle(Eval("total"))) %>€ (<%# Service.convertEuroToFrancs(Service.TaxAmount(Convert.ToSingle(Eval("total"))))%>FF)</h4>
            <h4>Total Toutes Taxes Comprises:  <%# Service.PrixAfterTax(Convert.ToSingle(Eval("total"))) %>€ (<%# Service.convertEuroToFrancs(Service.PrixAfterTax(Convert.ToSingle(Eval("total"))))%>FF)</h4>
        </ItemTemplate>
    </asp:DataList>

     <asp:HyperLink ID="HyperLink2" runat="server" CssClass="button" NavigateUrl="~/Caddie.aspx">Retourner a la Caddie</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="button" NavigateUrl="~/Confirmation.aspx">Valider</asp:HyperLink>

</asp:Content>

