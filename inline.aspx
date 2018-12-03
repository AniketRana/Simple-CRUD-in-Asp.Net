<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="inline.aspx.cs" Inherits="inline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div style="height: 500px; margin-top: 150px !important; width: 100%; overflow: scroll; margin-top: 20px;">
                <asp:GridView ID="grvdata" runat="server" AutoGenerateColumns="False" class="display"
                    Width="100%" OnRowCancelingEdit="grvdata_RowCancelingEdit" OnRowEditing="grvdata_RowEditing"
                    OnRowUpdating="grvdata_RowUpdating" OnRowDataBound="grvdata_RowDataBound">
                    <Columns>
                        
                        <asp:TemplateField HeaderText="ID">    
                            <HeaderTemplate>
                                <asp:TextBox ID="ntxtID" Enabled="false" runat="server"></asp:TextBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate >
                                <asp:TextBox ID="GtxtId" Enabled="false" Width="30px" Text='<%#Eval("ID") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <HeaderTemplate>
                                <asp:TextBox ID="ntxtName" runat="server"></asp:TextBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtName" Width="50px" Text='<%#Eval("Name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <HeaderTemplate>
                                <asp:TextBox ID="ntxtEmail" runat="server"></asp:TextBox> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtEmail" Width="150px" Text='<%#Eval("Email") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <HeaderTemplate>
                                <asp:TextBox ID="ntxtCity" runat="server"></asp:TextBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="GddlCity" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MobileNo">
                            <HeaderTemplate>
                                <asp:TextBox ID="ntxtMno" runat="server"></asp:TextBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtMno" Width="100px" Text='<%#Eval("MobileNo") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Education">
                            <HeaderTemplate>
                                    <asp:TextBox ID="ntxtEducation" runat="server"></asp:TextBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEducation" runat="server" Text='<%# Eval("Education") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtEducation" Width="100px" Text='<%#Eval("Education") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Img">
                            <HeaderTemplate>
                                <asp:FileUpload ID="nfileupd" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Image ID="imgPic" Height="25px" Width="30px" Style="border-radius: 50%;" ImageUrl='<%# "img/"+ Eval ("Photo") %>'
                                    runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="Gfileupd" runat="server" />
                                <asp:Image ID="GimgPic" Height="25px" Width="30px" Style="border-radius: 50%;" ImageUrl='<%# "img/"+ Eval ("Photo") %>'
                                    runat="server" />
                            </EditItemTemplate>
                        <//asp:TemplateField>

                        <asp:TemplateField HeaderText="Gender">
                            <HeaderTemplate>
                                <asp:RadioButton ID="nrbtMale" Checked="true" GroupName="Ngender" runat="server" />
                                <asp:RadioButton ID="nrbtfemale" GroupName="Ngender" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender").ToString() == "1" ? "Male" : "Female" %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>female</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <HeaderTemplate>
                                Edit
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnupd" runat="server" CommandName="Edit" Text="Edit Record" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Delete
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
