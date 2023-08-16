<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteClub.aspx.cs" Inherits="milestone3.DeleteClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="deleteclubform" runat="server">
        <div>
            Please Enter club details
            <br />
            <br />
            clubname:</div>
        <asp:TextBox ID="clubname" runat="server"></asp:TextBox>
        <br />
       
        <p>
            <asp:Button ID="deleteclubb" runat="server" Text="Delete" OnClick="deletec" style="height: 29px" />
        </p>
    </form>
</body>
</html>
