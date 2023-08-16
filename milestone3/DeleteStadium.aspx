<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteStadium.aspx.cs" Inherits="milestone3.DeleteStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="deleteStadiumform" runat="server">
        <div>
            Please Enter Stadium details
            <br />
            <br />
            Stadiumname:</div>
        <asp:TextBox ID="Stadiumame" runat="server"></asp:TextBox>
        <br />
       
        <p>
            <asp:Button ID="deleteStadiumm" runat="server" Text="Delete" OnClick="deletes" style="height: 29px" />
        </p>
    </form>
</body>
</html>
