<%@ Page Title="" Language="C#" MasterPageFile="~/M.Master" AutoEventWireup="true" CodeBehind="shoping-cart.aspx.cs" Inherits="back_end_project.shoping_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="hero_normal" runat="server">
    <section class="hero hero-normal">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hero_bg" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>Shopping Cart</h2>
              <div class="breadcrumb__option">
                <a href="./index.html">Home</a>
                <span>Shopping Cart</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="shoping__cart__table">
              <table>
                <thead>
                  <tr>
                    <th class="shoping__product">Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                  <tr>
                    <td class="shoping__cart__item">
                      <a href="shop-details.aspx?id=<%# Eval("id") %>"><img src="img/product/<%# Eval("img") %>" alt="" /></a>
                      <a href="shop-details.aspx?id=<%# Eval("id") %>"><h5><%--<%# Eval("sid") %>--%><%# Eval("title") %> . . .</h5></a>
                    </td>
                    <td class="shoping__cart__price">$<%# Eval("discount") %></td>
                    <%--<td class="shoping__cart__quantity">
                      <div class="quantity">
                        <div class="pro-qty">
                          <input type="text" value="<%# Eval("quantity") %>" />
                        </div>
                      </div>
                    </td>--%>
                    <td class="shoping__cart__total"><%# Eval("quantity") %></td>
                    <td class="shoping__cart__total">$<%# Eval("totalprice") %></td>
                    <td class="shoping__cart__item__close">
                      <a href="shoping-cart.aspx?remove=<%# Eval("sid") %>"><span class="icon_close"></span></a>
                    </td>
                  </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                  

                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="shoping__cart__btns">
              <a href="shop-grid.aspx" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
              <a href="shoping-cart.aspx" class="primary-btn cart-btn cart-btn-right"
                ><span class="icon_loading"></span> Upadate Cart</a
              >
            </div>
          </div>
          <div class="col-lg-6">
            <div class="shoping__continue">
              <div class="shoping__discount">
                <h5>Discount Codes</h5>
                <form action="shoping-cart.aspx#promocode" method="post">
                    <input ID="promocode" name="promocode" placeholder="Enter your coupon code" class="txt_SDF" required/>
                    <button ID="promobtn" name="promothis" class="site-btn btn_SDF">APPLY COUPON</button>
                    <br />
                    <asp:Label ID="promoed" runat="server" Text=""></asp:Label>
                </form>
        <%--<form action="#" method="post">
          <h1>Sign in</h1>
          <input type="email" name="email" placeholder="Email" class="txt" required/>
            
          <input type="password" name="pass" placeholder="Password" class="txt" required id="pass"/>
            <div style="margin-left: 147px;margin-bottom: 20px;margin-top: -5px;">
          <input type="checkbox" onclick="showps()" /><small> Show Password</small>  </div>
          <asp:Label ID="AExists2" runat="server" Text=""></asp:Label>
          <button name="login" class="btn">Sign In</button>
        </form>--%>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="shoping__checkout">
              <h5>Cart Total</h5>
              <ul>
                <li>Total <asp:Label ID="thistotal" runat="server" Text="0"></asp:Label></li>
                <li>Discount <asp:Label ID="thisdiscount" runat="server" Text="0"></asp:Label></li>
                <li>GrandTotal <asp:Label ID="thisgrandtotal" runat="server" Text="0"></asp:Label></li>
              </ul>
              <a href="checkout.aspx" class="primary-btn">PROCEED TO CHECKOUT</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Shoping Cart Section End -->
</asp:Content>
