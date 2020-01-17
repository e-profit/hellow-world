<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="NorthWestupdated.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <div class="panel panel-heading">View Club Factory Payment</div>

        <%-- <div class="panel panel-default">
        <div class="panel panel-heading">Upload Payment</div>--%>
        <div class="panel panel-body">
            <div class="container">
                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Enter Payment No.<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3">

                        <asp:textbox id="TextBox3" runat="server" class="form-control" OnTextChanged="TextBox3_TextChanged" AutoPostBack="true"></asp:textbox>
                          <asp:RequiredFieldValidator ErrorMessage="Required Payment No." ControlToValidate="TextBox3"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="upload1" />

                    </div>

                </div>
                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Date<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3">
                        <div class="input-group date">
                            <asp:textbox id="txtdate" runat="server" class="form-control"></asp:textbox>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                        </div>
                         <asp:RequiredFieldValidator ErrorMessage="Required Date" ControlToValidate="txtdate"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="upload1" />
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Upload Payments<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3 ">
                        <asp:fileupload id="fduploadpayments" cssclass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Required select Execl File (.xlsx) File" ControlToValidate="fduploadpayments"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="upload1" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xlsx)$"
                            ControlToValidate="fduploadpayments" runat="server" ForeColor="Red" ErrorMessage="Please select a valid  Excel File (.xlsx)."
                            Display="Dynamic" />
                    </div>
                    <div class="col-lg-3 ">
                        <asp:button id="btnupload" runat="server" cssclass="btn btn-primary" ValidationGroup="upload1" text="Upload" onclick="btnupload_Click" />
                    </div>
                     <div class="col-lg-3 ">
                         <asp:Label ID="lblmsg" runat="server"  Visible="false" ForeColor="Green" Text="Payments Uploded"></asp:Label>
                    </div>
                </div>


            </div>

        </div>
    </div>
</asp:Content>
