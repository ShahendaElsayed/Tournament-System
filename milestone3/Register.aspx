<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="milestone3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="registerform" runat="server">
        <div>
            <asp:Label ID="choose" runat="server" Text="choose the role you are registering for "></asp:Label>
        </div>
        <p>
            <asp:Button ID="sportsmanager" runat="server" Height="49px" Text=" Sports Association Manager" Width="244px" OnClick="sportsmanager_Click" />
        </p>
        <asp:Button ID="Button2" runat="server" Height="52px" Text="Stadium Manager" Width="240px" OnClick="Button2_Click" />
        <p>
            <asp:Button ID="Button3" runat="server" Height="46px" Text="Club Representative" Width="243px" OnClick="Button3_Click" />
        </p>
        <asp:Button ID="Button4" runat="server" Height="51px" Text="Fan" Width="248px" OnClick="Button4_Click" />
    </form>
</body>
</html>
