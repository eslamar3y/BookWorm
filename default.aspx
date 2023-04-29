<%@ Page Title="" Language="C#" MasterPageFile="~/M.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="back_end_project._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="hero_normal" runat="server">
    <section class="hero hero-normal">
        <script type="text/javascript">
            function loadpls() {
                //activates();
                document.getElementById("THISBODY").classList.add("bannerpls");
            }
            window.onload = loadpls;
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hero_bg" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<!-- Categories Section Begin -->
    <section class="categories">
      <div class="container">
        <div class="row">
          <div class="categories__slider owl-carousel">
              <asp:ListView ID="ListView2" runat="server" GroupPlaceHolderId="groupplaceholder" ItemPlaceholderID="itemplaceholder">
                  <GroupTemplate>
                    <tr>
                        <tr id="itemplaceholder" runat="server"></tr>
                    </tr>
                </GroupTemplate>
                  <ItemTemplate>
              <!-- start product -->
                    <div class="col-lg-3">
                        <div
                            class="categories__item set-bg"
                            data-setbg="img/categories/<%# Eval("CatImg") %>"
                        >
                        <h5><a href="shop-grid.aspx?cat=<%# Eval("CatName")%>"><%# Eval("CatName") %></a></h5>
                        </div>
                    </div>

              <!-- end product -->
                </ItemTemplate>
              </asp:ListView>
          </div>
        </div>
      </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title">
              <h2>Featured Product</h2>
            </div>
            <div class="featured__controls">
              <ul>
                <li class="active" data-filter="*">All</li>
                <li data-filter=".Fantasy">Fantasy</li>
                <li data-filter=".History">History</li>
                <li data-filter=".Language">Language</li>
                <li data-filter=".Literature">Literature</li>
                <li data-filter=".Science">Science</li>
                <li data-filter=".Self-Help">Self-Help</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row featured__filter">
                <asp:ListView ID="ListView1" runat="server" GroupPlaceHolderId="groupplaceholder" ItemPlaceholderID="itemplaceholder">
                
                <GroupTemplate>
                    <tr>
                        <tr id="itemplaceholder" runat="server"></tr>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
              <!-- start product -->
                    <div class="col-lg-3 col-md-4 col-sm-6 mix <%# Eval("CatName") %>">
                        <div class="featured__item">
                            <div
                                class="featured__item__pic set-bg"
                                data-setbg="img/product/<%# Eval("img") %>">
                            <ul class="featured__item__pic__hover">
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
                        <div class="featured__item__text">
                            <h6><a href="#"><%# Eval("title") %></a></h6>
                            <h5>$<%# Eval("price") %></h5>
                        </div>
                    </div>
                </div>

              <!-- end product -->
                </ItemTemplate>
            </asp:ListView>
        </div>
      </div>
    </section>
    <!-- Featured Section End -->  

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title from-blog__title">
              <h2>From The Blog</h2>
            </div>
          </div>
        </div>
        <div class="row">
          
            <asp:ListView ID="ListView3" runat="server" GroupPlaceHolderId="groupplaceholder" ItemPlaceholderID="itemplaceholder">
                     <GroupTemplate>
                    <tr>
                        <tr id="itemplaceholder" runat="server"></tr>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
              <!-- start product -->
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                            <%--<img src="img/blog/blog-1.jpg" alt="" />--%>
                                <img src="img/blog/<%# Eval("postimg") %>" alt="" />
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> <%# Eval("date") %></li>
                                <li><i class="fa fa-comment-o"></i> <%# Eval("postmessages") %></li>
                            </ul>
                        <h5><a href="#"><%# Eval("posttitle") %></a></h5>
                        <p>
                            <%# Eval("postcontent") %>
                        </p>
                        </div>
                        </div>
                    </div>

              <!-- end product -->
                </ItemTemplate>
            </asp:ListView>
        </div>
      </div>
    </section>
    <!-- Blog Section End -->
</asp:Content>
