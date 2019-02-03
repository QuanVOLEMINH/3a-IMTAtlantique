<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogue.aspx.cs" Inherits="Catalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Catalogue
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Veuillez choisir la région qui vous intéresse:</h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:laVinotheque %>" SelectCommand="SELECT DISTINCT [region] FROM [vins]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="region" DataValueField="region" CssClass="dropdown"></asp:DropDownList>

    <asp:SqlDataSource ID="listeVins" runat="server" ConnectionString="<%$ ConnectionStrings:laVinotheque %>" SelectCommand="SELECT * FROM [vins] WHERE ([region] = @region)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="region" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="listeVins">
        <ItemTemplate>
            <div class="vin-item">
                <table>
                    <tr>
                        <td style="height: 163px">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/App_Themes/Default/" + Eval("nomgif") %>' Height="120px" Width="150px" />
                        </td>
                        <td style="height: 163px">
                            <div class="description">
                                <strong>
                                    <%# Container.ItemIndex + 1 %>. <asp:Label ID="nomLabel" runat="server" Text='<%# Eval("nom") %>' />
                                </strong>
                                <br />
                                Millesime:           
                                    <asp:Label ID="millesimeLabel" runat="server" Text='<%# Eval("millesime") %>' />
                                <br />
                                Prix:
                                    <asp:Label ID="prixLabel" runat="server" Text='<%# Eval("prix") + "€" %>' />

                                (<%# Service.convertEuroToFrancs(Convert.ToSingle(Eval("prix")))%>FF)

                                <br />
                                Quantite:
                                    <asp:TextBox ID="quantite" runat="server" Text='<%# Profile.MaCaddie.GetQuantityByIdVin((int)Eval("idvin"))%>'></asp:TextBox>
                                <div class="error">
                                    <asp:RangeValidator runat="server" Type="Integer"
                                        MinimumValue="0" MaximumValue="400" ControlToValidate="quantite"
                                        ErrorMessage="Value must be a whole number between 0 and 400" />
                                </div>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="table-button" CommandArgument='<%# Container.ItemIndex + ";" + Eval("idvin") %>' OnCommand="AddToCaddie">Commander</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <hr />
    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="button" NavigateUrl="~/Caddie.aspx">Caddie</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="button" NavigateUrl="~/Default.aspx">Accueil</asp:HyperLink>
</asp:Content>


