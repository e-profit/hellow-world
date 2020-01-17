<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Unreconciled.aspx.cs" Inherits="WebApplication1.Unreconciled" %>
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
                    <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" OnRowCommand="GridView1_RowCommand" ShowHeadersWhenNoRecords="true" HeaderStyle-BackColor="LightGray" CssClass="table table-bordered table-striped" HorizontalAlign="Center" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
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
                                        <asp:LinkButton ID="lnkDelivered" runat="server" data-target="#popuforsummray" OnClick="lnkDelivered_Click" data-toggle="modal" Style="color: blue; text-decoration: underline;" CommandName="delivery"  CommandArgument='<%#Eval("Order_No")%>'></asp:LinkButton>
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
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="Profit" runat="server"></asp:Label>
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
