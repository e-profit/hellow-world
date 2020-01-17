<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplication1.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel panel-heading">Upload Orders</div>
        <div class="panel panel-body">
            <div class="container">
                  <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Upload Orders<span style="color: red">*</span></span>
                    </div>
                      <div class="col-lg-3 ">
                          <asp:FileUpload ID="fduploadorders" CssClass="form-control" runat="server" />

                           <asp:RequiredFieldValidator ErrorMessage="Required select Execl File (.xlsx) File" ControlToValidate="fduploadorders"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="upload1" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xlsx)$"
                            ControlToValidate="fduploadorders" runat="server" ValidationGroup="upload1" ForeColor="Red" ErrorMessage="Please select a valid  Excel File (.xlsx)."
                            Display="Dynamic" />

                          </div> 
                     
                  </div>
                 <div class="row form-group">
                    <div class="col-lg-4 text-right"></div>
                      <div class="col-lg-3 ">
                        <asp:Button ID="btnupload" runat="server" CssClass="btn btn-primary" ValidationGroup="upload1" Text="Upload" OnClick="btnupload_Click"/>
                    </div>
                     </div>
                <hr/>               
           </div>
           
        </div>
    </div>
        
</asp:Content>
