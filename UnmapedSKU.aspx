<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="UnmapedSKU.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Script/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <link href="js/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        function edValueKeyPress() {
            var edValue = document.getElementById("txtProductN    ame1");
            var s = edValue.value;

            //var lblValue = document.getElementById("lblValue");
            //lblValue.innerText = "The text box contains: " + s;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            SearchText1();

        });
        function SearchText1() {
            debugger;
            $(".editpname").autocomplete(
                {

                    source: function (request, response) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "UnmapedSKU.aspx/GetName",
                            data: "{'Name':'" + $('.editpname').val() + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("No Match");

                            }
                        });
                    }
                });
        }
    </script>

     <script src="scripts/jquery-3.3.1.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {

             $("#refresh").click(function () {
                 //    $("#countnumber").load(viewers(),branches(),Chefs(),Years());
                 $("#txtProductName1").load(SearchText1());
                 return false;
             });
         });

        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>--%>
    <div class="panel panel-body">
        <div class="row form-group">
            <div class="col-lg-2 text-right"></div>
            <div class="col-lg-3 text-right">
                <span>Search UnmapedSKU Name<span style="color: red">*</span></span>
            </div>
            <div class="col-lg-3 ">
                <asp:TextBox ID="txtsearchunmapedSKUName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:Button ID="Search" runat="server" CssClass="btn btn-primary" Text="SEARCH" OnClick="Search_Click" />
            </div>
        </div>
         <div class="row form-group">
            <div class="col-lg-9"></div>           
            <div class="col-lg-3 text-center">
                <asp:Button ID="btnsaveall" runat="server" class="col-lg-5" CssClass=" btn col-lg-10  btn-success"  Text="Save All" OnClick="btnsaveall_Click" />
            </div>
        </div>
         <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        <div class="row form-group">
            <div class="col-lg-12">
                <asp:Label ID="lblproductid" runat="server" Text="" Visible="true"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowCommand="GridView1_RowCommand" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                            </ItemTemplate>

                            <ItemStyle Width="100px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SKU id" Visible="false">
                            <EditItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Labeid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    <asp:Label ID="Labeids" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    <asp:Label ID="lblSKUID1" runat="server" Text='<%# Eval("SKUID") %>' Visible="false"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SKU Name">
                            <EditItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    <asp:Label ID="lblSKUID" runat="server" Text='<%# Eval("SKUID") %>' Visible="false"></asp:Label>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                            <EditItemTemplate>
                                <%--<div class="text-center">
                                    <asp:TextBox ID="txtProductName" CssClass="editpname" Class="form-control" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged" runat="server"></asp:TextBox>


                                </div>--%>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <div id="refresh" >
                                <asp:TextBox ID="txtProductName1" runat="server" AutoPostBack="true" Class="form-control" CssClass="editpname" OnTextChanged="txtProductName_TextChanged"></asp:TextBox>
                          </div>
                                    </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost">
                            <EditItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Label4" runat="server"></asp:Label>
                                </div>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Weight">
                            <EditItemTemplate>
                                <div class="text-center">
                                    <asp:Label ID="Label5" runat="server"></asp:Label>
                                </div>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                    </Columns>
                </asp:GridView>
            </div>
        </div>

           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
