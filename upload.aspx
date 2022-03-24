<%@ Page Title="" Language="C#" MasterPageFile="~/SitePage.Master" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="ProjetoFinal.upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/gerenciar.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        
        <br /> <asp:Label ID="lblmsg" runat="server"></asp:Label><br />
        <asp:GridView ID="gvArquivos" runat="server" AutoGenerateColumns="False" EmptyDataText = "Nenhum arquivo enviado" Width="321px">
            <Columns>
                <asp:BoundField DataField="Text" HeaderText="Nome do Arquivo" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Opção 1">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadArquivo"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Opção 2">
                    <ItemTemplate>
                        <asp:LinkButton ID = "lnkDeleta" Text = "Deletar" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeletarArquivo" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Label ID="ltrCookie" runat="server" Visible="false"></asp:Label>
    </form>
</asp:Content>
