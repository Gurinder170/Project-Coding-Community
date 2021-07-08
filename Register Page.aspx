<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register Page.aspx.cs" Inherits="Coding_Community.Register_Page"MaintainScrollPositionOnPostback="true" ErrorPage="~/ErrorPage.aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>

    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
    

    <link rel ="stylesheet" href ="styles.css"/>
    <script>

        function successalert() {
            swal("Registration Successfull!!!..We are redirecting you to Login Page.")
                .then((value) => {
                    window.location = "LoginPage.aspx";
                });
        }

    </script>

</head>
<body style="background-image: url(images/registerPageImg.jpg); background-size: cover; background-position: center center;">
    <form id="form1" runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Title Page.aspx">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="LoginPage.aspx">Login</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="AboutUs.aspx">About Us</a>
                        </li>
                        <!--<li class="nav-item active">
                            <a class="nav-link" href="register page.aspx">register <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbardropdown">
                          <a class="dropdown-item" href="#">action</a>
                          <a class="dropdown-item" href="#">another action</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">something else here</a>
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">disabled</a>
                      </li> -->
                    </ul>
                </div>
            </nav>
       
        <!-- Body Elements -->
        <div class="container-fluid">
            <div class="row" style="padding-left: 50px; margin-top: 80px;">

            <div id="myTable"  class="col-lg-5" style="margin-top: 30px; border: 1px solid rgba(0,0,0,.2); border-radius: 1.1rem; background-color: aliceblue; margin-bottom: 50px;">

                <!-- SignUp heading -->

                <div>
                    <h1 style="color: black !important; padding-bottom: 10px; font-family: Tahoma;">Sign Up</h1>
                    <h3 style="padding-bottom: 30px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; color: darkgray;">Please fill up the following information to create account</h3>
                </div>

                <table style="width: 100%;">
                    <tr>
                        <td class="table_data" style="width: 250px;">
                            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;">
                            <asp:TextBox ID="tbUserName" runat="server" Class="form-control" placeholder="Usename"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Username" ControlToValidate="tbUserName" Display="Dynamic" EnableClientScript="False" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="userTaken" runat="server" Text="*Username already taken!!" Visible="false" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td class="table_data" style="width: 250px;">
                            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;">
                            <asp:TextBox ID="tbFullName" runat="server" Class="form-control" placeholder="Name"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter your full name" ControlToValidate="tbFullName" Display="Dynamic" EnableClientScript="False" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="table_data" style="width: 250px;">
                            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;">
                            <asp:TextBox ID="tbEmail" runat="server" Class="form-control" placeholder="Email"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter your Email Id" ControlToValidate="tbFullName" Display="Dynamic" EnableClientScript="False" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" Display="Dynamic" EnableClientScript="False" ErrorMessage="Enter a valid email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Enter a valid email</asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:Label ID="emailTaken" runat="server" Text="*E-mail already taken!!" Visible="false" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td class="table_data" style="width: 250px;">
                            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;">
                            <asp:TextBox ID="tbPassword" runat="server" Class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Make a password for your account" ControlToValidate="tbPassword" Display="Dynamic" EnableClientScript="False" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="table_data" style="width: 250px;">
                            <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;">
                            <asp:TextBox ID="tbConfPassword" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confrim your password" ControlToValidate="tbConfPassword" Display="Dynamic" EnableClientScript="False" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbConfPassword" Display="Dynamic" EnableClientScript="False" ErrorMessage="*Password do not match" ForeColor="Red" SetFocusOnError="True">*Password do not match</asp:CompareValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="signUpButton">
                            <asp:Button ID="Button2" runat="server" class="btn btn-outline-dark" Text="Sign Up" OnClick="SendOTP" /> 
                        </td>
                    </tr>
                </table>

            </div>


            <!-- Modal -->

            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirm OTP</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Enter OTP sent to your email 
                            <asp:TextBox ID="TextBox1" runat="server" Style="margin-top: 20px;"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="msgotp" runat="server" Text="*You Entered Wrong OTP." ForeColor="Red" Visible="false" Style="display: flex; justify-content: center;"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button1" runat="server" class="btn btn-outline-dark" Text="Confirm otp" OnClick="btSignup_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- <div id="title_image"  class="col-lg-6">

                 <img src="images/title_image.png" alt="main_image" style="width: 100%;"/>

            </div> -->

        </div>
        </div>
       

        <footer id="footer" style="background: none;">

            <div class="container-fluid">
                <span class="social-media-icons fab fa-twitter" style="color: white !important;"></span>
                <span class="social-media-icons fab fa-facebook" style="color: white !important;"></span>
                <span class="social-media-icons fab fa-instagram" style="color: white !important;"></span>
                <span class="social-media-icons fas fa-envelope" style="color: white !important;"></span>
                <p id="copyright">© Copyright 2020 Coding Community</p>
            </div>

        </footer>

        <script type="text/javascript">
            function openModal() {
                $('#exampleModalCenter').modal('show');

            };
        </script>

    
    </form>
</body>
</html>
