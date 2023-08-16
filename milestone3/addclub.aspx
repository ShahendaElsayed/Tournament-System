<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addclub.aspx.cs" Inherits="milestone3.addclub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="addclubform" runat="server">
        <div>
            Please Enter club details
            <br />
            <br />
            clubname:</div>
        <asp:TextBox ID="clubname" runat="server" OnTextChanged="clubname_TextChanged"></asp:TextBox>
        <br />
        clublocation :<br />
        <asp:TextBox ID="clublocation" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="addclubb" runat="server" Text="ADD" OnClick="addc" />
        </p>
    </form>
</body>
</html>

