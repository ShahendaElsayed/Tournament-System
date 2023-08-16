<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="milestone3.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="SystemAdmin" runat="server">
        
            <asp:Label ID="Label1" runat="server" Text="choose what do you want to do"></asp:Label>
     <hr />
               <asp:Button ID="Button1" runat="server" Text="ADD CLUB" OnClick="Button1_Click" Width="209px" />  <hr />
               <asp:Button ID="Button2" runat="server" Text="DELETE CLUB" Width="206px" OnClick="Button2_Click" />   <hr />
               <asp:Button ID="Button3" runat="server" Text="ADD STADIUM" Width="208px" OnClick="Button3_Click" />   <hr />
               <asp:Button ID="Button4" runat="server" Text="DELETE STADIUM" Width="206px" OnClick="Button4_Click" />  <hr />
               <asp:Button ID="Button5" runat="server" Text="BLOCK FAN" Width="209px" OnClick="Button5_Click" />   <hr />
               
               
        
         
        
  </form>
     <div id="enterdata" runat="server" ></div>
</body>
</html>
