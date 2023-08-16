<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fanregister.aspx.cs" Inherits="milestone3.Fanregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label9" runat="server" Text="please enter your information"></asp:Label>
        <div>
        <asp:Label ID="Label1" runat="server" Text="username"></asp:Label>
        </div>
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
        <div>
        <asp:Label ID="Label2" runat="server" Text="password"></asp:Label>
        </div>
        <asp:TextBox ID="password" runat="server"></asp:TextBox>
        <div>
         <asp:Label ID="Label3" runat="server" Text="name"></asp:Label>
        </div>
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
        <div>
         <asp:Label ID="Label4" runat="server" Text="nationalid"></asp:Label>
        </div>
        <asp:TextBox ID="nationalid" runat="server"></asp:TextBox>
        <div>
         <asp:Label ID="Label5" runat="server" Text="phonenumber"></asp:Label>
        </div>
        <asp:TextBox ID="phonenumber" runat="server"></asp:TextBox>
        <br />
        <div>
         <asp:Label ID="Label7" runat="server" Text="address"></asp:Label>
        </div>
        <asp:TextBox ID="address" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="birthday"></asp:Label>
        <p>
            <asp:Calendar ID="Calendar1" runat="server" Height="173px" Width="203px"></asp:Calendar>
        </p>
        <asp:Button ID="register" runat="server" Text="register" OnClick="register_Click" />
    </form>
</body>
</html>
