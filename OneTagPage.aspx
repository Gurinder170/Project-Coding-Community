<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OneTagPage.aspx.cs" Inherits="Coding_Community.OneTagPage" MaintainScrollPositionOnPostback="true" ErrorPage="ErrorPage.aspx"%>
<%@ Import Namespace="Coding_Community" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>

    <link rel="stylesheet"  href="styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .sidenav {
          height: 100%;
          width: 160px;
          position: fixed;
          z-index: 1;
          top: 0;
          left: 0;
          overflow-x: hidden;
          padding-top: 60px;
          background-color: #343A40;
          color: black!important;
        }

        .sidenav a {
          padding: 6px 8px 6px 16px;
          text-decoration: none;
          font-size: 25px;
          display: block;
          color: white !important;
        }

        .sidenav a:hover {
          color: lavender;
        }

        .main {
          margin-left: 160px; /* Same as the width of the sidenav */
          font-size: 28px; /* Increased text to enable scrolling */
          padding: 0px 10px;
        }

        @media screen and (max-height: 450px) {
          .sidenav {padding-top: 15px;}
          .sidenav a {font-size: 18px;}
        }
    </style>
    
    <script>

        function successalert() {
            swal("Before asking the question please Log In to our website.")
                .then((value) => {
                    window.location = "LoginPage.aspx";
                });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-dark webAppTheme fixed-top bg-dark">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active" id="home" >
                            <a class="nav-link" href="Title Page.aspx">Home</a>
                        </li>
                        <li class="nav-item active" id="login-register" >
                            <a class="nav-link" href="LoginPage.aspx">Login</a>
                        </li>
                        <li class="nav-item active" id="register-login" >
                            <a class="nav-link" href="Register Page.aspx">Register <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active" >
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
                        
                        <asp:Image ID="Image1" runat="server"  style="border-radius: 100%; height: 40px; width :40px;"/>

                        <div class="nav-item dropdown">

                            <%  string username = "";
                                if (Session["username"] != null)
                                {
                                    username = Session["username"].ToString();
                                }%>

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown currentUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;"><%=username%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: auto; right: 0;">
                                <a class="dropdown-item" href="userProfilePage.aspx"><span class="picon" style="margin-right: 10px;"><i class="fa fa-user"></i></span>My Account</a>
                                <a class="dropdown-item" href="#"><span class="picon" style="margin-right: 10px;"><i class="fa fa-info-circle"></i></span>About Us</a>
                                <!--<a class="dropdown-item" href="#" onclick="logoutFunction()"><span class="picon" style="margin-right: 10px;"><i class="fa fa-info-circle"></i></span>Logout</a>-->
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-item" OnClick="logout_click"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>
                            </div>
                        </div>

                    </div>
                </div>
            </nav>
        
        <!-- Main Middle Section including both side bars -->

        <section id="middle-section" style="margin-top:80px;">
            <div class="container-fluid row" style="padding-left: 0; padding-right: 0;margin-left:0;margin-right:0;">

                <div class="col-md-2"> 
                    <div class="sidenav" style="width: 230px; margin-top:35px; border-right:0.5px solid lightgray">
                        <ul style="list-style-type:none;">
                            <li><a href="#">Hot Tags</a></li>
                            <%for (int i= 0;i<5;i++)
                                {
                                    hotTagDataObject obj = (hotTagDataObject)onehotTagList[i];
                                    /*hotTagDataObject obj = (hotTagDataObject)onehotTagList[i];*/
                                    %>
                            <%string querystring = "OneTagPage.aspx?tagName=" + obj.tagName; %>
                           <li style="margin:5px;"> <button type="button" class="btn btn-dark" style="margin-left:30px; background-color: white; padding:0;">
                                <a style="font-size:17px; color:#343A40 !important" href="<%=querystring %>"><%=obj.tagName %><span style="margin-left:6px;" class="badge badge-dark"><%=obj.tagCount %></span></a>
                            </button>
                               </li>
                            <%} %>
                            
                        </ul>
                    </div>
                </div>

                <div id="heading1" class="col-md-8" style="padding-left: 10px; padding-right: 10px; min-height: 900px;">

                    <div class="panel-heading" style="margin-left:15px;">
                        <h1 style="text-align: left; margin-top: 20px;color:black!important">Questions Tagged[<%=Request.QueryString["tagName"] %>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button1" CssClass="btn btn-outline-dark" runat="server" OnClick="abc_click" Text="Ask a Question" style="float:right; margin-top:5px;" />
                        </h1>
                        <div class="row" style="margin-top: 25px; margin-left: 10px;">
                            <asp:Label ID="Label1" runat="server" Text="20,930,345" style="margin-right: 10px; padding-left: 15px;"></asp:Label>questions
                        </div>
                        <hr />
                    </div>

                    <div>

                        <%foreach (dataObject obj in finalquestionList)
                            { %>
                        <div class="row"style="background-color: lightgray; margin-left: 0; margin-right: 0; margin-top: 6px;">
                            <div class="col-md-1 text-center" style="margin-top: auto; margin-bottom: auto;">
                                <!--<asp:Label ID="Label3" runat="server" Text="5" style="width: 100%;"></asp:Label>-->
                                <p><%=obj.answers %></p>
                                answers
                            </div>

                            <div class="col-md-11" style="border-left: solid white 5px;">
                                <div class="row" style="" id="question-tile">
                                    <%string queryString = "questionPage.aspx?id="+obj.id; %>
                                    <div class="row" style="margin-top: 8px; margin-left: 15px; width: 100%; font-size: x-large;">
                                        <a href="<%=queryString %>"" style="text-decoration: none; color:black!important">
                                        <p class=""><%=obj.title %></p>
                                        </a>
                                    </div>
                                    <%  OneTagdataConnector connector = new OneTagdataConnector();
                                        ArrayList list = connector.tagArrayProvider(obj.id);%>

                                    <div class="row" style="margin-top: 5px; margin-left: 15px; margin-bottom: 10px; width: 100%;">
                                        <%   foreach (string tagname in list)
                                            {
                                        %>
                                        <div class="" style="margin: 3px;">
                                            <span class="badge badge-dark" style="padding-bottom: 7px; padding-top: 7px; padding-left: 7px; padding-right: 7px;"><%=tagname %></span>

                                        </div>
                                        <%} 
                                            %>
                                
                                 </div>

                                    <div class="container" style="display: flex; justify-content: flex-end">
                                        <div class="row" style="margin-right: 10px;">
                                            <p style="margin-right: 10px;">Asked By: </p>
                                            <p><%=obj.userName %></p>
                                            <!--<asp:Label ID="Label2" runat="server" Text="<%=obj.userName %>"></asp:Label>-->
                                        </div>
                                </div>

                                </div>
                            </div>
                        </div>

                        <%} %>
                    </div>

                </div>

                <div class="col-md-2" style="">
                    <div class="sidenav" style="width: 230px; left: auto; right: 0; background-color: white;">
                        
                    </div>
                </div>

            </div>
        </section>

        <!-- Site Footer -->

        <section class="siteFooter">
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
        document.querySelector('#currentUser').textContent = <%= Session["username"].ToString()%>;
        <%
        }

        %>




    </script>

</body>
</html>
