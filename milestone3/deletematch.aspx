<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletematch.aspx.cs" Inherits="milestone3.deletematch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="deletematch" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="please insert match details"></asp:Label>
        <p>
            <br />
            host club name  :<br />
            <asp:TextBox ID="hostname" runat="server"></asp:TextBox>
        </p>
         <p>
            <br />
            guest club name  :<br />
            <asp:TextBox ID="guestname" runat="server"></asp:TextBox>
        </p>

        <asp:Button ID="delete" runat="server" Text="DELETE" />

    </form>
</body>
</html>
