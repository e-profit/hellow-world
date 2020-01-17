<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="WebApplication1.ViewOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
       .new {
                 width: 10.333333%;
       }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <div class="panel panel-heading"><h5>View Club Factory Orders</h5></div>
    <div class="panel panel-body">  
         <div class="row form-group">
                     <div class="col-lg-1 text-right">
                         <span>From<span style="color: red">*</span></span>
                     </div>
                     <div class="col-lg-2">
                         <div class="input-group date">
                             <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                             <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                         </div>
                     </div>


                     <div class="col-lg-1 text-right">
                         <span>To<span style="color: red">*</span></span>
                     </div>
                     <div class="col-lg-2">
                         <div class="input-group date">
                             <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                             <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                         </div>
                     </div>

                   

                     <div class="col-lg-2 text-right">
                         <span>Order No.<span style="color: red">*</span></span>
                     </div>
                     <div class="col-lg-2 text-left">
                         <asp:TextBox ID="txtsearchorderid" runat="server" CssClass="form-control"></asp:TextBox>
                     </div>
                     <div class="col-lg-1 text-left">
                         <asp:Button ID="Search" runat="server" CssClass="btn btn-primary" Text="SEARCH" OnClick="Search_Click" />
                     </div>
                 </div>
        <div class="row form-group">
            <div class="col-lg-12" style="overflow:auto">
                <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="LightGray" CssClass="table table-bordered table-striped" HorizontalAlign="left" AutoGenerateColumns="False"  >
                    <Columns>
                          <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                       <ItemTemplate>
                                           <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lbldate"  style="float:left" runat="server" Text='<%# Eval("Export_Date") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Payment Method">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblpay" runat="server" style="float:left" Text='<%# Eval("Payment_Method") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order NO.">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblorderno" runat="server" style="float:left" Text='<%# Eval("Order_No") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seller SKU">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblsellersku" runat="server" style="float:left" Text='<%# Eval("Seller_SKU") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblproductname" runat="server"  Style="float:left;" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Units">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblunits" runat="server" Text='<%# Eval("Units") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice Amount">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblinvoicepayment" runat="server" Text='<%# Eval("Order_Origin_Amount") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
       
                </div>
        </div>

    
</asp:Content>
