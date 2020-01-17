<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MapedSKU.aspx.cs" Inherits="WebApplication1.MapedSKU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <div class="panel panel-heading">Maped SKU</div>
        <div class="panel panel-body">
            <div class="container">
                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Search MapedSKU Name<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3 ">
                        <asp:TextBox ID="txtsearchmapedSKUName" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>                        
                    <div class="col-lg-3">
                        <asp:Button ID="Search" runat="server" CssClass="btn btn-primary" Text="SEARCH" OnClick="Search_Click" />
                    </div>
                        </div>
                  <div class="row form-group">
                    <div class="col-lg-10 text-right">
                         <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" CssClass="table table-hover" OnRowUpdating="GridView1_RowUpdating" HorizontalAlign="Center" AutoGenerateColumns="False" >
                    <Columns>
                         <asp:TemplateField HeaderText="SKU id" Visible="false">
                           
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Labeids" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SKU Name">
                           
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    <asp:Label ID="lblSkuID" runat="server" Text='<%# Eval("SKUID") %>'  Visible="false"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                           
                             <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                    <asp:Label ID="lblProductid" Visible="false" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost">
                             <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblcost" runat="server" Text='<%# Eval("ProductCost") %>'></asp:Label>
                                </div>
                             </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Weight">
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="lblweight" runat="server" Text='<%# Eval("Product_Weight") %>'></asp:Label>
                                </div>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                           
                            <ItemTemplate>
                                <div class="text-center">
                                    
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" CommandName="Unmaped" CommandArgument='<%# Eval("SKUID") %>' Text="Unmaped" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
