<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addMatch.aspx.cs" Inherits="milestone3.addMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>&nbsp;<form id="addMatch runat="server">
        <div>
            Please Enter club details
            <br />
            <br />
           Host club name:</div>
        <asp:TextBox ID="hostname" runat="server"></asp:TextBox>
        <br />
        guest club name  :<br />
        <asp:TextBox ID="guestclubname" runat="server"></asp:TextBox>
        <p>
           match start time:<br />
        <asp:TextBox ID="starttime" runat="server"></asp:TextBox>
        <br />
       match end time  :<br />
        <asp:TextBox ID="endtime" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="addAnewMatch" runat="server" Text="ADD Match" OnClick="addc" Width="215px" />
        </p>
    </form>
</body>
</html>
