<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewSKU.aspx.cs" Inherits="WebApplication1.ViewSKU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel panel-heading">View SKU</div>
        <div class="panel panel-body">
            <div class="container">
                <div class="row form-group">
                    <div class="col-lg-2 text-right"></div>
                    <div class="col-lg-2 text-right">
                        <span>Search SKU Name<span style="color: red">*</span></span>
                    </div>
                    <div class="col-lg-3 ">
                        <asp:TextBox ID="txtsearchSKUName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-3">
                        <asp:Button ID="Search" runat="server" CssClass="btn btn-primary" Text="SEARCH" OnClick="Search_Click" />
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                         <asp:GridView ID="skugridview" runat="server" AutoGenerateColumns="False" HeaderStyle-BackColor="LightGray" CssClass="table table-hover" OnRowDeleting="skugridview_RowDeleting" OnRowUpdating="skugridview_RowUpdating" OnRowCancelingEdit="skugridview_RowCancelingEdit" OnRowEditing="skugridview_RowEditing">
                            <Columns>
                                
                                   <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                                       <ItemTemplate>
                                           <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                <asp:TemplateField HeaderText="SKU ID" Visible="false">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbleditid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </EditItemTemplate>
                                  
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SKU Name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txteditskuname" CssClass="form-control" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                       <asp:Label ID="lblSKUIDs"  runat="server" Visible="false" Text='<%# Eval("SKUID") %>'></asp:Label>
                                    </EditItemTemplate>
                                   
                                    <ItemTemplate>

                                        <asp:Label ID="lblskuname"  runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        <asp:Label ID="lblSKUID"  runat="server" Visible="false" Text='<%# Eval("SKUID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <EditItemTemplate>
                                        <asp:Button ID="Update" runat="server" CommandName="Update" CssClass="btn btn-primary" Text="Update" />
                                        <asp:Button ID="Cancel" runat="server" CommandName="Cancel" CssClass="btn btn-primary" Text="Cancel" />
                                    </EditItemTemplate>
                                    
                                    <ItemTemplate>
                                        <asp:Button ID="Edit" runat="server" CssClass="btn btn-primary" CommandName="Edit" Text="Edit" />
                                        <asp:Button ID="Delete" runat="server" CssClass="btn btn-primary" CommandName="Delete" Text="Delete" />
                                        <br />
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
