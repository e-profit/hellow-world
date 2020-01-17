<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewReturn.aspx.cs" Inherits="WebApplication1.ViewReturn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel panel-heading">View Returns</div>
        <div class="panel panel-body">
            <div class="container">
                <div class="row form-group">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                        <asp:GridView ID="ReturnGridview" runat="server" HeaderStyle-BackColor="LightGray" AutoGenerateColumns="False" class="table table-bordered table-striped">
                            <Columns>
                                
                                   <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                            </ItemTemplate>
                                       <ItemStyle Width="100px" />
                        </asp:TemplateField>
                                <asp:TemplateField HeaderText="Market_Place">
                                  
                                   
                                    <ItemTemplate>
                                        <div class="auto-style1">
                                            <asp:Label ID="lblmarketplace" runat="server" Text='<%# Eval("Market_Place") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                   
                                    <ItemTemplate>
                                        <div class="auto-style1">
                                            <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order_Id">
                                   
                                  
                                    <ItemTemplate>
                                        <div class="auto-style1">
                                            <asp:Label ID="lblorderid" runat="server" Text='<%# Eval("Order_Id") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">

                                    <ItemTemplate>
                                        <div class="auto-style1">
                                            <asp:Label ID="lblquantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product_Name">
                                    <ItemTemplate>
                                        <div class="auto-style1">
                                            <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Open">
                                       <ItemTemplate>
                                           <div class="auto-style1">
                                               <asp:Label ID="lblopen" runat="server" Text='<%# Eval("Open_Close") %>'></asp:Label>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Sellable">
                                       <ItemTemplate>
                                           <div class="auto-style1">
                                               <asp:Label ID="lblsellable" runat="server" Text='<%# Eval("Sellable") %>'></asp:Label>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Other_Product_Recevied_Detail">
                                       <ItemTemplate>
                                           <asp:Label ID="lblotherproductrecevieddetails" runat="server" Text='<%# Eval("Other_Product_Recevied_Detail") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                            </Columns>
                            
                            <HeaderStyle BackColor="LightGray" />
                            
                        </asp:GridView>
                                
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                 </div>
                </div>
            </div>
        </div>
</asp:Content>
