<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blockfan.aspx.cs" Inherits="milestone3.Blockfan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="blockfanform" runat="server">
        <div>
            Please Enter fan details
            <br />
            <br />
            Fan national id:</div>
        <asp:TextBox ID="fannationalid" runat="server"></asp:TextBox>
        <br />
       
        <p>
            <asp:Button ID="blockk" runat="server" Text="BLOCK" OnClick="Blockf" style="height: 29px" />
        </p>
    </form>
</body>
</html>
