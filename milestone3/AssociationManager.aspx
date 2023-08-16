<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssociationManager.aspx.cs" Inherits="milestone3.AssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Addnewmatch" runat="server" Text="Add new match" Width="270px" />
        <p>
            <asp:Button ID="deletematch" runat="server" Text="delete a match" Width="266px" />
        </p>
        <asp:Button ID="Viewupcomingmatches" runat="server" Text="View All upcoming matches" Width="269px" />
        <p>
            <asp:Button ID="Viewplayedmatches" runat="server" Text="View played matches" Width="266px" />
        </p>
        <asp:Button ID="clubsNeverMatched" runat="server" Text="view clubs Never Matched" Width="266px" />
    </form>
</body>
</html>
