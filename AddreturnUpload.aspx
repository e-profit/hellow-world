<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddreturnUpload.aspx.cs" Inherits="WebApplication1.AddreturnUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="panel panel-default">
        <div class="panel panel-heading">ADD RETURNS</div>
        <div class="panel panel-body">
            <div class="container">
                <div class="row form-group">
                    <div class="col-lg-1 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Upload Returns<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3 ">
                        <asp:FileUpload ID="fduploadreturn" CssClass="form-control" runat="server"  ValidationGroup="upload1"/>

                         <asp:RequiredFieldValidator ErrorMessage="Required  Execl File (.xlsx) " ControlToValidate="fduploadreturn"
                            runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="upload1" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xlsx)$"
                            ControlToValidate="fduploadreturn" runat="server" ValidationGroup="upload1" ForeColor="Red" ErrorMessage="Please select a valid  Excel File (.xlsx)."
                            Display="Dynamic" />
                    </div>
                    <div class="col-lg-1 ">
                        <asp:Button ID="btnupload" runat="server" CssClass="btn btn-primary" Text="Upload" ValidationGroup="upload1" OnClick="btnupload_Click" />
                    </div>
                    <div class="col-lg-3 ">
                        <asp:LinkButton ID="lnkformate" runat="server" CssClass="btn btn-default" Text="Download Formate For Upload" OnClick="lnkformate_Click"></asp:LinkButton>
                    </div>

                </div>
                <hr />

                <div class="row">
                    <div class="col-lg-6">
                        <div class="hpanel">
                            <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right ">
                                    <span>Market Place<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4 ">
                                    <asp:DropDownList ID="ddmarketplace" runat="server" ValidationGroup="add1" class="btn btn-default dropdown-toggle" aria-expanded="false">
                                        <asp:ListItem Value="1">Select Market Place</asp:ListItem>
                                        <asp:ListItem>NorthWest Club Factory</asp:ListItem>
                                        <asp:ListItem>Semaphore Amazon </asp:ListItem>
                                        <asp:ListItem>Semaphore Flipkart</asp:ListItem>
                                        <asp:ListItem>NorthWest Flipkart</asp:ListItem>
                                        <asp:ListItem>NorthWest Amazon</asp:ListItem>

                                    </asp:DropDownList>
                                     <asp:RequiredFieldValidator InitialValue="1" ErrorMessage="Required  select Market " ControlToValidate="ddmarketplace"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>


                            <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right">
                                    <span>Date<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4 ">
                                    <div class="input-group date">
                                        <asp:TextBox ID="txtdate" runat="server" class="form-control"></asp:TextBox>
                                         
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                       
                                       
                              
                                    </div>
                                     <asp:RequiredFieldValidator  ErrorMessage="Enter valid date " ControlToValidate="txtdate"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right">
                                    <span>Order ID<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtorderid" runat="server" CssClass="form-control"></asp:TextBox>
                                       <asp:RequiredFieldValidator  ErrorMessage="Enter Order No. date " ControlToValidate="txtorderid"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>
                             <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right">
                                    <span>Quantity<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtquantity" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator  ErrorMessage="Enter Quantity " ControlToValidate="txtquantity"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right">
                                    <span>Product Name<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtproductname" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator  ErrorMessage="Enter Product Name " ControlToValidate="txtproductname"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right">
                                    <span>Open<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4">
                                    <asp:DropDownList ID="ddopen" runat="server" class="btn btn-default dropdown-toggle" aria-expanded="false">
                                        <asp:ListItem Value="1">Select </asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                      <asp:RequiredFieldValidator InitialValue="1"  ErrorMessage="Required select  " ControlToValidate="ddopen"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-2 text-right"></div>
                                <div class="col-lg-3 text-right">
                                    <span>Sellable<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4">
                                    <asp:DropDownList ID="ddsellable" runat="server" class="btn btn-default dropdown-toggle" aria-expanded="false">
                                        <asp:ListItem Value="1">Select</asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                      <asp:RequiredFieldValidator InitialValue="1"  ErrorMessage="Required select  " ControlToValidate="ddsellable"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-1 text-right"></div>
                                <div class="col-lg-4 text-right">
                                    <span>Other Product Recevied Detail<span style="color: red">*</span></span>
                                </div>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtdetail" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator  ErrorMessage="Required Other Product Recevied Details  " ControlToValidate="txtdetail"
                            runat="server" Display="Dynamic" ForeColor="Red"  ValidationGroup="add1" />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-4 text-right"></div>
                                <div class="col-lg-4">
                                    <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-primary" ValidationGroup="add1" Text="Submit" OnClick="BtnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="hpanel">
                            <div class="panel-body float-e-margins">
                                <div class="header extreme-color">
                                    <span>Details</span>
                                </div>
                                <hr />
                                <div class="col-lg-15">
                                    <div class="row form-group">
                                        <div class="col-lg-3 text-right"></div>
                                        <div class="col-lg-4 text-right ">
                                            <span>Market Place</span>
                                        </div>
                                        <div class="col-lg-5 ">
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>


                                    <div class="row form-group">
                                        <div class="col-lg-4 text-right"></div>
                                        <div class="col-lg-3 text-right">
                                            <span>Date</span>
                                        </div>
                                        <div class="col-lg-4 ">
                                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-lg-3 text-right"></div>
                                        <div class="col-lg-4 text-right">
                                            <span>Order ID</span>
                                        </div>
                                        <div class="col-lg-4 ">
                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-3 text-right"></div>
                                        <div class="col-lg-4 text-right">
                                            <span>Quantity</span>
                                        </div>
                                        <div class="col-lg-4 ">
                                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-2 text-right"></div>
                                        <div class="col-lg-5 text-right">
                                            <span>Product Name</span>
                                        </div>
                                        <div class="col-lg-4 ">
                                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-3 text-right"></div>
                                        <div class="col-lg-4 text-right">
                                            <span>Open</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-lg-3 text-right"></div>
                                        <div class="col-lg-4 text-right">
                                            <span>Sellable</span>
                                        </div>
                                        <div class="col-lg-4 ">
                                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">

                                        <div class="col-lg-7 text-right">
                                            <span>Other Product Recevied Detail</span>
                                        </div>
                                        <div class="col-lg-4 ">
                                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>
