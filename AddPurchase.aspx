<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddPurchase.aspx.cs" Inherits="NorthWestupdated.AddPurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"
        type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <!-- Vendor styles -->
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
    <link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
    <link rel="stylesheet" href="vendor/animate.css/animate.css" />
    <link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="vendor/xeditable/bootstrap3-editable/css/bootstrap-editable.css" />
    <link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
    <link rel="stylesheet" href="vendor/select2-bootstrap/select2-bootstrap.css" />
    <link rel="stylesheet" href="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" />
    <link rel="stylesheet" href="vendor/bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />
    <link rel="stylesheet" href="vendor/clockpicker/dist/bootstrap-clockpicker.min.css" />
    <link rel="stylesheet" href="vendor/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">


    <!-- Page title -->
    <title>Home :: e-Profit</title>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

    <!-- Vendor styles -->
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
    <link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
    <link rel="stylesheet" href="vendor/animate.css/animate.css" />
    <link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
    <style type="text/css">
        .table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 20px;
            text-align: center;
        }

            .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
                text-align: center
            }

            .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
                padding: 3px;
                line-height: 1.42857143;
                vertical-align: top;
                border-top: 1px solid #ddd;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

            
                <div class="panel panel-default">
                    <div class="panel panel-heading">
                        <div class="text-center">
                            <h2 class="font-extra-bold no-margins w3-text-blue-gray">Add Purchase</h2>
                        </div>
                    </div>
                    <div class="panel-body">
                          <div class="container">
                    <div class="col-lg-1">
                        <asp:Button ID="BtnSaveAll" runat="server" Text="Save All" CssClass="btn btn-danger" OnClick="BtnSaveAll_Click" Font-Bold="true" />
                    </div>
                    <div class="col-lg-10 text-right">
                        <span>Vch No.<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-1 text-left ">
                        <asp:Label ID="lblvch" runat="server" Text="0" Font-Bold="true" CssClass="control"></asp:Label>
                    </div>
                    <div class="panel panel-body">
                        <div class="container">
                            <div class="row form-group">

                                <br />
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 text-right">
                                    <span>Date<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-3 ">                                    
                                    <div class="input-group date">
                                        <asp:TextBox ID="txtdate" runat="server" class="form-control"></asp:TextBox>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </div>


                            </div>
                            <div id="selectvendor" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div  class="col-lg-2 text-right">
                                    <span>Select Vendor Name<span style="color: red">*</span></span>
                                </div>                               
                                <div class="col-lg-3 ">                                    
                                    <asp:DropDownList ID="ddpartyname" CssClass="form-control" runat="server" OnTextChanged="ddpartyname_TextChanged" AutoPostBack="true">                                       
                                    </asp:DropDownList>
                                </div>
                                <asp:Button ID="ADD" runat="server" CssClass="btn btn-primary" Text="+" Font-Bold="true" />
                               
                            </div>
                             <div id="addvendor" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div  class="col-lg-2 text-right">
                                    <span>Vendor Name<span style="color: red">*</span></span>
                                </div>                                
                                <div class="col-lg-3 ">
                                   <asp:TextBox ID="txtvendorname"  runat="server" CssClass="form-control"></asp:TextBox>                                  
                                </div>
                                <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="BtnSubmit_Click1" Autopostback="true" />
                            </div>
                           
                            <div id="companyname" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-2 text-right">
                                    <span>Company Name<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-3 ">
                                    <asp:TextBox ID="txtcompanyname"  runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div id="fax" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-2 text-right">
                                    <span>FAX<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-3 ">
                                    <asp:TextBox ID="txtfax" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div id="email" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-2 text-right">
                                    <span>Email<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-3 ">
                                    <asp:TextBox ID="txtemail"  runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div id="contact" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-2 text-right">
                                    <span>Contact<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-3 ">
                                    <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div id="business" class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-2 text-right">
                                    <span>Business Type<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-3 ">
                                    <asp:TextBox ID="txtbusiness"  runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                         </div>
                    </div>
                              </div>
                </div>

                <div class="panel panel-body">
                    <div class="container">
                        <div class="row form-group">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-2 text-right">
                                <span>Product Name<span style="color: red">*</span></span>
                            </div>
                            <div class="col-lg-3 ">
                                <asp:TextBox ID="txtpname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-1 text-right">
                                <span>Quantity<span style="color: red">*</span></span>
                            </div>

                            <div class="col-lg-1 text-left ">
                                <asp:TextBox ID="txtquantity" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-3 text-left ">
                                <asp:Button ID="BtnAddProduct" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="BtnAddProduct_Click1" />                             
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-lg-11">
                                <hr />
                            </div>
                        </div>


                        <div class="row form-group">
                            <div class="col-lg-2 "></div>
                            <div class="col-lg-7 text-center">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CssClass="table table-bordered table-striped table-hover" OnRowDeleting="GridView1_RowDeleting" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="S. No.">
                                            <ItemTemplate>
                                                <div class="w3-center">
                                                    <asp:Label ID="lblsno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle Font-Bold="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Name">
                                            <ItemTemplate>
                                                <div class="w3-center">
                                                    <asp:Label ID="Productname" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Id") %>'></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle Font-Bold="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <div class="w3-center">
                                                    <asp:Label ID="lblquantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle Font-Bold="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:Button ID="Delete" runat="server" CssClass="btn btn-primary" CommandName="Delete" Text="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        


        <!-- Footer-->

        <!-- Vendor scripts -->
        <script src="vendor/jquery/dist/jquery.min.js"></script>
        <script src="vendor/jquery-ui/jquery-ui.min.js"></script>
        <script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="vendor/jquery-flot/jquery.flot.js"></script>
        <script src="vendor/jquery-flot/jquery.flot.resize.js"></script>
        <script src="vendor/jquery-flot/jquery.flot.pie.js"></script>
        <script src="vendor/flot.curvedlines/curvedLines.js"></script>
        <script src="vendor/jquery.flot.spline/index.js"></script>
        <script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
        <script src="vendor/iCheck/icheck.min.js"></script>
        <script src="vendor/peity/jquery.peity.min.js"></script>
        <script src="vendor/sparkline/index.js"></script>

        <!-- App scripts -->
        <script src="scripts/homer.js"></script>
        <script src="scripts/charts.js"></script>

        <script>

            $(function () {

                /**
                 * Flot charts data and options
                 */
                var data1 = [[0, 55], [1, 48], [2, 40], [3, 36], [4, 40], [5, 60], [6, 50], [7, 51]];
                var data2 = [[0, 56], [1, 49], [2, 41], [3, 38], [4, 46], [5, 67], [6, 57], [7, 59]];

                var chartUsersOptions = {
                    series: {
                        splines: {
                            show: true,
                            tension: 0.4,
                            lineWidth: 1,
                            fill: 0.4
                        },
                    },
                    grid: {
                        tickColor: "#f0f0f0",
                        borderWidth: 1,
                        borderColor: 'f0f0f0',
                        color: '#6a6c6f'
                    },
                    colors: ["#62cb31", "#efefef"],
                };

                $.plot($("#flot-line-chart"), [data1, data2], chartUsersOptions);

                /**
                 * Flot charts 2 data and options
                 */
                var chartIncomeData = [
                    {
                        label: "line",
                        data: [[1, 10], [2, 26], [3, 16], [4, 36], [5, 32], [6, 51]]
                    }
                ];

                var chartIncomeOptions = {
                    series: {
                        lines: {
                            show: true,
                            lineWidth: 0,
                            fill: true,
                            fillColor: "#64cc34"

                        }
                    },
                    colors: ["#62cb31"],
                    grid: {
                        show: false
                    },
                    legend: {
                        show: false
                    }
                };

                $.plot($("#flot-income-chart"), chartIncomeData, chartIncomeOptions);



            });

        </script>

        <script src="vendor/jquery/dist/jquery.min.js"></script>
        <script src="vendor/jquery-ui/jquery-ui.min.js"></script>
        <script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
        <script src="vendor/iCheck/icheck.min.js"></script>
        <script src="vendor/sparkline/index.js"></script>
        <script src="vendor/moment/moment.js"></script>
        <script src="vendor/xeditable/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
        <script src="vendor/select2-3.5.2/select2.min.js"></script>
        <script src="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
        <script src="vendor/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
        <script src="vendor/clockpicker/dist/bootstrap-clockpicker.min.js"></script>
        <script src="vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

        <!-- App scripts -->
        <script src="scripts/homer.js"></script>

        <script>

            $(function () {

                $('#datepicker').datepicker();
                $("#datepicker").on("changeDate", function (event) {
                    $("#my_hidden_input").val(
                        $("#datepicker").datepicker('getFormattedDate')
                    )
                });

                $('#datapicker2').datepicker();
                $('.input-group.date').datepicker({});
                $('.input-daterange').datepicker({});

                $("#demo1").TouchSpin({
                    min: 0,
                    max: 100,
                    step: 0.1,
                    decimals: 2,
                    boostat: 5,
                    maxboostedstep: 10,
                });

                $("#demo2").TouchSpin({
                    verticalbuttons: true
                });

                $("#demo3").TouchSpin({
                    postfix: '%'
                });

                $("#demo4").TouchSpin({
                    postfix: "a button",
                    postfix_extraclass: "btn btn-default"
                });

                $(".js-source-states").select2();
                $(".js-source-states-2").select2();

                //turn to inline mode
                $.fn.editable.defaults.mode = 'inline';

                //defaults
                $.fn.editable.defaults.url = '#';

                //editables
                $('#username').editable({
                    url: '#',
                    type: 'text',
                    pk: 1,
                    name: 'username',
                    title: 'Enter username'
                });

                $('#firstname').editable({
                    validate: function (value) {
                        if ($.trim(value) == '') return 'This field is required';
                    }
                });

                $('#sex').editable({
                    prepend: "not selected",
                    source: [
                        { value: 1, text: 'Male' },
                        { value: 2, text: 'Female' }
                    ],
                    display: function (value, sourceData) {
                        var colors = { "": "gray", 1: "green", 2: "blue" },
                            elem = $.grep(sourceData, function (o) { return o.value == value; });

                        if (elem.length) {
                            $(this).text(elem[0].text).css("color", colors[value]);
                        } else {
                            $(this).empty();
                        }
                    }
                });

                $('#dob').editable();

                $('#event').editable({
                    placement: 'right',
                    combodate: {
                        firstItem: 'name'
                    }
                });

                $('#comments').editable({
                    showbuttons: 'bottom'
                });

                $('#fruits').editable({
                    pk: 1,
                    limit: 3,
                    source: [
                        { value: 1, text: 'banana' },
                        { value: 2, text: 'peach' },
                        { value: 3, text: 'apple' },
                        { value: 4, text: 'watermelon' },
                        { value: 5, text: 'orange' }
                    ]
                });

                $('#user .editable').on('hidden', function (e, reason) {
                    if (reason === 'save' || reason === 'nochange') {
                        var $next = $(this).closest('tr').next().find('.editable');
                        if ($('#autoopen').is(':checked')) {
                            setTimeout(function () {
                                $next.editable('show');
                            }, 300);
                        } else {
                            $next.focus();
                        }
                    }
                });
            });

        </script>


        <script src="Script/jquery-3.3.1.min.js"></script>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
        <link href="js/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
        <script type="text/javascript">
            function edValueKeyPress() {
                var edValue = document.getElementById("txtProductName");
                var s = edValue.value;

                //var lblValue = document.getElementById("lblValue");
                //lblValue.innerText = "The text box contains: " + s;
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function () {

                SearchText1();

            });
            function SearchText1() {
                debugger;
                $("#txtpname").autocomplete(
                    {

                        source: function (request, response) {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "WebForm3.aspx/GetName",
                                data: "{'Name':'" + $('#txtpname').val() + "'}",
                                dataType: "json",
                                success: function (data) {
                                    response(data.d);
                                },
                                error: function (result) {
                                    alert("No Match");

                                }
                            });
                        }
                    });
            }
        </script>

        <script type="text/javascript">
            $(function () {               
                $('[id*=company]').hide();
                $('[id*=fax]').hide();
                $('[id*=email]').hide();
                $('[id*=contact]').hide();
                $('[id*=business]').hide();
                $('[id*=addvendor]').hide();

                $("[id*=ADD]").click(function () {
                    $('[id*=companyname]').show();                    
                    $('[id*=fax]').show();
                    $('[id*=email]').show();
                    $('[id*=contact]').show();
                    $('[id*=business]').show();
                    $('[id*=addvendor]').show();
                    $('[id*=selectvendor]').hide();
                    return false;
                });               
            });
        </script>
</asp:Content>
