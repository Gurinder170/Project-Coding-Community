<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AskQuestionPage.aspx.cs" ErrorPage="~/ErrorPage.aspx" ValidateRequest="false" Inherits="Coding_Community.AskQuestionPage" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Ask Question</title>
    
        <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet"/>
        <!-- multi select css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" />
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet"/>

        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>
    
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link rel="stylesheet" href="styles.css" />

        <script>
            function initializeTinyMCE() {
                tinymce.init({ selector: 'textarea', width: 700, height: 400 });
            }

            function afterQuesSubmit() {
                swal("Your Question has been posted successfully.")
                    .then((value) => {
                        window.location = "Title Page.aspx";
                    });
            }

            function afterQuesUpdate() {
                swal("Your Question has been Updated successfully.")
                    .then((value) => {
                        window.location = "Title Page.aspx";
                    });
            }
        </script>


    </head>
    <body style="">

        <form id="form1" runat="server">
    
            <!-- Navbar -->

            <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #343A40;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Title Page.aspx">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                            </li>
                        </ul>
                        <!-- <div class="custom-control-inline">
                            <input class="form-control mr-sm-2 my-2 my-lg-0" type="search" placeholder="Search" aria-label="Search" />
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </div> -->
                    
                        <div class="custom-control-inline" id="user-profile">
                        
                        
                           <% if (Session["username"] != null)
                                    {
                                        Image1.ImageUrl = "~/UploadImages/" + Session["image"].ToString();
                                    }%>
                        
                            <asp:Image ID="Image1" runat="server"  style="border-radius: 100%; height: 40px; width :40px;"/>

                            <div class="nav-item dropdown">

                                <%  string username = "";
                                    if (Session["username"] != null)
                                    {
                                        username = Session["username"].ToString();
                                    }%>

                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown currentUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;"><%=username %></a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: auto; right: 0;">
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="dropdown-item" OnClick="toUserDashBoard"><span class="picon" style="margin-right: 10px;"><i class="fa fa-user-circle"></i></span>My Account</asp:LinkButton>
                         
                                    <!--<a class="dropdown-item" href="#" onclick="logoutFunction()"><span class="picon" style="margin-right: 10px;"><i class="fa fa-info-circle"></i></span>Logout</a>-->
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="logout_click" CssClass="dropdown-item"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>
                                
                                </div>
                            </div>

                        </div>
                    </div>
                </nav>
      
            <section id="middle-section" style="margin-top: 60px;">
                <div class="container row" style="padding-top: 30px; padding-bottom: 60px; margin-left: auto; margin-right: auto;">

                    <div style="width: 35%; margin-top: 30px;" class="col-md-6">
                        <h1 style="font-family: 'Times New Roman', Times, serif;">Ask a public question</h1>
                        <div style="margin-top: 30px; margin-left: 10px;">
                            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red">*Please <a href="LoginPage.aspx"><u>Login</u></a> before Asking any question.</asp:Label>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <img src="images/answerColor.png" style="height: 180px; width: 210px;" />
                    </div>

                    <div class="col-md-3">
                        <img src="images/questionBulb.png" style="height: 70px; width: 70px;" />
                    </div>

                </div>

                <div class="container row" style="margin-left: auto; margin-right: auto;">

                    <div class="col-md-8" style="border: 1px solid rgba(0,0,0,.2); border-radius: 1.1rem; outline: 0; padding: 20px;">

                        <h3 style="font-weight: bold; font-size: large;">Title</h3>
                        <h6 style="color: gray; font-weight: lighter">Be specific and imagine you’re asking a question to another person</h6>
                        <asp:TextBox ID="tbTitle" runat="server" Class="form-control"></asp:TextBox>

                        <h3 style="font-weight: bold; font-size: large; margin-top: 30px;">Body</h3>
                        <h6 style="color: gray; font-weight: lighter">Include all the information someone would need to answer your question</h6>
                        <textarea class="tinymce form-control" id="qbody" runat="server" style="width: inherit;"></textarea>

                        <h3 style="font-weight: bold; font-size: large; margin-top: 30px;">Tags</h3>
                        <h6 style="color: gray; font-weight: lighter">Add up to 5 tags to describe what your question is about</h6>
                        <!-- <asp:TextBox ID="tbTags" runat="server" Class="form-control"></asp:TextBox>-->
                        <div class="multi_select_box" style="margin-left: 0; margin-right: 0; margin-top: 20px; margin-bottom: 20px; width: 97.5%;">
                            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" class="multi_select w-100" Style="width: inherit;"></asp:ListBox>
                            <asp:Label ID="tagsMust" runat="server" Text="*Select Atleast One Tag" Visible="false" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:Button ID="btReview" runat="server" Text="Post Question" Class="btn btn-outline-primary" Style="margin-top: 15px; float: right;" OnClick="btReview_Click" />

                    </div>

                    <div class="col-md-4" style="padding: 10px; padding-left: 25px;">

                        <div class="accordion md-accordion accordion-3 z-depth-1-half" id="accordionEx194" role="tablist" aria-multiselectable="true">
                            <div style="padding: 15px;">
                                <p style="margin-bottom: 0; font-weight: bold; color: black;">Step 1: Draft your Question.</p>
                            </div>
                            <hr style="margin-top: 0; margin-bottom: 0;" />
                            <div class="container" style="padding-top: 5px;">
                                <p>
                                    The community is here to help you with specific coding, algorithm, or language problems. Avoid asking opinion-based questions.
                                </p>
                            </div>

                            <!--Accordion wrapper-->
                            <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingOne1">
                                        <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                                            <h5 class="mb-0">1. Summarize the Problem<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>                                </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                        data-parent="#accordionEx">
                                        <div class="card-body">
                                            <ul>
                                                <li>Include details about your goal
                                                </li>
                                                <li>Describe expected and actual results
                                                </li>
                                                <li>Include any error messages
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <!-- Accordion card -->

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingTwo2">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2"
                                            aria-expanded="false" aria-controls="collapseTwo2">
                                            <h5 class="mb-0">2. Describe what you've tried <i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2"
                                        data-parent="#accordionEx">
                                        <div class="card-body">
                                            Show what you’ve tried and tell us what you found (on this site or elsewhere) and why it didn’t meet your needs. You can get better answers when you provide research.
                                        </div>
                                    </div>

                                </div>
                                <!-- Accordion card -->

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingThree3">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree3"
                                            aria-expanded="false" aria-controls="collapseThree3">
                                            <h5 class="mb-0">3. Show some code <i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3"
                                        data-parent="#accordionEx">
                                        <div class="card-body">
                                            When appropriate, share the minimum amount of code others need to reproduce your problem (also called a minimum, reproducible example)
                                        </div>
                                    </div>

                                </div>
                                <!-- Accordion card -->

                            </div>
                            <!-- Accordion wrapper -->
                        </div>

                    </div>

                </div>

                <footer style="margin-top: 25px; line-height: 2; text-align: center; padding-bottom: 40px; padding-top: 40px;">
                    <div class="container-fluid">
                        <span class="social-media-icons fab fa-twitter"></span>
                        <span class="social-media-icons fab fa-facebook"></span>
                        <span class="social-media-icons fab fa-instagram"></span>
                        <span class="social-media-icons fas fa-envelope"></span>
                        <p id="copyright">© Copyright 2020 Coding Community - All Rights Reserved</p>
                    </div>

                </footer>
            </section>

        </form>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous"></script>
        <script src="node.js" charset="utf-8"></script>
        <script>

            <%
            if (Session["username"] == null)
            {
                %>
            document.getElementById('user-profile').style.display = 'none';

            <%
            }
            if (Session["username"] != null)
            {
                %>
            document.getElementById('user-profile').style.display = 'inline-flex';
        
            <%
            }
            %>

        </script>

        

    </body>
</html>
