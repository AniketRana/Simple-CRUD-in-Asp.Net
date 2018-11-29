<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   
   <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>


<script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">

<script type="text/javascript">
    $(document).ready(function () {
        $('#grvData').dataTable();
    }); 
</script> 

    <asp:Panel ID="pnlForm" Visible="false" runat="server">
        <center>
            <table height="400px">  
                <tr>
                    <td>
                        ID 
                    </td>
                    <td>
                        <asp:TextBox ID="txtid" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        City
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        MobileNo
                    </td>
                    <td>
                        <asp:TextBox ID="txtMob" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Education
                    </td>
                    <td>
                        <asp:TextBox ID="txtEducation" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Photo
                    </td>
                    <td>
                        <asp:FileUpload ID="filepic" runat="server" />
                        <asp:Label ID="lblFName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Gender
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtmale" Text="Male" Checked="true" GroupName="Gender" runat="server" />
                        <asp:RadioButton ID="rbtfemale" Text="Female" GroupName="Gender" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </center>
    </asp:Panel>
    <asp:Panel ID="pnlgrid" runat="server">
        <asp:LinkButton ID="btnadd" runat="server" OnClick="btnadd_Click">Add User</asp:LinkButton>
        
        <br>
        <div style="height: 500px; width: 100%; overflow: scroll; margin-top: 20px;">
            <asp:GridView ID="grvdata" runat="server" AutoGenerateColumns="False" class="display"
                Width="100%">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            ID</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Email</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            City</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            MobileNo</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Education</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEducation" runat="server" Text='<%# Eval("Education") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Photo</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgPic" Height="25px" Width="30px" Style="border-radius: 50%;" ImageUrl='<%# "img/"+ Eval ("Photo") %>'
                                runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Gender</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender").ToString() == "1" ? "Male" : "Female" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Update</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnupd" runat="server" Text="Update" CommandArgument='<%# Eval("ID") %>'
                                OnCommand="btnupd_Command" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Delete</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName='<%# Eval("ID") %>'
                                OnCommand="btnDelete_Command" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        

    </asp:Panel>
</asp:Content>
