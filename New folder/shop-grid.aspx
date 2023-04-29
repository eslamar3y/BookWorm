<%@ Page Title="" Language="C#" MasterPageFile="~/M.Master" AutoEventWireup="true" CodeBehind="shop-grid.aspx.cs" Inherits="back_end_project.shop_grid" %>
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
              <h2>Organi Shop</h2>
              <div class="breadcrumb__option">
                <a href="./index.html">Home</a>
                <span>Shop</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-5">
            <div class="sidebar">
              <div class="sidebar__item">
                <h4>Categories</h4>
                  <!-- Categories -->
                <ul>
            <asp:Repeater ID="Repeater3" runat="server">
                <ItemTemplate>
                    <li><a href="#"><%# Eval("CatName")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
                </ul>
              </div>
              <div class="sidebar__item">
                <h4>Price</h4>
                <div class="price-range-wrap">
                  <div
                    class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                    data-min="10"
                    data-max="540"
                  >
                    <div
                      class="ui-slider-range ui-corner-all ui-widget-header"
                    ></div>
                    <span
                      tabindex="0"
                      class="ui-slider-handle ui-corner-all ui-state-default"
                    ></span>
                    <span
                      tabindex="0"
                      class="ui-slider-handle ui-corner-all ui-state-default"
                    ></span>
                  </div>
                  <div class="range-slider">
                    <div class="price-input">
                      <input type="text" id="minamount" />
                      <input type="text" id="maxamount" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="sidebar__item sidebar__item__color--option">
                <h4>Colors</h4>
                <div class="sidebar__item__color sidebar__item__color--white">
                  <label for="white">
                    White
                    <input type="radio" id="white" />
                  </label>
                </div>
                <div class="sidebar__item__color sidebar__item__color--gray">
                  <label for="gray">
                    Gray
                    <input type="radio" id="gray" />
                  </label>
                </div>
                <div class="sidebar__item__color sidebar__item__color--red">
                  <label for="red">
                    Red
                    <input type="radio" id="red" />
                  </label>
                </div>
                <div class="sidebar__item__color sidebar__item__color--black">
                  <label for="black">
                    Black
                    <input type="radio" id="black" />
                  </label>
                </div>
                <div class="sidebar__item__color sidebar__item__color--blue">
                  <label for="blue">
                    Blue
                    <input type="radio" id="blue" />
                  </label>
                </div>
                <div class="sidebar__item__color sidebar__item__color--green">
                  <label for="green">
                    Green
                    <input type="radio" id="green" />
                  </label>
                </div>
              </div>
              <div class="sidebar__item">
                <h4>Popular Size</h4>
                <div class="sidebar__item__size">
                  <label for="large">
                    Large
                    <input type="radio" id="large" />
                  </label>
                </div>
                <div class="sidebar__item__size">
                  <label for="medium">
                    Medium
                    <input type="radio" id="medium" />
                  </label>
                </div>
                <div class="sidebar__item__size">
                  <label for="small">
                    Small
                    <input type="radio" id="small" />
                  </label>
                </div>
                <div class="sidebar__item__size">
                  <label for="tiny">
                    Tiny
                    <input type="radio" id="tiny" />
                  </label>
                </div>
              </div>
              <div class="sidebar__item">
                <div class="latest-product__text">
                  <h4>Latest Products</h4>
                  <div class="latest-product__slider owl-carousel">
                    <div class="latest-prdouct__slider__item">
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img src="img/latest-product/lp-1.jpg" alt="" />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img src="img/latest-product/lp-2.jpg" alt="" />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img src="img/latest-product/lp-3.jpg" alt="" />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                    </div>
                    <div class="latest-prdouct__slider__item">
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img src="img/latest-product/lp-1.jpg" alt="" />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img src="img/latest-product/lp-2.jpg" alt="" />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img src="img/latest-product/lp-3.jpg" alt="" />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-9 col-md-7">
            <div class="product__discount">
              <div class="section-title product__discount__title">
                <h2>Sale Off</h2>
              </div>
              <div class="row">
                <div class="product__discount__slider owl-carousel">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <!-- start product -->
                <div class="col-lg-4">
                    <div class="product__discount__item">
                    <div
                        class="product__discount__item__pic set-bg"
                        data-setbg="img/product/<%# Eval("img") %>"
                    >
                    <!-- img up -->
                    <div class="product__discount__percent">-<%# Eval("sale") %>%</div>
                        <ul class="product__item__pic__hover">
                        <li>
                            <a href="#"><i class="fa fa-heart"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-retweet"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                        </li>
                        </ul>
                    </div>
                    <div class="product__discount__item__text">
                        <span><%# Eval("CatName") %></span> <!-- category -->
                        <h5><a href="#"><%# Eval("title") %></a></h5> <!-- name -->
                        <div class="product__item__price">

                        $<%# Eval("discount") %> <span>$<%# Eval("price") %></span> <!-- prices -->
                        </div>
                    </div>
                    </div>
                </div>
                <!-- end product -->
                </ItemTemplate>
            </asp:Repeater>
                </div>
              </div>
            </div>
            <div class="filter__item">
              <div class="row">
                <div class="col-lg-4 col-md-5">
                  <div class="filter__sort">
                    <span>Sort By</span>
                      <!-- Categories -->
                    <select>
                      <option value="ALL">Default</option>
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <option value="<%# Eval("CatName") %>"><%# Eval("CatName") %></option>
                </ItemTemplate>
            </asp:Repeater>
                    </select>
                  </div>
                </div>
                <div class="col-lg-4 col-md-4">
                  <div class="filter__found">
                      <!-- Product Count -->
                      <%--<form runat="server">--%>
                    <h6><span><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span> Products found</h6>
                         <%-- </form>--%>
                  </div>
                </div>
                <div class="col-lg-4 col-md-3">
                  <div class="filter__option">
                    <span class="icon_grid-2x2"></span>
                    <span class="icon_ul"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
                <asp:ListView ID="ListView1" runat="server" GroupPlaceHolderId="groupplaceholder" ItemPlaceholderID="itemplaceholder" OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
                <LayoutTemplate>
                    <form id="form1" runat="server">
                    <div id="groupplaceholder" runat="server"></div>
                    <div class="product__pagination">
                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="true" ShowNextPageButton="true" ShowFirstPageButton="false" ShowPreviousPageButton="false"/>
                                <asp:NumericPagerField ButtonType="Link"/>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ShowNextPageButton="false" ShowFirstPageButton="true" ShowPreviousPageButton="true"/>
                            </Fields>
                        </asp:DataPager>
                    </div>
                    </form>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr>
                        <tr id="itemplaceholder" runat="server"></tr>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
              <!-- start product -->
              <div class="col-lg-4 col-md-6 col-sm-6 prod">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="img/product/<%# Eval("img") %>"
                  >
                      <!-- img up -->
                    <ul class="product__item__pic__hover">
                      <li>
                        <a href="#"><i class="fa fa-heart"></i></a>
                      </li>
                      <li>
                        <a href="#"><i class="fa fa-retweet"></i></a>
                      </li>
                      <li>
                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                      </li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6><a href="#"><%# Eval("title") %></a></h6><!-- Name -->
                    <h5>$<%# Eval("price") %></h5><!-- Price -->
                  </div>
                </div>
              </div>
              <!-- end product -->
                </ItemTemplate>
            </asp:ListView>
            </div>
<%--            <div class="product__pagination">
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>--%>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Section End -->
</asp:Content>
