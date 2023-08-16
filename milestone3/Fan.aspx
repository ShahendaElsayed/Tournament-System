<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="milestone3.Fan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="options" runat="server" Text="what can you do"></asp:Label>
        &nbsp;
        </div>
        <br />
        <br />
        <p>
            <asp:Button ID="viewmatches" runat="server" Height="50px" OnClick="viewmatchess" Text="view matches to attend !" Width="210px" />
        </p>
          <br />
        <br />
        <p>
            <asp:Button ID="purchaset" runat="server" Height="50px" Text="Purchase ticket now!" Width="210px" OnClick="purchaset_Click" />
        </p>
    </form>
</body>
</html>
