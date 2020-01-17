<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="WebApplication1.Report" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .city {
            display: none
        }
    </style>
    <script type="text/javascript">
        function closeloginmodal() {
            $("#loginspanclose").trigger('click');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">
        <div class="panel panel-heading">
            <h5>View Club Factory Reports</h5>
        </div>
        <div class="panel panel-body">
            <div class="row form-group">
                <div class="col-lg-12" style="overflow: auto">
                    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand1"  ShowHeaderWhenEmpty="true" ShowFooter="true"  ShowHeadersWhenNoRecords="true" HeaderStyle-BackColor="LightGray" CssClass="table table-bordered table-striped" HorizontalAlign="Center" >
                        <Columns>
                            <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Export_Date") %>'></asp:Label>
                                       
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Order No">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <%--<asp:Label ID="lblorderno" runat="server" ></asp:Label>--%>
                                         <asp:LinkButton ID="lnkorderno" runat="server" Text='<%# Eval("Order_No") %>' ></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SKU Name.">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblsellersku" runat="server" Text='<%# Eval("Seller_SKU") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Units">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblunits" runat="server" Style="float: left; width: 300px" Text='<%# Eval("Units") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Cost">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblproductcost" runat="server" Text='<%# Eval("ProductCost") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Cost">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblunitcostamount" runat="server"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delivered">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <%--  <asp:Label ID="lblDelivered" runat="server"  ></asp:Label>--%>
                                        <%--<asp:LinkButton runat="server" on>LinkButton</asp:LinkButton>--%>
                                        <%-- <asp:LinkButton ID="lnkNotification" class="btn w3ls-btn btn-2  d-block" data-toggle="modal" runat="server" aria-pressed="false" data-target="#Notificationmodel" OnClick="lnkNotification_Click">--%>
                                        <asp:LinkButton ID="lnkDelivered" Text="0" OnClick="lnkDelivered_Click" data-toggle="modal" runat="server" aria-pressed="false" data-target="#Notificationmodel" Style="color: blue; text-decoration: underline;" CommandArgument='<%#Eval("Order_No") + ";" +Eval("Seller_SKU")%>'></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DTO">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:LinkButton ID="lnkdto" runat="server" Text="0" Style="color: blue; text-decoration: underline;"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RTO">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:LinkButton ID="lnkrto" runat="server" Text="0" Style="color: blue; text-decoration: underline;"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Net Payout">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblnetpayout" runat="server"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Profit">
                                <FooterTemplate>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="Profit" runat="server"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Profit(%)">
<FooterTemplate>

</FooterTemplate>
<ItemTemplate>
<div class="text-center">
<asp:Label ID="Profitpercentage" runat="server" Text="Label"></asp:Label>%
</div>
</ItemTemplate>
</asp:TemplateField>
                        </Columns>

<HeaderStyle BackColor="LightGray"></HeaderStyle>
                        <%-- <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" PageButtonCount="4" />--%>
                    </asp:GridView>
                </div>
            </div>
            
            <%--<div class="col forgot-w3l text-right">
                <a href="#" class="text-white btn btn-primary" style="text-decoration: underline" onclick="closeloginmodal()" data-target="#popuforsummray" data-toggle="modal">Forgot Password?</a>
            </div>--%>

<%--            <asp:Panel ID="Panel1" runat="server">--%>
                <!------forget password popup----->


            <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>






            <!---notification-------->
            <div class="modal fade hmodal-info" id="myModal8" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="color-line"></div>
                        <div class="modal-header">
                            <h4 class="modal-title">Modal title</h4>
                            <small class="font-bold">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</small>
                        </div>
                        <div class="modal-body" style="overflow: auto">
                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>

<%--                                     <asp:TemplateField HeaderText="Date" ItemStyle-Width="100">
<ItemTemplate>
<asp:label id="lbldate" runat="server" text='<%# Eval("uploadpaymentdate") %>'/>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Status" ItemStyle-Width="100">
<ItemTemplate>
<asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Transaction_Type") %>'/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Amount" ItemStyle-Width="100">
<ItemTemplate>
<asp:label id="lblamount" runat="server" text='<%# Eval("net_order_value_payable_to_seller") %>'/>
</ItemTemplate>
</asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
