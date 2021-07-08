<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showimage.aspx.cs" Inherits="Coding_Community.showimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
        <asp:Image ID="Image1" height="500px" Width="500px" runat="server" />
    </form>
</body>
</html>
