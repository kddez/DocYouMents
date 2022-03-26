﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="ProjetoFinal.cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
          <title>Formulário de Login e Registro com HTML5 e CSS3</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
  <link rel="shortcut icon" href="assets/img/logo_512.png" type="image/png"/>
  <link rel="stylesheet" type="text/css" href="css/logincad.css" />
</head>
<body>

  <div class="container" >     
    <div class="content">   
    
      <!--FORMULÁRIO DE CADASTRO-->
      <div id="cadastro">
        <form id="form1" runat="server">
   <img id="logo" src="assets/img/logo_64.png" alt="YouMents Logo">

          <h1>Cadastre-se no Youments</h1> 
           
          <p> 
            <label class="labelcss" for="nome_cad">Nome</label>
              <asp:TextBox CssClass="txtcss" ID="tbNome" runat="server"></asp:TextBox>
          </p>
           
          <p> 
            <label class="labelcss" for="email_cad">E-mail</label>            
              <asp:TextBox CssClass="txtcss" ID="tbEmail" runat="server"></asp:TextBox>
              <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
              ControlToValidate="tbEmail" ErrorMessage="Digite um e-mail válido"></asp:RegularExpressionValidator>
                </p>

            <p> 
            <label class="labelcss" for="senha_cad">Senha</label>            
              <asp:TextBox CssClass="txtcss" ID="tbSenha" runat="server"></asp:TextBox>
              <asp:regularexpressionvalidator id="RegularExpressionValidator3" display="Dynamic" errormessage="A senha deve ter entre 8-10 caracteres com pelo menos uma letra/número."
              validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" controltovalidate="tbSenha" runat="server">
                  </asp:regularexpressionvalidator>
          </p>


                <asp:Label ID="msg" runat="server"></asp:Label>

           
          <p>
              <asp:Button CssClass="btnCadastrar" ID="btCadastrar" runat="server" Text="Cadastrar" OnClick="btCadastrar_Click" />
          </p>
           
          <p class="link">  
            Já tem conta?
            <a href="login.aspx"> Ir para Login </a>
          </p>
        </form>
      </div>
    </div>
  </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [usuario] WHERE [email] = @email" InsertCommand="INSERT INTO [usuario] ([email], [senha], [nome]) VALUES (@email, @senha, @nome)" SelectCommand="SELECT [Id], [email], [senha], [nome] FROM [usuario]" UpdateCommand="UPDATE [usuario] SET [Id] = @Id, [senha] = @senha, [nome] = @nome WHERE [email] = @email">
        <DeleteParameters>
            <asp:Parameter Name="email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="senha" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="senha" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</body>
</html>