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

                <asp:GridView ID="grvdata" runat="server" AutoGenerateColumns="False" ShowHeader="true" ShowFooter="true" 
                    Width="100%" OnRowCancelingEdit="grvdata_RowCancelingEdit" OnRowEditing="grvdata_RowEditing"
                    OnRowUpdating="grvdata_RowUpdating" OnRowDataBound="grvdata_RowDataBound" OnRowCommand="grvdata_RowCommand" >
                    <Columns>
                        
                        <asp:TemplateField HeaderText="ID">    
                            <FooterTemplate>
                                <asp:TextBox style="float:left;" ID="ntxtID" Enabled="false" Width="30px" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate> 
                            <EditItemTemplate >
                                <asp:TextBox ID="GtxtId" Enabled="false" Width="30px" Text='<%#Eval("ID") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Name">
                            <FooterTemplate> 
                                <asp:TextBox style="float:left;" ID="ntxtName" Width="70px" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate> 
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtName" Width="50px" Text='<%#Eval("Name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <FooterTemplate>
                                <asp:TextBox ID="ntxtEmail" style="float:left;" Width="120px" runat="server"></asp:TextBox> 
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtEmail" Width="150px" Text='<%#Eval("Email") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <FooterTemplate>
                                <asp:DropDownList ID="NddlCity" style="float:left;" runat="server" Width="100px" AppendDataBoundItems="true" >
                                </asp:DropDownList>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="GddlCity" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MobileNo">
                            <FooterTemplate>
                                <asp:TextBox ID="ntxtMno" style="float:left;" Width="70px" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtMno" Width="100px" Text='<%#Eval("MobileNo") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Education">
                            <FooterTemplate>
                                    <asp:TextBox ID="ntxtEducation" style="float:left;" Width="70px" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEducation" runat="server" Text='<%# Eval("Education") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="GtxtEducation" Width="100px" Text='<%#Eval("Education") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Img">
                            <FooterTemplate>
                                <asp:FileUpload ID="nfileupd" runat="server" style="float:left;" Width="150px" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Image ID="imgPic" Height="25px" Width="30px" Style="border-radius: 50%;" ImageUrl='<%# "img/"+ Eval ("Photo") %>'
                                    runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblimg" runat="server" Text='<%# Eval("Photo") %>'></asp:Label>
                                <asp:FileUpload ID="Gfileupd" runat="server" />
                                <asp:Image ID="GimgPic" Height="25px" Width="30px" Style="border-radius: 50%;" ImageUrl='<%# "img/"+ Eval ("Photo") %>'
                                    runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Gender">
                            <FooterTemplate>
                                <%--<asp:RadioButton style="font-weight: initial;" ID="nrbtMale" Checked="true" Text="Male" GroupName="Ngender" runat="server" />
                                <asp:RadioButton style="font-weight: initial;" ID="nrbtfemale" Text="Female" GroupName="Ngender" runat="server" />--%>
                                 <asp:RadioButtonList ID="rbtGender" style="font-weight: initial;" runat="server">
                                    <asp:ListItem Selected="True">Male</asp:ListItem>
                                    <asp:ListItem>female</asp:ListItem>
                                </asp:RadioButtonList>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender").ToString() == "1" ? "Male" : "Female" %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <FooterTemplate>
                                    <asp:Button ID="btnAdd" CommandName="AddNew" runat="server" Text="Add New" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnupd" runat="server" CommandName="Edit" Text="Edit" />
                                <asp:Button ID="btnDelete" CommandArgument='<%# Eval("ID") %>' OnCommand="btnDelete_Command" runat="server" Text="Delete"  />
                            </ItemTemplate>
                            <EditItemTemplate>
                                
                                <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
