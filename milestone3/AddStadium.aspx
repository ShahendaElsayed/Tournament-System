<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStadium.aspx.cs" Inherits="milestone3.AddStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="addStadiumform" runat="server">
        <div>
            Please Enter Stadium details
            <br />
            <br />
            Stadiumname:</div>
        <asp:TextBox ID="Stadiumname" runat="server"></asp:TextBox>
        <br />
        Stadiumlocation :<br />
        <asp:TextBox ID="stadiumlocation" runat="server"></asp:TextBox>
        <br />
          Capacity :<br />
        <asp:TextBox ID="stadiumcapacity" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="addstadiumm" runat="server" Text="ADD" OnClick="adds" />
        </p>
    </form>
</body>
</html>
