<%@ Page Title="" Language="C#" MasterPageFile="~/SitePage.Master" AutoEventWireup="true" CodeBehind="log.aspx.cs" Inherits="ProjetoFinal.log" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/logs.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form CssClass="wrap" id="form1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_log" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style= " background:#272b33; color:white;"  >
                <td>
                    <asp:Label ID="tipo_logLabel" runat="server" Text='<%# Eval("tipo_log") %>' />
                </td>
                <td>
                    <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
                </td>
                <td>
                    <asp:Label ID="titulo_documentoLabel" runat="server" Text='<%# Eval("titulo_documento") %>' />
                </td>
                <td>
                    <asp:Label ID="id_usuarioLabel" runat="server" Text='<%# Eval("id_usuario") %>' />
                </td>
                <td>
                    <asp:Label ID="Id_logLabel" runat="server" Text='<%# Eval("Id_log") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="" >
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
                <td>
                    <asp:TextBox ID="tipo_logTextBox" runat="server" Text='<%# Bind("tipo_log") %>' />
                </td>
                <td>
                    <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
                </td>
                <td>
                    <asp:TextBox ID="titulo_documentoTextBox" runat="server" Text='<%# Bind("titulo_documento") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_usuarioTextBox" runat="server" Text='<%# Bind("id_usuario") %>' />
                </td>
                <td>
                    <asp:Label ID="Id_logLabel1" runat="server" Text='<%# Eval("Id_log") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="" >
                <tr>
                    <td>Nenhum dado foi retornado.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Inserir" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Limpar" />
                </td>
                <td>
                    <asp:TextBox ID="tipo_logTextBox" runat="server" Text='<%# Bind("tipo_log") %>' />
                </td>
                <td>
                    <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
                </td>
                <td>
                    <asp:TextBox ID="titulo_documentoTextBox" runat="server" Text='<%# Bind("titulo_documento") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_usuarioTextBox" runat="server" Text='<%# Bind("id_usuario") %>' />
                </td>
                <td>&nbsp;</td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="tipo_logLabel" runat="server" Text='<%# Eval("tipo_log") %>' />
                </td>
                <td>
                    <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
                </td>
                <td>
                    <asp:Label ID="titulo_documentoLabel" runat="server" Text='<%# Eval("titulo_documento") %>' />
                </td>
                <td>
                    <asp:Label ID="id_usuarioLabel" runat="server" Text='<%# Eval("id_usuario") %>' />
                </td>
                <td>
                    <asp:Label ID="Id_logLabel" runat="server" Text='<%# Eval("Id_log") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="background: #f4f4f4; padding-left: 2rem;">
                                <th runat="server">Tipo</th>
                                <th runat="server">Data</th>
                                <th runat="server">Título</th>
                                <th runat="server">Usuário</th>
                                <th runat="server">ID</th>
                            </tr >
                            <tr id="itemPlaceholder" runat="server" >
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="tipo_logLabel" runat="server" Text='<%# Eval("tipo_log") %>' />
                </td>
                <td>
                    <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
                </td>
                <td>
                    <asp:Label ID="titulo_documentoLabel" runat="server" Text='<%# Eval("titulo_documento") %>' />
                </td>
                <td>
                    <asp:Label ID="id_usuarioLabel" runat="server" Text='<%# Eval("id_usuario") %>' />
                </td>
                <td>
                    <asp:Label ID="Id_logLabel" runat="server" Text='<%# Eval("Id_log") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [tipo_log], [data], [titulo_documento], [id_usuario], [Id_log] FROM [log] WHERE ([id_usuario] = @id_usuario)" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:CookieParameter CookieName="login" Name="id_usuario" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
</form>
</asp:Content>
