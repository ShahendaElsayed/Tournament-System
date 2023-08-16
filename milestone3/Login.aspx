<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="milestone3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>loginpage</title>
</head>
<body>
    <form id="loginnn" runat="server">
        <div>
            Please Log In
            <br />
            <br />
            UserName :</div>
        <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <br />
        Password :<br />
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButtons" />
        </p>
    </form>
</body>
</html>
