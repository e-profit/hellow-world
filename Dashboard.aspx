<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!---Starting Counting Number--->
    <!-- JS Files -->
    <script src="scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            branches();
        });
        function branches() {
            $({ countNum: '#lbl' }).animate({ countNum: 0 }, {
                duration: 5000,
                easing: 'linear',
                step: function () {
                    $('#lbl').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#lbl').html(this.countNum + "");
                }
            });

        }
    </script>
    <style type="text/css">
table {
border-spacing: 0;
border-collapse: collapse;
border: azure;
}
</style>
    <script type="text/javascript">
        $(document).ready(function () {
            start1(); start2(); start3(); start4(); start5(); start6(); start7(); start8(); start9(); start10(); start11(); start12();
        });
        function start1() {
            $({ countNum: '#a1' }).animate({ countNum:  }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#a1').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#a1').html(this.countNum + "");
                }
            });
        }
        function start2() {
            $({ countNum: '#a2' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#a2').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#a2').html(this.countNum + "");
                }
            });
        }
        function start3() {
            $({ countNum: '#a3' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#a3').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#a3').html(this.countNum + "");
                }
            });
        }
        function start4() {
            $({ countNum: '#b1' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#b1').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#b1').html(this.countNum + "");
                }
            });
        }
        function start5() {
            $({ countNum: '#b2' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#b2').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#b2').html(this.countNum + "");
                }
            });
        }
        function start6() {
            $({ countNum: '#b3' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#b3').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#b3').html(this.countNum + "");
                }
            });
        }
        function start7() {
            $({ countNum: '#c1' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#c1').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#c1').html(this.countNum + "");
                }
            });
        }
        function start8() {
            $({ countNum: '#c2' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#c2').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#c2').html(this.countNum + "");
                }
            });
        }
        function start9() {
            $({ countNum: '#c3' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#c3').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#c3').html(this.countNum + "");
                }
            });
        }
        function start10() {
            $({ countNum: '#d1' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#d1').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#d1').html(this.countNum + "");
                }
            });
        }
        function start11() {
            $({ countNum: '#d2' }).animate({ countNum: 0 }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#d2').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#d2').html(this.countNum + "");
                }
            });
        }
        function start12() {
            $({ countNum: '#copyprofit' }).animate({ countNum: '.profit' }, {
                duration: 1500,
                easing: 'linear',
                step: function () {
                    $('#copyprofit').html(Math.floor(this.countNum) + "");
                },
                complete: function () {
                    $('#copyprofit').html(this.countNum + "");
                }
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div class="content">
        <div class="row">
            <div class="col-lg-12 text-center welcome-message">
                <h1 class="font-bold">Welcome to E-Profit
                </h1>
            </div>
        </div>
        <br />
        <br />
        <br />


        <div class="row">
            <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-body text-center h-200">
                        <%--<i class="pe-7s-graph1 fa-4x"></i>--%>

                        <%-- <h1 class="m-xs">$1 206,90</h1>--%>

                        <div class="panel-body list">
                            <h3 class="font-extra-bold no-margins text-success">Orders
                            </h3>
                            <small class="fo"></small>
                            <div class="list-item-container text-left">
                                <div class="list-item">
                                    <h3 class="no-margins font-extra-bold text-Center">0</h3>
                                    <span>AMAZON</span>
                                    <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 class="no-margins font-extra-bold text-color3">0</h3>
                                    <small>FLIPKART</small>
                                    <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 class="no-margins font-extra-bold text-color3">
                                        <asp:Label ID="lbltotalproduct" runat="server" Text="Label"></asp:Label></h3>
                                    <small>CLUBFACTORY</small>
                                    <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%--<div class="panel-footer">
                        This is standard panel footer
                    </div>--%>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-body text-center h-200">
                        <%--<i class="pe-7s-graph1 fa-4x"></i>--%>

                        <%-- <h1 class="m-xs">$1 206,90</h1>--%>

                        <div class="panel-body list">
                            <h3 class="font-extra-bold no-margins text-success">Sales
                            </h3>
                            <small class="fo"></small>
                            <div class="list-item-container text-left">
                                <div class="list-item">
                                    <h3 id="a1" class="no-margins font-extra-bold text-Center">0</h3>
                                    <span>AMAZON</span>
                                    <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 id="a2" class="no-margins font-extra-bold text-color3">0</h3>
                                    <small>FLIPKART</small>
                                    <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 class="no-margins font-extra-bold text-color3">
                                        <asp:Label ID="lblsales" runat="server" Text=""></asp:Label></h3>
                                    <small>CLUBFACTORY</small>
                                    <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%--<div class="panel-footer">
                        This is standard panel footer
                    </div>--%>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-body text-center h-200">
                        <%--<i class="pe-7s-graph1 fa-4x"></i>--%>

                        <%-- <h1 class="m-xs">$1 206,90</h1>--%>

                        <div class="panel-body list">
                            <h3 class="font-extra-bold no-margins text-success">Payments
                            </h3>
                            <small class="fo"></small>
                            <div class="list-item-container text-left">
                                <div class="list-item">
                                    <h3 id="b1" class="no-margins font-extra-bold text-Center">0</h3>
                                    <span>AMAZON</span>
                                    <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 id="b2" class="no-margins font-extra-bold text-color3">0</h3>
                                    <small>FLIPKART</small>
                                    <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 class="no-margins font-extra-bold text-color3">
                                        <asp:Label ID="lbltotalpayments" runat="server" Text=""></asp:Label></h3>
                                    <small>CLUBFACTORY</small>
                                    <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%--<div class="panel-footer">
                        This is standard panel footer
                    </div>--%>
                </div>
            </div>
            <%--  <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-body text-center h-200">
                        <%--<i class="pe-7s-graph1 fa-4x"></i>-

                       

                        <div class="panel-body list">                       
                         <h3 class="font-extra-bold no-margins text-success">
                            Returns
                        </h3>
                        <small class="fo"></small>
                        <div class="list-item-container text-left">
                            <div class="list-item">                                
                                <h3 id="c1" class="no-margins font-extra-bold text-Center">2,77</h3>                                  
                                <span>AMAZON</span>
                                <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                            </div>
                            <div class="list-item">
                                <h3 id="c2" class="no-margins font-extra-bold text-color3">4,422</h3>
                                <small>FLIPKART</small>
                                <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                            </div>
                            <div class="list-item">
                                <h3 id="c3" class="no-margins font-extra-bold text-color3">9,180</h3>
                                <small>CLUBFACTORY</small>
                                <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                            </div>                            
                        </div>

                    </div>                     
                  </div>
                   
                </div>
            </div>--%>
            <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-body text-center h-200">
                        <%--<i class="pe-7s-graph1 fa-4x"></i>--%>

                        <%-- <h1 class="m-xs">$1 206,90</h1>--%>

                        <div class="panel-body list">
                            <h3 class="font-extra-bold no-margins text-success">Income
                            </h3>
                            <small class="fo"></small>
                            <div class="list-item-container text-left">
                                <div class="list-item">
                                    <h3 id="d1" class="no-margins font-extra-bold text-Center">0</h3>
                                    <span>AMAZON</span>
                                    <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 id="d2" class="no-margins font-extra-bold text-color3">0</h3>
                                    <small>FLIPKART</small>
                                    <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                                </div>
                                <div class="list-item">
                                    <h3 id="d3" class="no-margins font-extra-bold text-color3">
                                        <asp:Label ID="Label1" runat="server" CssClass="profit" Text=""></asp:Label></h3>
                                    <small>CLUBFACTORY</small>
                                    <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%--<div class="panel-footer">
                        This is standard panel footer
                    </div>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                            <a class="closebox"><i class="fa fa-times"></i></a>
                        </div>
                        Activity
                    </div>
                    <div class="panel-body list">
                        <div class="panel-title">
                            <h1>Product</h1>

                        </div>
                        <small class="fo"></small>
                        <div class="list-item-container">
                            <div class="list-item">
                                <h3 class="no-margins font-extra-bold text-success">
                                    <asp:Label ID="totalproduct" runat="server" Text="Label"></asp:Label></h3>
                                <small>Total Products</small>
                                <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                            </div>
                            <div class="list-item">
                                <h3 class="no-margins font-extra-bold text-color3">
                                    <asp:Label ID="activeproduct" runat="server" Text="Label"></asp:Label></h3>
                                <small>Active Products</small>
                                <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                            </div>
                            <div class="list-item">
                                <h3 class="no-margins font-extra-bold text-color3">
                                    <asp:Label ID="inactiveproduct" runat="server" Text="Label"></asp:Label></h3>
                                <small>Inactive Products</small>
                                <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hpanel">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        </div>
                        Top 10 Products

                    </div>
                    <div class="panel-body list">
                        <div class="row form-group">
                            <div class="col-md-4">
                                <h3 class="font-extra-bold no-margins text-success text-center" style="width: 200px;">Top 10 Products</h3>
                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Style="margin-left: 0px;" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                                    
                                    <asp:ListItem Text="Profit" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Loss" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <br />

                        <div class="table-responsive project-list">

                            <asp:GridView ID="GridViewtop10" runat="server" class="table table-striped" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Product Name">
                                        <ItemTemplate>
                                            <div class="w3-center">
                                                <asp:Label ID="pname" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <div class="w3-center">
                                                <asp:Label ID="Quantity" runat="server" Text='<%# Eval("Units") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Profit">
                                        <ItemTemplate>
                                            <div class="w3-center">
                                                <asp:Label ID="Profit" runat="server" Text='<%# Eval("Profit") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <%--  <asp:TemplateField HeaderText="Percentage">
                                        <ItemTemplate>
                                            <div class="w3-center">
                                                <asp:Label ID="Percentage" runat="server" Text='<%# Eval("Profit_Percentage") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="hpanel">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                            <a class="closebox"><i class="fa fa-times"></i></a>
                        </div>
                        Activity
                    </div>
                    <div class="panel-body list">
                        <div class="panel-title">
                            <h1>SKU'<small>s</small></h1>

                        </div>
                        <small class="fo"></small>
                        <div class="list-item-container">
                            <div class="list-item">
                                <h3 class="no-margins font-extra-bold text-success">
                                    <asp:Label ID="totalsku" runat="server" Text="Label"></asp:Label></h3>
                                <small>Total SKU</small>
                                <div class="pull-right font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                            </div>
                            <div class="list-item">
                                <h3 class="no-margins font-extra-bold text-color3">
                                    <asp:Label ID="mapedsku" runat="server" Text="Label"></asp:Label></h3>
                                <small>Mapped Sku</small>
                                <div class="pull-right font-bold">13% <i class="fa fa-level-down text-color3"></i></div>
                            </div>
                            <div class="list-item">
                                <h3 class="no-margins font-extra-bold text-color3">
                                    <asp:Label ID="unmapedsku" runat="server" Text=""></asp:Label></h3>
                                <small>Unmapped Sku</small>
                                <div class="pull-right font-bold">22% <i class="fa fa-bolt text-color3"></i></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    

    <!-- Right sidebar -->
    <div id="right-sidebar" class="animated fadeInRight">

        <div class="p-m">
            <button id="sidebar-close" class="right-sidebar-toggle sidebar-button btn btn-default m-b-md">
                <i class="pe pe-7s-close"></i>
            </button>
            <div>
                <span class="font-bold no-margins">Analytics </span>
                <br>
                <small>Lorem Ipsum is simply dummy text of the printing simply all dummy text.</small>
            </div>
            <div class="row m-t-sm m-b-sm">
                <div class="col-lg-6">
                    <h3 class="no-margins font-extra-bold text-success">300,102</h3>

                    <div class="font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                </div>
                <div class="col-lg-6">
                    <h3 class="no-margins font-extra-bold text-success">280,200</h3>

                    <div class="font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                </div>
            </div>
            <div class="progress m-t-xs full progress-small">
                <div style="width: 25%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="25" role="progressbar"
                    class=" progress-bar progress-bar-success">
                    <span class="sr-only">35% Complete (success)</span>
                </div>
            </div>
        </div>
        <div class="p-m bg-light border-bottom border-top">
            <span class="font-bold no-margins">Social talks </span>
            <br>
            <small>Lorem Ipsum is simply dummy text of the printing simply all dummy text.</small>
            <div class="m-t-md">
                <div class="social-talk">
                    <div class="media social-profile clearfix">
                        <a class="pull-left">
                            <img src="images/a1.jpg" alt="profile-picture">
                        </a>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                            <span class="font-bold">John Novak</span>
                            <small class="text-muted">21.03.2015</small>
                            <div class="social-content small">
                                Injected humour, or randomised words which don't look even slightly believable.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social-talk">
                    <div class="media social-profile clearfix">
                        <a class="pull-left">
                            <img src="images/a3.jpg" alt="profile-picture">
                        </a>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                            <span class="font-bold">Mark Smith</span>
                            <small class="text-muted">14.04.2015</small>
                            <div class="social-content">
                                Many desktop publishing packages and web page editors.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social-talk">
                    <div class="media social-profile clearfix">
                        <a class="pull-left">
                            <img src="images/a4.jpg" alt="profile-picture">
                        </a>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                            <span class="font-bold">Marica Morgan</span>
                            <small class="text-muted">21.03.2015</small>

                            <div class="social-content">
                                There are many variations of passages of Lorem Ipsum available, but the majority have
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="p-m">
            <span class="font-bold no-margins">Sales in last week </span>
            <div class="m-t-xs">
                <div class="row">
                    <div class="col-xs-6">
                        <small>Today</small>
                        <h4 class="m-t-xs">$170,20 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                    <div class="col-xs-6">
                        <small>Last week</small>
                        <h4 class="m-t-xs">$580,90 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <small>Today</small>
                        <h4 class="m-t-xs">$620,20 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                    <div class="col-xs-6">
                        <small>Last week</small>
                        <h4 class="m-t-xs">$140,70 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                </div>
            </div>
            <small>Lorem Ipsum is simply dummy text of the printing simply all dummy text.
                Many desktop publishing packages and web page editors.
            </small>
        </div>

    </div>
        </div>

    <asp:Label ID="copyprofit" CssClass=" mt-2" runat="server" Font-Size="3em" Visible="false" Text="0" font-weight="600" Font-Bold="true"></asp:Label>


        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
