<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProjetoFinal.logincad" %>

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
    
    <form id="form1" runat="server">

  <div class="container" >
    <a class="links" id="paracadastro"></a>
    <a class="links" id="paralogin"></a>
     
    <div class="content">      
      <!--FORMULÁRIO DE LOGIN-->

      <div id="login">

            <img id="logo" src="assets/img/logo_64.png" alt="YouMents Logo"/>

          <h1>Login</h1> 

                 <p> 
            <label class="labelcss" for="tbEmail">Seu e-mail</label>            
              <asp:TextBox CssClass="txtcss" ID="tbEmail" runat="server" onfocus="this.value=''"></asp:TextBox>
                </p>
                <p> 
              <label class="labelcss" for="tbSenha">Sua Senha</label>
              <asp:TextBox CssClass="txtcss" ID="tbSenha" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="txtavs" runat="server"></asp:Label>
               </p>

          <p> 
          <asp:Button CssClass="btnLogar" runat="server" Text="Logar" OnClick="btnlogar_Click" /> 
          </p>
           
          <p class="link">
             Ainda não tem conta?
            <a href="cadastro.aspx">Cadastre-se</a>
          </p>

      </div>
        </div>
      </div>

        <div id="cconteiner" class="cookies-container" runat="server">
    <div class="cookies-content">
      <p>Permito o uso de cookies para:</p>
      <div class="cookies-pref">
        <label class="labelcss" ><input type="checkbox"  checked-data-function="analytics"/>Análise de Uso</label>
        <label class="labelcss"><input type="checkbox"  checked-data-function="marketing"/>Marketing</label>
      </div>
      <asp:button runat="server" Text="Aceitar"  class="cookies-save" OnClick="actCookie_Click" ></asp:button>
    </div>
  </div>
        </form>
  
</body>
</html>