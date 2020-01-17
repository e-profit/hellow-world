<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrations.aspx.cs" Inherits="WebApplication1.Registrations" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>HOMER | WebApp admin theme</title>

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
    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        function printGrid() {
            $(document).ready(function () {
                $('#BtnRegister').click(function () {
                    $(this).prop('disabled', true);
                    $("#content").show();

                    setTimeout(function () {
                        $('#BtnRegister').prop('disabled', false);
                    }, 3000);

                });
            });
        }
</script>--%>
    
</head>
<body class="blank">
    <form id="form1" runat="server">

<!-- Simple splash screen-->
<%--<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>Homer - Responsive Admin Theme</h1><p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>--%>
<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<div class="color-line"></div>
        <div class="back-link">
            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Go To Login Page" onclick="Button1_Click" />
</div>

<div class="register-container">
    <div class="row">
        <div class="col-md-8">
            <div class="text-center m-b-md">
                <h3>Registration</h3>
                
            </div>
            <div class="hpanel">
                <div class="panel-body ">
                       
                            <div class="">
                            <div class="row form-group col-lg-12">
                                <label>Username</label>
                                <asp:TextBox ID="txtusername" runat="server" class="form-control" > </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display='Dynamic' ErrorMessage="Required User Name" 
                                    ControlToValidate="txtusername" ForeColor="Red" SetFocusOnError="true" ValidationGroup="regvalidate"></asp:RequiredFieldValidator>

                                 <br />
                                  <label>Email Address</label>
                                <br />
                                <asp:TextBox ID="txtemail" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display='Dynamic' ErrorMessage="Required Email id"
                                     ControlToValidate="txtemail" ForeColor="Red" SetFocusOnError="true" ValidationGroup="regvalidate"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ValidationGroup="regvalidate" ControlToValidate="txtemail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please valid emailid" Display="Dynamic"></asp:RegularExpressionValidator>

                                 <br />
                                <label>Password</label>
                                <asp:TextBox ID="txtpassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" Display='Dynamic' ErrorMessage="Required Password"
                                     ControlToValidate="txtpassword" ForeColor="Red" SetFocusOnError="true" ValidationGroup="regvalidate"></asp:RequiredFieldValidator>
                               
                                
                            </div>
                            <div class="row form-group col-lg-6">
                                <asp:Button ID="BtnRegister"  runat="server" class="btn btn-success" Text="Register" ValidationGroup="regvalidate"  OnClick="BtnRegister_Click"/>
                                <asp:Button ID="Btncancel" runat="server" class="btn btn-default" Text="Cancel" />
                            </div>
                                
                            <div class="row form-group col-lg-6">
                               
                            </div>
                           
                          
                            </div>
                            <div class="text-center">
                                
                            </div>
                     
                </div>
            </div>
        </div>
    </div>
    
</div>

<!-- Vendor scripts -->
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="vendor/iCheck/icheck.min.js"></script>
<script src="vendor/sparkline/index.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>
        </form>
</body>
</html>