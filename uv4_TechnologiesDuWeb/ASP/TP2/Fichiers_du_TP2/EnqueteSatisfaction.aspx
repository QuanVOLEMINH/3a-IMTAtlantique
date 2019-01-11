<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EnqueteSatisfaction.aspx.cs" Inherits="EnqueteSatisfaction" Title="Enquête de satisfaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:Wizard ID="Wizard1" 
            FinishDestinationPageUrl="~/EnqueteSatisfactionTerminee.aspx" 
            DisplaySideBar="False" 
            ActiveStepIndex="0" 
            runat="server">
        <WizardSteps>
           <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                <h3>Bienvenue! Nous souhaiterions vous poser quelques questions pour améliorer nos services.</h3>
            </asp:WizardStep>
              <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                <h3>Expliquez nous ce qui vous a amené sur notre site AffairesSansRisque ?</h3>
                <hr />
                <asp:TextBox ID="TextBox1" EnableTheming="False" TextMode="MultiLine" runat="server" Height="128px" Width="455px"></asp:TextBox>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                <h3>Pouvez-vous préciser votre opinion sur la notion de "Risque" ?</h3>
                <hr/>
                <asp:RadioButtonList ID="RadioButtonList1" Runat="server">
                    <asp:ListItem Value="J'ai toujours r&#234;v&#233; de faire des affaires sans risque !" Selected="True" />
                    <asp:ListItem Value="Puisque le risque Z&#233;ro n'existe pas, je ne comprends pas ce que fait votre site !" />
                    <asp:ListItem Value="Je ne vois pas l'int&#233;r&#234;t de faire des affaires sans risque..." />
                </asp:RadioButtonList>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep4" runat="server" 
            Title="Step 4" OnActivate="ActivationDernierEtape" >
                <h3>Pouvez-vous confirmer vos choix ?</h3>
                <hr />
                <asp:Label ID="Label1" Runat="server" EnableTheming="false" />                         
            </asp:WizardStep>
        </WizardSteps>
        <StepStyle Height="140px" VerticalAlign="Top" />
    </asp:Wizard>
</asp:Content>

