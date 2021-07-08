<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User dashboard.aspx.cs" Inherits="Coding_Community.User_dashboard" MaintainScrollPositionOnPostback="true" ErrorPage="~/ErrorPage.aspx"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>USER DASHBOARD</title>


    <link rel="stylesheet" href="hover.css" />
    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <link rel="stylesheet" href="userdashboardCSS.css" />

    <link rel="stylesheet" href="styles.css" />

    <style type="text/css">
        .auto-style1 {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            padding-left: 0;
            margin-bottom: 0;
            border-radius: .25rem;
            height: 186px;
        }


        .waheguru {
            background-color: #343A40;
            color: white !important;
        }


        .sidenav {
            height: 100%;
            width: 230px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            line-height: 65px;
            font-size: 20px;
            overflow-x: hidden;
            padding-top: 60px;
            display: block;
            box-sizing: border-box;
            border-bottom: 1px solid black;
            border-top: 1px solid rgba(255,255,255,.1);
            transition: .4s;
        }

            .sidenav ul a {
                padding-left: 50px;
                text-decoration: none;
                font-size: 20px;
                display: block;
                color: #343A40;
                font-family: 'Segoe UI';
            }

        .edit-icon:hover {
            color: #4fc3f7 !important;
        }

        .file-upload {
            display: inline-block;
            overflow: hidden;
            text-align: center;
            vertical-align: middle;
            font-family: Arial;
            border: 1px solid #124d77;
            background: #007dc1;
            color: #fff;
            border-radius: 6px;
            -moz-border-radius: 6px;
            cursor: pointer;
            text-shadow: #000 1px 1px 2px;
            -webkit-border-radius: 6px;
        }

            .file-upload:hover {
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0061a7), color-stop(1, #007dc1));
                background: -moz-linear-gradient(top, #0061a7 5%, #007dc1 100%);
                background: -webkit-linear-gradient(top, #0061a7 5%, #007dc1 100%);
                background: -o-linear-gradient(top, #0061a7 5%, #007dc1 100%);
                background: -ms-linear-gradient(top, #0061a7 5%, #007dc1 100%);
                background: linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0061a7', endColorstr='#007dc1',GradientType=0);
                background-color: #0061a7;
            }

        /* The button size */
        .file-upload {
            height: 30px;
        }

            .file-upload, .file-upload span {
                width: 330px;
            }

                .file-upload input {
                    top: 0;
                    left: 0;
                    margin: 0;
                    font-size: 11px;
                    font-weight: bold;
                    /* Loses tab index in webkit if width is set to 0 */
                    opacity: 0;
                    filter: alpha(opacity=0);
                }

                .file-upload strong {
                    font: normal 12px Tahoma,sans-serif;
                    text-align: center;
                    vertical-align: middle;
                }

                .file-upload span {
                    top: 0;
                    left: 0;
                    display: inline-block;
                    /* Adjust button text vertical alignment */
                    padding-top: 5px;
                }
    </style>
    <script>
        function yoyo() {
            alert("you enterd wrong Password.");
        }
        function successalert() {
            swal("Image Added Successfully ...");
        }
    </script>

</head>
<body style="padding-top: 0;">
    <form id="form1" runat="server">
       
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" >
              
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Title Page.aspx">Home</a>
                        </li>
                        
                        <li class="nav-item" >
                            <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <!-- <div class="custom-control-inline">
                        <input class="form-control mr-sm-2 my-2 my-lg-0" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div> -->
                    
                    <div class="custom-control-inline" id="user-profile">
                        
                        <%  
                            if (Session["username"] != null && Session["uname"].ToString()=="user")
                            {
                                Image2.ImageUrl = "~/UploadImages/" + Session["image"].ToString();
                            }
                            else
                            {
                                Image2.ImageUrl = "https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg";

                               
                            }%>
                        
                        <asp:Image ID="Image2" runat="server"  style="border-radius: 100%; height: 40px; width :40px;"/>

                        <div class="nav-item dropdown">

                            <%  string username = "";
                                if (Session["username"] != null)
                                {
                                    username = Session["username"].ToString();
                                }%>

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown currentUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;"><%=username%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: auto; right: 0;">
                               
                                 <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-item" OnClick="logout_click"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>
                               </div>
                        </div>
                        
                    </div>
                </div>
              
            </nav>
    
     
        <section id="middle-section" style="margin-top: 80px;">
            <div class="container-fluid row" style="padding-left: 0; padding-right: 0; margin-left: 0; margin-right: 0;">
                <div class="col-md-2">
                    <div class="sidenav" style="width: 230px; border-right: solid black 1px;">
                        <ul>
                            <asp:Panel ID="Panel1" runat="server">
                                <li id="Pr"><a id="#heading1" href="#"><i class="fa fa-user"></i> Profile</a></li>
                                <li><a id="#heading2" href="#"><i class="fa fa-question-circle"></i> Questions</a></li>

                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                                <li><a id="#heading4" href="#"><i class="fa fa-user-cog"></i> Settings</a></li>
                                <li><a id="#heading5" href="#"><i class="fa fa-envelope"></i> Report</a></li>
                            </asp:Panel>
                            
                        </ul>
                    </div>
                </div>

                <div class="col-md-8">
                    <asp:Panel ID="Panel3" runat="server" >
                        <div id="heading1" class="col-md-12 row " style="min-height: 900px;">

                            <div class="container-fluid">

                                <div class="row panel-heading" style="width: 100%;">
                                    <h2 style="margin-left: auto; margin-right: auto; font-weight: bolder;">User Profile</h2>
                                </div>

                                <div class="row" style="width: 100%; margin-top: 30px;">
                                    <div class="col-md-4" style="margin-left: 45px;">
                                        <!-- image click-->

                                        <img id="imgFileUpload" alt="" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" style="width: 210px; height: 210px; border-radius: 50%; cursor: pointer; margin-left: 43px; margin-right: auto;" runat="server" />

                                        <asp:Button ID="Button4" runat="server" Text="Button" class="card-img-overlay" Style="display: none" OnClick="SendToUserProfile" />
                                        <div class="row" style="margin-top: 20px;">
                                            <h3 style="margin-left: auto; margin-right: auto;">BIO</h3>
                                        </div>
                                        <div class="row text-center" style="margin-top: 20px;">
                                            <asp:Label ID="tbbio" runat="server" Text="Bio"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="col-md-7">
                                        <div class="container-fluid details">
                                            <div class="row" style="margin-bottom: 13px;">
                                                <h4 style="font-family: 'Segoe UI'; font-weight: bold;">
                                                    <asp:Label ID="Lbname" runat="server" Text="Name"></asp:Label>
                                                </h4>
                                            </div>

                                            <div class="row" style="margin-bottom: 13px;">
                                                <div class="col-md-4">
                                                    <asp:Label ID="Lbemail" runat="server" Text="Email: " Style="font-weight: 500; font-size: larger;"></asp:Label>
                                                </div>
                                                <div class="col-md-8">
                                                    <asp:Label ID="tbemail" runat="server" Text="dkdasuya7@gmail.com"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 13px;">
                                                <div class="col-md-4">
                                                    <asp:Label ID="Lbdob" runat="server" Text="Date of Birth: " Style="font-weight: 500; font-size: larger;"></asp:Label>
                                                </div>
                                                <div class="col-md-8">
                                                    <asp:Label ID="tbdob" runat="server" Text="07/07/2020"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 13px;">
                                                <div class="col-md-4">
                                                    <asp:Label ID="LbDateOfJoin" runat="server" Text="Date Of Joining: " Style="font-weight: 500; font-size: larger;"></asp:Label>
                                                </div>
                                                <div class="col-md-8">
                                                    <asp:Label ID="tbDateOfJoin" runat="server" Text="15 Jun 2016"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 13px;">
                                                <div class="col-md-4">
                                                    <asp:Label ID="Lbgithub" runat="server" Text="Github: " Style="font-weight: 500; font-size: larger;"></asp:Label>
                                                </div>
                                                <div class="col-md-8">
                                                    <asp:Label ID="tbgithub" runat="server" Text="Email"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 13px;">
                                                <div class="col-md-4">
                                                    <asp:Label ID="Lblinked" runat="server" Text="LinkedIn: " Style="font-weight: 500; font-size: larger;"></asp:Label>
                                                </div>
                                                <div class="col-md-8">
                                                    <asp:Label ID="tblinked" runat="server" Text="Email"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <asp:Button ID="Button1" runat="server" Text="Edit" class="btn btn-outline-dark btn-sm" OnClick="SendToUserProfile" Style="margin-right: 0;" />
                                        </div>
                                    </div>



                                </div>

                                <div class="row" style="width: 100%; margin-left: 40px; margin-top: 40px;">
                                    <h4 style="margin-right: 25px;">Skills</h4>
                                    <%foreach (string skillname in userskills)
                                        {
                                    %>
                                    <h5><span class="badge badge-pill badge-dark" style="padding-top: 9px; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; border-radius: 0.45rem; margin-right: 10px;"><%=skillname %></span></h5>

                                    <%} %>
                                </div>

                            </div>

                        </div>

                        <div id="heading2" class="col-md-12" style="min-height: 900px;">
                            
                            <div class="container-fluid">
                                <div>
                                    <h2 style="margin-top: 20px; text-align: center;">QUESTION PAGE</h2>
                                    <hr />
                                </div>

                                <div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin-bottom: 20px;">
                                    <label id="qs" class="btn btn-outline-dark active" style="margin-right: 0; border-top-left-radius: 0.45rem; border-bottom-left-radius: 0.45rem;">
                                        <input type="radio" name="options" id="option1" checked="checked" />
                                        Questions Solved
                                    </label>

                                    <label id="qa" class="btn btn-outline-dark" style="border-top-right-radius: 0.45rem; border-bottom-right-radius: 0.45rem;">
                                        <input type="radio" name="options" id="option2" />
                                        Questions Asked
                                    </label>
                                </div>
                              </div>

                              <div id="questionask">
                                <%foreach (dataObjectuser obj in finallist)
                                    {
                                        string queryString = "questionPage.aspx?id=" + obj.id;%>
                                <div class="row hvr-grow" style="padding-top: 4px; padding-bottom: 4px; margin-left: 0; margin-right: 0; margin-top: 6px; background-color: beige;">

                                    <div class="row" style="margin-top: 8px; margin-left: 15px; width: 1000px;">
                                        <a href="<%=queryString %>" style="text-decoration: none; color:black!important"><p class=""><%=obj.title %></p></a>

                                    </div>
                                    <%  dataConnectoruser connector = new dataConnectoruser();
                                        ArrayList list = connector.tagArrayProvider(obj.id);%>

                                    <div class="row" style="margin-top: 5px; margin-left: 15px; margin-bottom: 10px; width: 100%;">
                                        <%   foreach (string tagname in list)
                                            {
                                                string tagQuestionUserDashboardAsked = "OneTagPage.aspx?tagName=" + tagname;

                                        %>
                                    
                                            <a href="<%=tagQuestionUserDashboardAsked %>" style="margin-right: 3px; padding: 7px;"><span class="badge badge-dark" style="font-size: 15px;"><%=tagname %></span></a>
                                    
                                        <%} %>
                                  
                                    </div>
                                    <div class="row" style="margin: 3px; display: flex; justify-content: flex-end; width: 100%;">
                                    
                                        <%string askQuestionQuery = "AskQuestionPage.aspx?qid=" + obj.id; %>
                                        <a  class="btn btn-outline-dark btn-sm editQuestionButton" href="<%=askQuestionQuery %>">Edit</a>
                                    </div>

                                </div>

                                <%} %>
                                  </div>
                    
                            <div id="questionans">
                                <%foreach (dataObjectans obje in finallist1)
                                    {
                                        string queryStringQuesAns = "questionPage.aspx?id=" + obje.id;%>
                                <div class="row hvr-grow" style="padding-top: 4px; padding-bottom: 4px; margin-left: 0; margin-right: 0; margin-top: 6px; background-color: beige;">

                                    <div class="row" style="margin-top: 8px; margin-left: 15px; width: 1000px;">
                                        <a href="<%= queryStringQuesAns%>" style="text-decoration: none; color:black!important"><p class=""><%=obje.title %></p></a>

                                    </div>
                                    <%  dataConnectorans connectorans = new dataConnectorans();
                                        ArrayList list = connectorans.tagArrayProvider(obje.id);%>

                                    <div class="row" style="margin-top: 5px; margin-left: 15px; margin-bottom: 10px;">
                                        <%   foreach (string tagname in list)
                                            {
                                                string tagQuestionUserDashboardSolved = "OneTagPage.aspx?tagName=" + tagname;
                                        %>
                                        <div class="" style="margin: 3px;">
                                            <a href="<%=tagQuestionUserDashboardSolved %>"><span class="badge badge-dark"><%=tagname %></span></a>

                                        </div>
                                        <%} %>
                                        <!-- <span class="badge badge-primary">Primary</span>
                             
                                     <span class="badge badge-success">Success</span>
                                     <span class="badge badge-danger">Danger</span>
                                     <span class="badge badge-warning">Warning</span>
                                     <span class="badge badge-info">Info</span>
                                     <span class="badge badge-light">Light</span>
                                     <span class="badge badge-dark">Dark</span>
                                     -->
                                    </div>

                                </div>

                                <%} %>
                            </div>  
                        </div>
                    </asp:Panel>
                </div>

                <div class="col-md-8" style="margin-left: 250px;">
                    <asp:Panel ID="Panel4" runat="server" >
                        <div id="heading4" class="col-md-12 row" style="min-height: 900px;">
                            
                            <div class="container-fluid">
                                <div style="width: 100%;">

                                    <div class="row" style="width: 100%;">
                                        <div class="col-md-4" style="margin-left: 100px;">
                                            <h2 style="font-weight: bold;">Change Password</h2>
                                        </div>

                                    </div>
                                    <div class="container-fluid" id="changepass">

                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-2" style="padding-top: 5px;">
                                                <asp:Label ID="lblPassOld" runat="server" Text="Current Password"></asp:Label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="tbPassOld" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row" style="width: 100%; margin-top: 15px;">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-2" style="padding-top: 5px;">
                                                <asp:Label ID="lblPassNew" runat="server" Text="New Password"></asp:Label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="tbPassNew" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row" style="width: 100%; margin-top: 15px;">
                                            <asp:Button ID="Button2" class="btn btn-outline-dark" runat="server" OnClick="changepassword" Text="Save password" Style="margin-left: auto; margin-right: auto;" />
                                        </div>

                                    </div>

                                    <hr style="background-color: lightgray; margin-top: 70px;" />

                                </div>

                                <div style="width: 100%; margin-top: 50px;">

                                    <div class="row" style="width: 100%;">
                                        <div class="col-md-4" style="margin-left: 100px;">
                                            <h2 style="font-weight: bold;">Deactivate Account</h2>
                                        </div>

                                    </div>
                                    <asp:Panel ID="deactivewindow" runat="server">
                                        <div class="container-fluid" id="deactive">

                                            <div class="row" style="width: 100%; margin-top: 30px;">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lblDeactivatePass" runat="server" Text="Enter your password" Style="float: right; margin-top: 5px;"></asp:Label>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="tbDeactivatePass" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="row" style="width: 100%; margin-top: 15px;">
                                                <asp:Button ID="btnDeactivate" class="btn btn-outline-dark" runat="server" OnClick="tester_Click" Text="Deactivate" Style="margin-left: auto; margin-right: auto;" />
                                            </div>

                                        </div>
                                    </asp:Panel>


                                </div>
                            </div>

                        </div>

                        <div id="heading5" class="col-md-12" style="min-height: 900px;">

                            <div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin-bottom: 25px;">
                            <label id="lblMyReports" class="btn btn-outline-dark form-check-label active" style="margin-right: 0; border-top-left-radius: 0.45rem; border-bottom-left-radius: 0.45rem;">
                                <input class="form-check-input" type="radio" name="options" id="option3" autocomplete="off" />
                               My Reports
                            </label>
                            <label id="lblReportProblem"  class="btn btn-outline-dark form-check-label" style="border-top-right-radius: 0.45rem; border-bottom-right-radius: 0.45rem;">
                                <input class="form-check-input" type="radio" name="options" id="option4" autocomplete="off"/>
                                Report Problem
                            </label>
                        
                        </div>

                            <div id="reposhow" class="card" style="margin-bottom: 50px;">
                            <div class="card-header">
                                  <h2 class="text-center" style="margin-top: 20px; font-weight: bolder;">Report Problem</h2>
                            </div>
                            <div class="card-body">
                                 <div class="row" style="margin-top: 40px;">
                            <div class="col-md-2" style="margin-top: auto; margin-bottom: auto; padding-right: 0;">
                                <h2 style="float: right;"><span class="badge badge-secondary" style="border-bottom-right-radius: 0; border-top-right-radius: 0; margin-top: 8px; height: 38px; font-size: 20px; padding-top: 10px;">Title</span></h2>
                            </div>
                            <div class="col-md-10" style="margin-top: auto; margin-bottom: auto; padding-left: 0;">
                                <asp:TextBox ID="tbprob" runat="server" Style="width: 90%; border-bottom-left-radius: 0; border-top-left-radius: 0;" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 25px;">
                            <div class="col-md-12" style="padding-left: 100px;">
                                <h2 style="margin-bottom: 0; "><span class="badge badge-secondary" style=" border-bottom-right-radius: 0; border-bottom-left-radius: 0; margin-top: 8px; height: 38px; font-size: 20px; padding-top: 10px; width: 91%; text-align: left;">Message</span></h2>
                            </div>
                            <div class="col-md-12" style="padding-left: 100px;">
                                <asp:TextBox ID="tbmsg" runat="server" TextMode="MultiLine" class="form-control" Style="border-top-right-radius: 0; border-top-left-radius: 0; height: 200px; width: 91%; /* margin-left: 184px; */"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 25px; margin-bottom: 50px;">
                            <asp:Button ID="sendprob" runat="server" class="btn btn-outline-dark" OnClick="Reportprob" Text="Submit" Style="margin-left: 110px;" />
                            <asp:FileUpload ID="FileUpload1" runat="server" OnClick="imageupload" CssClass="file-upload"  Style="margin-left: auto; margin-right: 150px;" />
                            <asp:Button ID="Btnupload" runat="server" class="btn btn-outline-dark" Text="Button"  OnClick="uploadImage"/>
                        </div>

                            </div>
                        </div>

                        <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                            <!-- Accordion card Report-->

                            <%
                                int i = 6;
                                foreach (dataObjectReportuser ob in finallist4)
                                {
                                    string heading = "heading" + i;
                                    string collapse = "collapseOne" + i;
                                    string hashTag = "#collapseOne" + i;

                                    %>
                                <div class="card" style="width: 990px;">

                            <!-- Card header -->
                            <div class="card-header" role="tab" id="<%=heading%>" >
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="<%=hashTag %>" aria-expanded="false" aria-controls="<%=collapse %>" style="text-decoration: none;color: black !important;">
                                    <div class="row">
                                        <div class="col-md-11">
                                            <h5 class="mb-0"><i class="fa fa-angle-double-right" style="margin-right: 25px;"></i> <%=ob.title %></h5>
                                        </div>
                                        <div class="col-md-1">
                                             <i class="fas fa-angle-down rotate-icon" style="float:right;"></i>
                                        </div>
                                    </div>
                                </a>
                            
                                <div class="row" style="display: flex; justify-content: flex-end"">
                                   <%=ob.status %>
                                </div>
                            </div>

                            <!-- Card body -->
                            <div id="<%=collapse %>" class="collapse" role="tabpanel" aria-labelledby="<%=heading %>" data-parent="#accordionEx">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <%=ob.message %>
                                        </div>
                                        <div class="col-md-3">
                                            <%Image1.ImageUrl = ob.img; %>
                                            <asp:Image ID="Image1" runat="server" style="height: 150px; width: 150px;" />
                                      
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                            <%
                                    i++;

                                } %>
                        </div>

                  
                    </div>

                    </asp:Panel>
                </div>

                <div class="col-md-2" style="">
                    <div class="sidenav" style="width: 230px;  left: auto; right: 0; padding-right:20px; border-left: 1px solid black;">
                       
                        
                    </div>
                </div>
                </div>
        </section>
       
       
           
        <footer class="footer" style="margin-top: 25px; line-height: 2; text-align: center; padding-bottom: 40px; padding-top: 40px;">
            <div class="container-fluid text-center">
                <span class="social-media-icons fab fa-twitter"></span>
                <span class="social-media-icons fab fa-facebook"></span>
                <span class="social-media-icons fab fa-instagram"></span>
                <span class="social-media-icons fas fa-envelope"></span>
                <p id="copyright">© Copyright 2020 Coding Community - All Rights Reserved</p>
            </div>
        </footer>
        <script type="text/javascript">
            /* $(function () {
                 *//*var fileupload = $("#FileUpload2");
           *//*
             var image = $("#imgFileUpload");
             image.click(function () {
                 $('#Button3').click();
               
               
         });
             fileupload.change(function () {
                 *//*var fileName1 = $(this).val().split('\\')[$(this).val().split('\\').length - 1];
            HiddenField1.value = fileName1;*//*
          
          
          
        });
    });*/
        </script>
        
       <script>
           <%
           string presentUser = "";
           if (Session["username"] != null)
           {

               presentUser = Session["username"].ToString();
           }
           if (queryStringUserName.Equals(presentUser))
           {



               %>
           $('.editQuestionButton').show();
           $('#Panel1').show();
           $('#Panel3').show();
           $('#Panel4').show();
           $('#Panel2').show();
           $('#Button1').show();
           <%}
           else
           {


            %>
           $('.editQuestionButton').hide();
           $('#Panel1').show();
           $('#Panel3').show();
           $('#Panel4').hide();
           $('#Panel2').hide();
           $('#Button1').hide();
           <%} %>

           $("#middle-section .sidenav ul li a").on("click", function () {

               $("#middle-section .sidenav ul li a").removeClass("waheguru");
               $(this).addClass("waheguru");

               var elemid = $(this).attr('id');
               $(elemid).show();
               var idno = elemid.substring(elemid.length - 1);


               for (var i = 1; i <= 5; i++) {
                   if (i != idno) {
                       $("#heading" + i).hide();
                   }
               }

           });
           $('#Btnupload').click(function () {
               location.reload();
           });

           $(document).ready(function () {

               $("#heading1").show();
               $("#heading2").hide();
               $("#heading3").hide();
               $("#heading4").hide();
               $("#heading5").hide();
               $("#middle-section .sidenav ul #Pr a").addClass("waheguru");
               $("#questionask").hide();
               $("#questionans").show();
               $("#accordionEx").show();

               $("#reposhow").hide();

           });
           $("#imgFileUpload").click(function () {
               $('#Button4').click();


           });


           $("#middle-section #heading2 .btn-group label #option1").on("click", function () {
               $("#qs").addClass("active");
               $("#qa").removeClass("active");
               $("#questionans").show();
               $("#questionask").hide();
           });


           $("#middle-section #heading2 .btn-group label #option2").on("click", function () {
               $("#qs").removeClass("active");
               $("#qa").addClass("active");
               $("#questionans").hide();
               $("#questionask").show();
           });

           $("#middle-section #heading5 .btn-group label #option4").on("click", function () {
               $("#lblReportProblem").addClass("active");
               $("#lblMyReports").removeClass("active");
               $("#reposhow").show();
               $("#accordionEx").hide();
           });


           $("#middle-section #heading5 .btn-group label #option3").on("click", function () {
               $("#lblReportProblem").removeClass("active");
               $("#lblMyReports").addClass("active");
               $("#reposhow").hide();
               $("#accordionEx").show();
           });

       </script>
        
      
      
    </form>
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
