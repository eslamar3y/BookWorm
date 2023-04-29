<%@ Page Title="" Language="C#" MasterPageFile="~/M.Master" AutoEventWireup="true" CodeBehind="shop-details.aspx.cs" Inherits="back_end_project.shop_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="hero_normal" runat="server">
    <section class="hero hero-normal">
        <script type="text/javascript">
            function loadpls() {
                //let string = window.location.href;
                //let link = string += "&add=0";
                //document.getElementById("addpls").href= link;
                const span = document.getElementById('body_img');
                const src = span.innerText;
                document.getElementById("pimg").src = src;
                let txts = document.getElementsByName('salehere');
                txts.forEach((txt) => {
                    if (txt.innerText == "-0%") {
                        txt.classList.add("hidethis");
                    }
                });
                let status = document.getElementById('body_status');
                let tstatus = status.innerText;
                if (tstatus == "Out of Stock") {
                    status.style.color = "#dd2222";
                    document.getElementById("addpls").removeAttribute("href");
                    document.getElementById("addpls").classList.add("primary-btn-disabled");
                    document.getElementById("addpls").style.color = "#ffffff";
                }
            }
            window.onload = loadpls;
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hero_bg" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="img" runat="server" Text="Label"></asp:Label>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>Vegetable’s Package</h2>
              <div class="breadcrumb__option">
                <a href="./index.html">Home</a>
                <a href="./index.html">Vegetables</a>
                <span>Vegetable’s Package</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
              <div class="product__details__pic__item">
                <img id="pimg"
                  class="product__details__pic__item--large"
                  src="img/product/" <%--product-img--%>
                  alt=""
                />
              </div>
              
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="product__details__text">
              <h3><asp:Label ID="title" runat="server" Text="Label"></asp:Label></h3> <%--product-title--%>
              <div class="product__details__rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half-o"></i>
                <span>(18 reviews)</span>
              </div>
              <div class="product__details__price">
                  <asp:Label ID="container" CssClass="spanthis" runat="server" Text="">
                        <asp:Label ID="price" runat="server" Text=""></asp:Label><%--product-price--%>
                  </asp:Label>
                  <asp:Label ID="discount" runat="server" Text="Label"></asp:Label><%--product-discount--%>
              </div>
              <p>
                <%--Fantasy is distinguished from the genres of science fiction and 
                horror by the respective absence of scientific or macabre themes,
                although these genres overlap. In popular culture, the fantasy genre
                predominantly features settings that emulate Earth, but with a sense 
                of otherness. In its broadest sense,however, fantasy consists of works
                by many writers, artists, filmmakers, and musicians from ancient myths 
                and legends to many recent and popular works.--%>
                Fantasy is a genre of speculative fiction involving magical elements,
                typically set in a fictional universe and sometimes inspired by mythology
                and folklore. Its roots are in oral traditions, which then became fantasy
                literature and drama. From the twentieth century, it has expanded further
                into various media, including film, television, graphic novels, manga,
                animations and video games.
                
              </p>
                <div class="product__details__quantity">
                <div class="quantity">
                  <div class="pro-qty">
                    <input type="text" id="qty" value="1"/>
                  </div>
                </div>
              </div>
              <a href="#" id="addpls" class="primary-btn" onclick="getqty()">ADD TO CARD</a>
              <a href="#" class="heart-icon"
                ><span class="icon_heart_alt"></span
              ></a>
              <ul>
                <li><b>Availability</b> <span><asp:Label ID="status" runat="server" Text="Label"></asp:Label></span></li><%--product-Case Status--%>
                <li>
                  <b>Shipping</b>
                  <span>01 day shipping. <samp>Free pickup today</samp></span>
                </li>
                <li><b>Weight</b> <span>0.5 kg</span></li>
                <li>
                  <b>Share on</b>
                  <div class="share">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-pinterest"></i></a>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-12">
            <div class="product__details__tab">
              <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                  <a
                    class="nav-link active"
                    data-toggle="tab"
                    href="#tabs-2"
                    role="tab"
                    aria-selected="false"
                    >Information</a
                  >
                </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active" id="tabs-2" role="tabpanel">
                  <div class="product__details__tab__desc">
                    <h6>Products Infomation</h6>
                    <p><%--product-description--%>
                      <%--Vestibulum ac diam sit amet quam vehicula elementum sed
                      sit amet dui. Pellentesque in ipsum id orci porta dapibus.
                      Proin eget tortor risus. Vivamus suscipit tortor eget
                      felis porttitor volutpat. Vestibulum ac diam sit amet quam
                      vehicula elementum sed sit amet dui. Donec rutrum congue
                      leo eget malesuada. Vivamus suscipit tortor eget felis
                      porttitor volutpat. Curabitur arcu erat, accumsan id
                      imperdiet et, porttitor at sem. Praesent sapien massa,
                      convallis a pellentesque nec, egestas non nisi. Vestibulum
                      ac diam sit amet quam vehicula elementum sed sit amet dui.
                      Vestibulum ante ipsum primis in faucibus orci luctus et
                      ultrices posuere cubilia Curae; Donec velit neque, auctor
                      sit amet aliquam vel, ullamcorper sit amet ligula. Proin
                      eget tortor risus.--%>
                      <asp:Label ID="description" runat="server" Text="Label"></asp:Label>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title related__product__title">
              <h2>Related Product</h2>
            </div>
          </div>
        </div>
        <div class="row">
              <asp:Repeater ID="Repeater1" runat="server">
                  <ItemTemplate>
                      <div class="col-lg-3 col-md-4 col-sm-6">
                      <div class="product__item">
              <div
                class="product__item__pic set-bg"
                data-setbg="img/product/<%# Eval("img") %>"<%--img--%>
              >
                  <div id="salehere" name="salehere" class="product__discount__percent lettherebesale">-<%# Eval("sale") %>%</div>
                <ul class="product__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fa fa-retweet"></i></a>
                  </li>
                  <li>
                    <a href="shop-details.aspx?id=<%# Eval("id") %>&add=1&out=1"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="shop-details.aspx?id=<%# Eval("id") %>"><%# Eval("ntitle") %> . . .</a></h6> <%--title--%>
                <h5>$<%# Eval("price") %></h5> <%--price--%>
              </div>
            </div>
          </div>
                  </ItemTemplate>
              </asp:Repeater>

        </div>
      </div>
    </section>
    <script>
        function getqty() {
            let thisclass = "primary-btn-disabled"
            let btn = document.getElementById("addpls");
            if (btn.classList.contains(thisclass)){
                btn.removeAttribute("href");
            } else {
                let qty = document.getElementById('qty').value;
                let string = window.location.href;
                if (isNaN(qty)) {
                    alert('Please Enter a Corret Quantity');
                    document.getElementById("addpls").href = string;
                } else {
                    let link = string += "&add=";
                    link += qty;
                    document.getElementById("addpls").href = link;
                }
            }
        }
    </script>
    <!-- Related Product Section End -->
</asp:Content>
