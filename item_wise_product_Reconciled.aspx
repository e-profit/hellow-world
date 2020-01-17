<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="item_wise_product_Reconciled.aspx.cs" Inherits="WebApplication1.item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">
        <div class="panel panel-heading">
            <h5>View Club Factory Item Wise</h5>
        </div>
        <div class="panel panel-body">
            <div class="row form-group">
                <div class="col-lg-12" style="overflow: auto">
                    <asp:GridView ID="GridView1" runat="server"  ShowHeaderWhenEmpty="true" ShowFooter="true" ShowHeadersWhenNoRecords="true" HeaderStyle-BackColor="LightGray" CssClass="table table-bordered table-striped" HorizontalAlign="Center" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>

                                <ItemStyle Width="100px"></ItemStyle>
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
                                        <asp:Label ID="lblunitcostamount" runat="server" Text='<%# Eval("TotalCost") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delivered">
                                <ItemTemplate>
                                    <div class="text-center">

                                        <asp:LinkButton ID="lnkDelivered"  runat="server" Style="color: blue; text-decoration: underline;" Text='<%# Eval("Delivered") %>'></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DTO">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:LinkButton ID="lnkdto" runat="server"  Style="color: blue; text-decoration: underline;"  Text='<%# Eval("DTO") %>'></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RTO">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:LinkButton ID="lnkrto" runat="server"  Style="color: blue; text-decoration: underline;" Text='<%# Eval("RTO") %>'></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Net Payout">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="lblnetpayout" runat="server" Text='<%# Eval("NetPayout") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Profit">
                                <FooterTemplate>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:Label ID="Profit" runat="server" Text='<%# Eval("Profit") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <HeaderStyle BackColor="LightGray"></HeaderStyle>
                    </asp:GridView>
                </div>
            </div>
</asp:Content>
