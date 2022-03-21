<%@ Page Title="" Language="C#" MasterPageFile="~/SitePage.Master" AutoEventWireup="true" CodeBehind="contacts.aspx.cs" Inherits="ProjetoFinal.contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/contacts.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

    <div action="submit" runat="server" class="conteiner" method="post" >
    <h3>Faça contato conosco</h3>
            
        <div runat="server" class="contact">

            <label class="label-contact">Nome Completo</label>
            <asp:TextBox ID="namecontact" CssClass="txtcss" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="namecontact"></asp:RequiredFieldValidator>

            <label class="label-contact">E-mail</label>
            <asp:TextBox ID="emailcontact" CssClass="txtcss" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="emailcontact"></asp:RequiredFieldValidator>

            <label class="label-contact">Celular</label>
            <asp:TextBox ID="cellcontact" CssClass="txtcss" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cellcontact"></asp:RequiredFieldValidator>

            <label class="label-contact">Assunto</label>
            <asp:TextBox ID="subcontact" CssClass="txtcss" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="subcontact"></asp:RequiredFieldValidator>

            <label class="label-contact">Mensagem</label>
            <asp:TextBox ID="messagecontact" CssClass="txtcss" runat="server" Rows="5" Columns="50" textmode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="messagecontact"></asp:RequiredFieldValidator>

            <asp:Button ID="send" runat="server" CssClass="btncss" OnClick="btnSend_Click" Text="Enviar" />
            </div>

    </div>
        </form>
</asp:Content>
