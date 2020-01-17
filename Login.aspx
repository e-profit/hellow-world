<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>Login | E-Profit </title>

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
       .card-textbox
       {                     
            background-image:url(images/backgroundimage.jpg);
            background-size: 100%;
            height:125%;
        }
      
        </style>

</head>
<body class="blank">
    <form id="form1" runat="server">

<div class="color-line"></div>
<div class="login-container" >    
    <div class="row">
        <div class="col-md-12">
            <div class="text-center m-b-md">
                <h3>LOGIN TO E-PROFIT</h3>
              
            </div>
            <div class="hpanel">
                <div class="panel-body">
                     <%--  pattern="[^ @]*@[^ @]*"--%>
                            <div class="form-group">
                                <label class="control-label" for="username">Email ID</label>
                                <asp:TextBox ID="txtemailid" runat="server" class="form-control" placeholder="example@gmail.com" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display='Dynamic' ErrorMessage="Required Email id"
                                     ControlToValidate="txtemailid" ForeColor="Red" SetFocusOnError="true" ValidationGroup="logvalidate"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ValidationGroup="logvalidate" ControlToValidate="txtemailid" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please valid emailid" Display="Dynamic"></asp:RegularExpressionValidator>

                                 </div>
                            <div class="form-group">
                                <label class="control-label" for="password">Password</label>
                                <asp:TextBox ID="txtpassword" runat="server" class="form-control" TextMode="Password" placeholder="******" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display='Dynamic' ErrorMessage="Required Email id"
                                     ControlToValidate="txtpassword" ForeColor="Red" SetFocusOnError="true" ValidationGroup="logvalidate"></asp:RequiredFieldValidator>
                             
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" class="i-checks" checked="">
                                     Remember login
                                <p class="help-block small">(if this is a private computer)</p>
                            </div>
                    <asp:Button ID="Btnlogin" runat="server" class="btn btn-success btn-block" Text="Login"  ValidationGroup="logvalidate"  onclick="Btnlogin_Click"/>
                    <asp:Button ID="Btnregister" runat="server" class="btn btn-default btn-block" Text="Register"  onclick="Btnregister_Click"/>
                     
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