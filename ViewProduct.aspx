<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="WebApplication1.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function printGrid() {
            var gridData = document.getElementById('<%= ProductsDetailGridview.ClientID %>');
            var windowUrl = 'about:blank';
            //set print document name for gridview
            var uniqueName = new Date();
            var windowName = 'Print_' + uniqueName.getTime();

            var prtWindow = window.open(windowUrl, windowName,
                'left=100,top=100,right=100,bottom=100,width=700,height=500');
            prtWindow.document.write('<html><head></head>');
            prtWindow.document.write('<body style="background:none !important">');
            prtWindow.document.write(gridData.outerHTML);
            prtWindow.document.write('</body></html>');
            prtWindow.document.close();
            prtWindow.focus();
            prtWindow.print();
            prtWindow.close();
        }
    </script>


  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel panel-heading">View Product</div>
        <div class="panel panel-body">
            <div class="container">
                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Search Product Name<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3 ">
                        <asp:TextBox ID="txtsearchproductName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-3">
                        <asp:Button ID="Search" runat="server" CssClass="btn btn-primary" Text="SEARCH" OnClick="Search_Click" />
                    </div>
                </div>
                <div class="row form-group">
                   <%-- <div class="col-lg-1">
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="printGrid()"  />
                    </div>--%>

                    <div class="col-lg-10">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <asp:GridView ID="ProductsDetailGridview" runat="server" HeaderStyle-BackColor="LightGray" OnRowDeleting="ProductsDetailGridview_RowDeleting" AutoGenerateColumns="False" class="table table-hover" OnRowUpdating="ProductsDetailGridview_RowUpdating" ShowFooter="false" OnRowCancelingEdit="ProductsDetailGridview_RowCancelingEdit" OnRowEditing="ProductsDetailGridview_RowEditing">
                                    <Columns>

                                        <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txteditname" runat="server" CssClass="form-control" Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                                                <asp:Label ID="lblproductids" Visible="false" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                            </EditItemTemplate>

                                            <ItemTemplate>
                                                <asp:Label ID="lblname" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                                <asp:Label ID="lblproductid" Visible="false" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Cost">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txteditcost" runat="server" CssClass="form-control" Text='<%# Eval("ProductCost") %>'></asp:TextBox>
                                            </EditItemTemplate>

                                            <ItemTemplate>
                                                <asp:Label ID="lblcost" runat="server" Text='<%# Eval("ProductCost") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Weight">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txteditweight" runat="server" CssClass="form-control" Text='<%# Eval("Product_Weight") %>'></asp:TextBox>
                                            </EditItemTemplate>

                                            <ItemTemplate>
                                                <asp:Label ID="lblweight" runat="server" Text='<%# Eval("Product_Weight") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <EditItemTemplate>
                                                <asp:Button ID="Update" runat="server" CommandName="Update" CssClass="btn btn-primary" Text="Update" />
                                                <asp:Button ID="Cancel" runat="server" CommandName="Cancel" CssClass="btn btn-primary" Text="Cancel" />
                                            </EditItemTemplate>

                                            <ItemTemplate>
                                                <asp:Button ID="Edit" runat="server" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />
                                                <asp:Button ID="Delete" runat="server" CommandName="Delete" CssClass="btn btn-primary" Text="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
