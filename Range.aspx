<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Range.aspx.cs" Inherits="Range" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <html>
    <head>

         
         
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js'></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/start/jquery-ui.css" />
         
        <link href="JqueryTags/src/jquery.tagsinput.css" rel="stylesheet" /> 
        <script src="JqueryTags/src/jquery.tagsinput.js"></script> 
            

    </head>  
         
    <body>
          
        <br>
        <asp:TextBox ID="txtFrom" pattern="^\d*(\.\d{0,2})?$" runat="server" Placeholder="From"></asp:TextBox>
        <asp:TextBox ID="txtTo" pattern="^\d*(\.\d{0,2})?$" runat="server" Placeholder="To"></asp:TextBox>
        <br>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img/add.png" Height="50px" Width="50px" OnClick="ImageButton1_Click" />
        <br>
        <br>
       <p> <asp:TextBox Height="50px" Width="200px" ID="txtResult" runat="server"></asp:TextBox></p>
        <br>
        <br>
        <script>
            script type = "text/javascript" >


                function onRemoveTag(tag) {
                    alert("Removed a tag: " + tag);
                }


            $(function () {

                $('#txtResult').tagsInput({ width: 'auto' });

            });

        </script>


    </body>
    </html>
</asp:Content>

