<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clubrepresentativerregister.aspx.cs" Inherits="milestone3.clubrepresentativerregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <asp:Label ID="Label5" runat="server" Text="enter your information"></asp:Label>
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
         <asp:Label ID="Label4" runat="server" Text="clubname"></asp:Label>
        </div>
        <asp:TextBox ID="clubname" runat="server"></asp:TextBox>
        <div>
          </div>
          <asp:Button ID="Button1" runat="server" Text="register" OnClick="Button1_Click" />
    </form>
</body>
</html>
