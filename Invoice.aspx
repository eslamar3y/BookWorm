<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="back_end_project.Invoice" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Invoice</title>
  <link rel="stylesheet" href="css/incss.css" media="all" />
</head>

<body>
  <header class="clearfix">
    <div id="logo">
      <img src="img/Tlogo.png" style="width: 350px;height: 150px;">
    </div>
    <h1>INVOICE <asp:Label ID="Invoice_Num" runat="server" Text=""></asp:Label></h1>
    <div id="company" class="clearfix">
      <div>Company BookWorm</div>
      <div>699 Wasted Plains,<br /> PC 69420, KSU</div>
      <div>(303) 069-4200</div>
      <div><a href="mailto:TerroristerYT@gmail.com">BookWorm@gmail.com</a></div>
    </div>
    <div id="project">
      <div><span>CLIENT</span><asp:Label ID="CLIENT" runat="server" style="color: #001028;font-size: 1em;" Text=""></asp:Label></div>
      <div><span>ADDRESS</span><asp:Label ID="ADDRESS" runat="server" style="color: #001028;font-size: 1em;" Text=""></asp:Label></div>
      <div><span>PHONE</span><asp:Label ID="PHONE" runat="server" style="color: #001028;font-size: 1em;" Text=""></asp:Label></div>
      <div><span>PAYMENT</span><asp:Label ID="PAYMENT" runat="server" style="color: #001028;font-size: 1em;" Text=""></asp:Label></div>
      <div><span>DATE</span><asp:Label ID="DATE" runat="server" style="color: #001028;font-size: 1em;" Text=""></asp:Label></div>
    </div>
  </header>
  <main>
    <table>
      <thead>
        <tr>
          <th class="service">PRODUCT</th>
          <th class="desc">DESCRIPTION</th>
          <th>PRICE</th>
          <th>QTY</th>
          <th>TOTAL</th>
        </tr>
      </thead>
      <tbody>
       <asp:Repeater ID="Repeater1" runat="server">
       <ItemTemplate>
        <tr>
          <td class="service">A Book</td>
          <td class="desc">The title of the book is (<%# Eval("title") %>) it is one of the best quality-topic books of all-time</td>
          <td class="unit">$<%# Eval("discount") %></td>
          <td class="qty"><%# Eval("quantity") %></td>
          <td class="total">$<%# Eval("totalprice") %></td>
        </tr>
       </ItemTemplate>
       </asp:Repeater>
        <tr>
          <td colspan="4">SUBTOTAL</td>
          <td class="total">$<asp:Label ID="thissubtotal" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
          <td colspan="4">Discount</td>
          <td class="total">-$<asp:Label ID="thisdiscount" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
          <td colspan="4" class="grand total">GRAND TOTAL</td>
          <td class="grand total">$<asp:Label ID="thisgrandtotal" runat="server" Text="0"></asp:Label></td>
        </tr>
      </tbody>
    </table>
    <div id="notices">
      <div>NOTICE:</div>
      <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
    </div>
  </main>
  <footer>
    Invoice was created on a computer and is valid without the signature and seal.
  </footer>
</body>

</html>
