<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hidden.aspx.cs" Inherits="Coding_Community.Hidden" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HiddenField1" runat="server" Value="0"/>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
