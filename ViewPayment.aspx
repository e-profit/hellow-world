<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewPayment.aspx.cs" Inherits="WebApplication1.Pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel panel-heading">View Club Factory Payment</div>

       
               
    <div class="panel panel-body">

        <div class="row form-group">

            <div class="col-lg-0 "></div>
            <div class="col-lg-1 text-right">
                <span>From<span style="color: red">*</span></span>
            </div>
            <div class="col-lg-2">
                <div class="input-group date">
                    <asp:textbox id="TextBox2" runat="server" class="form-control"></asp:textbox>
                    <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
            </div>

            <div class="col-lg-1 text-right">
                <span>To<span style="color: red">*</span></span>
            </div>
            <div class="col-lg-2">
                <div class="input-group date">
                    <asp:textbox id="TextBox1" runat="server" class="form-control"></asp:textbox>
                    <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
            </div>

            <div class="col-lg-0"></div>

            <div class="col-lg-2 text-right">
                <span>Search Order ID.<span style="color: red">*</span></span>
            </div>
            <div class="col-lg-2 ">
                <asp:textbox id="txtsearchorderid" runat="server" cssclass="form-control"></asp:textbox>
            </div>
            <div class="col-lg-2">
                <asp:button id="Search" runat="server" cssclass="btn btn-primary" text="SEARCH" onclick="Search_Click" />
            </div>
        </div>

        <div class="col-lg-20" style="overflow: auto">
            <asp:gridview id="GridView1" runat="server" headerstyle-backcolor="LightGray" cssclass="table table-bordered table-striped" horizontalalign="Center" autogeneratecolumns="false" allowpaging="True" onpageindexchanging="GridView1_PageIndexChanging" pagesize="40">
                    <Columns>
                          <asp:TemplateField HeaderText="S.No" >
                                       <ItemTemplate>
                                           <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                       </ItemTemplate>
                                  </asp:TemplateField>
                      <asp:TemplateField HeaderText="Upload Payment Date">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblUploadPaymentDate" runat="server" Text='<%# Eval("UploadPaymentDate") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice Date">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblinvoicedate" runat="server" Text='<%# Eval("Invoice_Date") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order Id">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblorderid" runat="server" Text='<%# Eval("Order_ID") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seller Sku">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblsellersku" runat="server" Text='<%# Eval("Shipment_Item_Id") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblquantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblproductname" runat="server" ></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice Amount">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblinvoiceamount" runat="server" Text='<%# Eval("Invoice_Amount") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order_Deadweight">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblOrderDeadweight" runat="server" Text='<%# Eval("Order_Deadweight") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Weight_Factor">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblWeightFactor" runat="server" Text='<%# Eval("Weight_Factor") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order_Chargeable_Weight">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblOrderChargeableWeight" runat="server" Text='<%# Eval("Order_Chargeable_Weight") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Shipping Amount">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblshippingamount" runat="server" Text='<%# Eval("Shipping_Amount") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Commission Amount">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblcommission" runat="server" Text='<%# Eval("Commission_Amount") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Settled Amount ">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblsettledamount" runat="server" Text='<%# Eval("Final_Amount_Payable_to_seller") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="LightGray"></HeaderStyle>
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" PageButtonCount="4" />
                </asp:gridview>
        </div>
        <asp:label id="Label1" runat="server" text="Label" Visible="false"></asp:label>
    </div>
   </div>
   
</asp:Content>
