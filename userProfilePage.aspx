<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfilePage.aspx.cs" Inherits="Coding_Community.userProfilePage" MaintainScrollPositionOnPostback="true" ErrorPage="~/ErrorPage.aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="profilePageCSS.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" />
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet" />



    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    <style>
        *, *:after, *:before {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            margin: 0;
            min-height: 100vh;
        }

        .multi_select_box {
            width: 400px;
            margin: 80px auto;
        }

            .multi_select_box select {
                width: 100%;
            }

            .multi_select_box button {
                background-color: darkblue;
                color: #ffffff;
                padding: 15px 25px;
            }
    </style>



    <script>

        function successalert() {
            swal("Updated Successfully!!");
        }


    </script>



</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" Style="width: 160px; height: 40px;" Enabled="false" />
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Title Page.aspx">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <!-- <div class="custom-control-inline">
                        <input class="form-control mr-sm-2 my-2 my-lg-0" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div> -->

                <div class="custom-control-inline" id="user-profile">

                    <%  
                        if (Session["username"] != null)
                        {

                            Image1.ImageUrl = "~/UploadImages/" + Session["image"].ToString();
                        }%>

                    <asp:Image ID="Image1" runat="server" Style="border-radius: 100%; height: 40px; width: 40px;" />


                    <div class="nav-item dropdown">

                        <%  string username = "";
                            if (Session["username"] != null)
                            {
                                username = Session["username"].ToString();
                            }%>

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown currentUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;"><%=username %></a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: auto; right: 0;">
                            <a class="dropdown-item" href="User dashboard.aspx"><span class="picon" style="margin-right: 10px;"><i class="fa fa-cog"></i></span>Settings</a>

                            <!--<a class="dropdown-item" href="#" onclick="logoutFunction()"><span class="picon" style="margin-right: 10px;"><i class="fa fa-info-circle"></i></span>Logout</a>-->

                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-item" OnClick="logout_click"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>
                        </div>
                    </div>

                </div>
            </div>
        </nav>

        <!-- User Profile Form -->

        <section class="middle-section" style="margin-top: 120px;">

            <div class="container-fluid" style="/*width: 1000px; */ margin-top: 4.2rem;">

                <div class="row">

                    <div class="col-md-4" style="padding-left: 100px; padding-right: 100px; border-right: 2px solid lightgray;">

                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h1 style="font-family: Cambria;">Profile</h1>
                            </div>
                        </div>

                        <asp:Button ID="Button4" runat="server" Text="Button" Style="display: none;" OnClick="imageload" />

                        <div class="row" style="margin-top: 50px;">

                            <img id="imgFileUpload" alt="" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" style="width: 210px; height: 210px; border-radius: 50%; cursor: pointer; margin-left: auto; margin-right: auto;" runat="server" />

                        </div>

                        <div class="row">
                            <asp:Label ID="lblFullNameProfile" runat="server" Text="Dheeraj Kapoor" Style="margin-top: 10px; margin-left: auto; margin-right: auto;"></asp:Label>
                        </div>

                        <div class="row" style="margin-top: 50px;">
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lblNoOfQuestions" runat="server" Text="86" Style="font-weight: 500; font-size: larger;"></asp:Label>
                                <h6 style="font-weight: 500; color: grey;">Questions</h6>
                            </div>

                            <div class="col-md-4 text-center" style="border-right: 2px solid lightgray; border-left: 2px solid lightgray;">
                                <asp:Label ID="lblNoOfAnswers" runat="server" Text="1.5K" Style="font-weight: 500; font-size: larger;"></asp:Label>
                                <h6 style="font-weight: 500; color: grey;">Answers</h6>
                            </div>

                            <div class="col-md-4 text-center">
                                <asp:Label ID="lblNoOfFriends" runat="server" Text="4.5K" Style="font-weight: 500; font-size: larger;"></asp:Label>
                                <h6 style="font-weight: 500; color: grey;">Friends</h6>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 70px;">
                            <h5 style="margin-left: auto; margin-right: auto; font-weight: 500">BIOGRAPHY</h5>
                        </div>

                        <div class="row" style="margin-top: 20px;">
                            <div class="col-md-12 text-center">
                                <h6 style="font-weight: 400; color: grey;">
                                    <asp:Label ID="Lbbio" runat="server" Text="A computer programmer, sometimes called a software developer, a programmer or more recently a coder (especially in more informal contexts), is a person who creates computer software."></asp:Label></h6>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-8" style="padding-left: 100px; padding-right: 100px;">

                        <div class="row">
                            <div class="col-md-12">
                                <h3>Basic Info</h3>
                            </div>
                            <hr style="border: 1px solid lightgray; width: 100%; margin-left: 17px; margin-right: 17px;" />
                        </div>

                        <div class="row headings">
                            <div class="col-md-6">
                                <asp:Label ID="lblProfileName" runat="server" Text="Name" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileName" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblProfileDOB" runat="server" Text="Date Of Birth" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileDOB" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row headings">
                            <div class="col-md-6">
                                <asp:Label ID="lblProfileMobile" runat="server" Text="Mobile No" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileMobile" runat="server" Class="form-control" TextMode="Phone"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblProfileEmail" runat="server" Text="Email" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileEmail" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row headings">
                            <div class="col-md-4">
                                <asp:Label ID="lblProfileState" runat="server" Text="State" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileState" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblProfileCity" runat="server" Text="City" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileCity" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblProfilePinCode" runat="server" Text="Pincode" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfilePinCode" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 50px;">
                            <div class="col-md-12">
                                <h3>Social Profile Links</h3>
                            </div>
                            <hr style="border: 1px solid lightgray; width: 100%; margin-left: 17px; margin-right: 17px;" />
                        </div>

                        <div class="row headings">
                            <div class="col-md-12">
                                <asp:Label ID="lblProfileGithub" runat="server" Text="Github Profile Url" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileGithub" runat="server" Class="form-control" TextMode="Url"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row headings">
                            <div class="col-md-12">
                                <asp:Label ID="lblProfileLinkedIn" runat="server" Text="LinkedIn Profile Link" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileLinkedIn" runat="server" Class="form-control" TextMode="Url"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 50px;">
                            <div class="col-md-12">
                                <h3>Highest Educational Qualification</h3>
                            </div>
                            <hr style="border: 1px solid lightgray; width: 100%; margin-left: 17px; margin-right: 17px;" />
                        </div>

                        <div class="row headings">
                            <div class="col-md-12">
                                <asp:Label ID="lblProfileInstitution" runat="server" Text="Institution" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileInstitution" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row headings">
                            <div class="col-md-6">
                                <asp:Label ID="lblProfileYearOfPassing" runat="server" Text="Year Of Passing" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileYearOfPassing" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblProfileQualification" runat="server" Text="Qualification" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileQualification" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 50px;">
                            <div class="col-md-12">
                                <h3>About Me</h3>
                            </div>
                            <hr style="border: 1px solid lightgray; width: 100%; margin-left: 17px; margin-right: 17px;" />

                        </div>


                        <asp:Label ID="Label2" runat="server" Text="Skills" CssClass="labelHeadings"></asp:Label>
                        <div class="multi_select_box"
                            style="margin-left: 0; margin-right: 0; margin-top: 20px; margin-bottom: 20px; width: 97.5%;">
                            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" class="multi_select w-100" Style="width: inherit;"></asp:ListBox>
                        </div>

                        <div class="row headings">
                            <div class="col-md-12">
                                <asp:Label ID="lblProfileBio" runat="server" Text="Short Bio to be used as Contributor's profile" class="labelHeadings"></asp:Label>
                                <asp:TextBox ID="tbProfileBio" runat="server" Class="form-control" TextMode="MultiLine" Style="height: 150px;"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 30px;">
                            <div class="col-md-3">
                                <asp:Button class="btn btn-outline-dark btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                            </div>
                        </div>

                    </div>

                    <asp:Panel ID="panCrop" CssClass="card-img-overlay" runat="server" Visible="false">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3>Profile Picture</h3>
                                    <asp:Button ID="Button5" runat="server" Text="X" Style="border: none; background-color: white; font-weight: 900; font-size: 22px;" OnClick="imageunload" />
                                </div>
                                <div class="modal-body">

                                    <table>
                                        <tr>

                                            <td>Select Image File : 
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="FU1" runat="server" />
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Image ID="imgUpload" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnUpload" runat="server" Text="Crop" class="btn btn-outline-primary" OnClick="btnUpload_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button2" runat="server" Text="Save" CssClass="btn btn-outline-primary" OnClick="cropclick" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%-- Hidden field for store cror area --%>
                                                <asp:HiddenField ID="X" runat="server" />
                                                <asp:HiddenField ID="Y" runat="server" />
                                                <asp:HiddenField ID="W" runat="server" />
                                                <asp:HiddenField ID="H" runat="server" />
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>

                    </asp:Panel>

                </div>

            </div>

            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Deactivate Account</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Enter your Password to deactivate the account..
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                            <asp:Button ID="Button3" runat="server" Text="Delete my Account" CssClass="btn btn-outline-primary" OnClick="tester_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <section class="siteFooter">
            <footer class="white-section" style="margin-top: 25px; line-height: 2; text-align: center; padding-bottom: 40px; padding-top: 40px;">
                <div class="container-fluid">
                    <span class="social-media-icons fab fa-twitter" style="color: black !important;"></span>
                    <span class="social-media-icons fab fa-facebook" style="color: black !important;"></span>
                    <span class="social-media-icons fab fa-instagram" style="color: black !important;"></span>
                    <span class="social-media-icons fas fa-envelope" style="color: black !important;"></span>
                    <p id="copyright">© Copyright 2020 Coding Community - All Rights Reserved</p>
                </div>
            </footer>
        </section>

    </form>

    <script>
        <%    

        if (Session["username"] == null)
        {
        %>
        document.getElementById('user-profile').style.display = 'none';
        document.querySelector('#login-register').style.display = 'inline-flex';
        document.querySelector('#register-login').style.display = 'inline-flex';

        <%
        }
        if (Session["username"] != null)
        {
            %>
        document.getElementById('user-profile').style.display = 'inline-flex';
        document.querySelector('#login-register').style.display = 'none';
        document.querySelector('#register-login').style.display = 'none';
        <%
        }

        %>

        var logoutFunction = function () {
            console.log("yes i m here...");
        }

    </script>

    <link href="css/jquery.Jcrop.css" rel="stylesheet" />
    <script src="jquery.min.js"></script>
    <script src="jquery.Jcrop.js"></script>

    <script type="text/javascript">
        var j1 = $.noConflict(true);
    </script>

    <script>
        j1(document).ready(function () {
            j1('#<%=imgUpload.ClientID%>').Jcrop({
                 boxWidth: 450,
                 boxHeight: 450,
                 aspectRatio: 1,
                 onSelect: SelectCropArea
             });
         });
        function SelectCropArea(c) {
            j1('#<%=X.ClientID%>').val(parseInt(c.x));
             j1('#<%=Y.ClientID%>').val(parseInt(c.y));
             j1('#<%=W.ClientID%>').val(parseInt(c.w));
             j1('#<%=H.ClientID%>').val(parseInt(c.h));
        }
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous"></script>
    
    <script>
        $(document).ready(function () {
            $('.multi_select').selectpicker();
        });
        $("#imgFileUpload").click(function () {
            $('#Button4').click();


        });
    </script>

</body>
</html>
