<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="AddSKU.aspx.cs" Inherits="WebApplication1.AddSKU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <div class="panel panel-heading">Add SKU</div>
        <div class="panel panel-body">
            <div class="container">
                  <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Upload SKU<span style="color: red">*</span></span>
                    </div>
                      <div class="col-lg-3 ">
                          <asp:FileUpload ID="fduploadproduct" CssClass="form-control" ValidationGroup="upload1" runat="server" />

                          <asp:RequiredFieldValidator ErrorMessage="Required select Execl File (.xlsx) File" ControlToValidate="fduploadproduct"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="upload1" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xlsx)$"
                            ControlToValidate="fduploadproduct" runat="server" ForeColor="Red" ErrorMessage="Please select a valid  Excel File (.xlsx)."
                            Display="Dynamic" />


                          </div>
                   <div class="col-lg-3 ">
                      <%-- <asp:LinkButton ID="lnkformate" runat="server" CssClass="btn btn-default" Text="Download Formate For Upload" OnClick="lnkformate_Click"></asp:LinkButton>--%>
                       <asp:Button ID="Button1" runat="server" Text="Download Formate For Upload" CssClass="btn btn-default" OnClick="Button1_Click"/>
                          </div>

                </div>

                 <div class="row form-group">
                    <div class="col-lg-4 text-right"></div>
                      <div class="col-lg-3 ">
                        <asp:Button ID="btnupload" runat="server" ValidationGroup="upload1" CssClass="btn btn-primary" Text="Upload" OnClick="btnupload_Click"/>
                    </div>
                     </div>
                <hr />

                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>SKU Name<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3 ">
                        <asp:TextBox ID="txtSKUName" runat="server" CssClass="form-control" OnTextChanged="txtSKUName_TextChanged" AutoPostBack="true"></asp:TextBox>
                         <asp:RequiredFieldValidator ErrorMessage="Required Enter SKU Name" ControlToValidate="txtSKUName"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="add1" />
                    </div>

                </div>
              

                
                  <div class="row form-group">
                    <div class="col-lg-4 text-right"></div>
                    <div class="col-lg-3">
                        <asp:Button ID="BtnSubmit" runat="server" ValidationGroup="add1" CssClass="btn btn-primary" Text="Submit" OnClick="BtnSubmit_Click"/>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
