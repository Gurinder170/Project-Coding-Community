<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin dashboard.aspx.cs" ErrorPage="~/ErrorPage.aspx" Inherits="Coding_Community.Admin_dashboard" MaintainScrollPositionOnPostBack = "true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>ADMIN DASHBOARD</title>
        
        <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet"/>
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
            
        <link rel="stylesheet"  href="userdashboardCSS.css"/>
    
        <link rel="stylesheet"  href="styles.css"/>
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

        

            .sidenav{
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
                color: #343A40 !important;
            }

            .my-custom-scrollbar {
            position: relative;
            height: 200px;
            overflow: auto;
            }
            .table-wrapper-scroll-y {
            display: block;
            }
       
        </style>
        <script>
            function yoyo() {
                alert("you enter wrong password");
            }
            function successalert() {
                swal("Registered Successfully!!");
            }
            function unsuccessalert() {
                swal("All the fields are required");
            }
            function unsuccessalertpass() {
                swal("Password doesnot match!!!");
            }

        </script>
    </head>
    <body style="padding-top: 0;">
        <form id="form1" runat="server">
       
             <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #343A40;">
              
                     <div style="width: 200px;">
                         <h3 class="text-center" style="color: white !important; font-weight: bolder; margin-top: 6px;"><i class="fa fa-user-shield"></i>  Admin</h3>
                     </div>

                     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="margin-left:10px; width: 160px; height: 40px;" Enabled="false"/>
                     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                         <span class="navbar-toggler-icon"></span>
                     </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item" id="login-register" >
                                <a class="nav-link" href="Title Page.aspx">Home</a>
                            </li>
                        
                        </ul>
                        <!-- <div class="custom-control-inline">
                            <input class="form-control mr-sm-2 my-2 my-lg-0" type="search" placeholder="Search" aria-label="Search" />
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </div> -->
                    
                        <div class="custom-control-inline" id="user-profile">
                        
                        
                            <i class="fa fa-user-circle fa-2x" style="margin-top: 5px;"></i>

                            <div class="nav-item dropdown">
                           
                                <%  string username = "";
                                    if (Session["username"] != null)
                                    {
                                        username = Session["username"].ToString();
                                    }%>

                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown currentUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;"><%=username%></a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: auto; right: 0;">
                               
                                
                                   </div>
                            </div>

                        </div>
                    </div>
              
                </nav>
     
            <section id="middle-section" style="margin-top: 80px;">

                <div class="container-fluid row" style="padding-left: 0; padding-right: 0; margin-left: 0; margin-right: 0;">

                    <div class="col-md-2">
                        <div class="sidenav" style="width: 230px; border-right: solid black 1px; margin-top: 10px;">
                            <ul>
                                <li id="Pr1"><a id="#heading1" href="#"><i class="fa fa-user"></i>  User</a></li>
                                <li id="Pr2"><a id="#heading2" href="#"><i class="fa fa-tags"></i>  Tags</a></li>
                                <li id="Pr3"><a id="#heading3" href="#"><i class="fa fa-user-cog"></i>  Skills</a></li>
                                <li id="Pr4"><a id="#heading4" href="#"><i class="fa fa-cogs"></i>  Settings</a></li>
                                <li id="Pr5"><a id="#heading5" href="#"><i class="fa fa-envelope"></i>  Report</a></li>
                            </ul>
                        </div>
                    </div>

                    <div id="heading1" class="col-md-8 row" style="min-height: 900px;">

                        <!-- Admin Page Users -->

                        <div style="width: 100%;">
                            <div class="row" style="width: 100%;">
                                <div class="col-md-4" style="margin-left: 100px;">
                                    <h2 style="font-weight: bold; float: right;">Users</h2>
                                </div>
                            </div>
                            <div class="container-fluid" id="NoOfUsers">
                                <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                    <table class="table table-bordered table-striped mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col">Username</th>
                                                <th scope="col">Question Asked</th>
                                                <th scope="col">Question Solved</th>
                                                <th scope="col">Last Active</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%foreach (datauser obj in finallist3)
                                                {
                                            %>
                                            <tr>
                                                <td><%=obj.username %></td>
                                                <td><%=obj.queask %></td>
                                                <td><%=obj.queans %></td>
                                                <td><%=obj.date %></td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="heading2" class="col-md-8 row" style="min-height: 900px;">

                        <!-- Add Tag  -->

                        <div class="row" style="width: 100%; margin-top: 40px;">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="row" style="width: 100%;">
                                        <div class="col-md-6" style="margin-left: 100px;">
                                            <h2 style="font-weight: bold; float: right;">Add New Tag</h2>
                                        </div>
                                    </div>

                                    <!-- Add Tag  -->

                                    <div class="container-fluid" id="AdminAdTag">
                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <asp:Label ID="Label7" runat="server" Text="Tag Name" Style="float: right; margin-top: 5px;"></asp:Label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="tbaddtag" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="width: 100%; margin-top: 15px;">
                                            <asp:Button ID="Btn1" class="btn btn-outline-dark allButtons" runat="server" OnClick="Button3_Click" Text="Add Tag" Style="margin-left: 150px;" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="margin-top: 60px;">
                                    <div class="row" style="width: 100%;">
                                        <div class="col-md-6" style="margin-left: 100px;">
                                            <h2 style="font-weight: bold; float: right;">Update Tag</h2>
                                        </div>
                                    </div>

                                    <!-- Add Tag  -->

                                    <div class="container-fluid" id="AdminUpdateTags">
                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <asp:Label ID="Label8" runat="server" Text="Tag Id" Style="float: right; margin-top: 5px;"></asp:Label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="tbupdateid" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <asp:Label ID="Label9" runat="server" Text="Tag Name" Style="float: right; margin-top: 5px;"></asp:Label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="tbupdatetag" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="width: 100%; margin-top: 25px;">
                                            <asp:Button ID="Btn2" class="btn btn-outline-dark allButtons" runat="server" OnClick="Button4_Click" Text="Update" Style="margin-left: 150px;" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="container-fluid" id="users">
                                    <table class="table table-bordered table-striped mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 200px; text-align: center;">TagId</th>
                                                <th scope="col">TagName</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <div class="table-wrapper-scroll-y my-custom-scrollbar" style="height: 400px;">
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <table class="table table-bordered table-striped mb-0 col-auto" runat="server">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 200px; text-align: center;">
                                                            <asp:Label ID="Label5" class="text-center" runat="server" Text='<%#Eval("tagId") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("tagName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="heading3" class="col-md-8 row" style="min-height: 900px;">

                        <!-- Add Tag  -->

                        <div class="row" style="width: 100%; margin-top: 40px;">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="row" style="width: 100%;">
                                        <div class="col-md-7" style="margin-left: 100px;">
                                            <h2 style="font-weight: bold; float: right;">Add New Skill</h2>
                                        </div>
                                    </div>

                                    <!-- Add Tag  -->

                                    <div class="container-fluid" id="AdminAdskill">
                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbaddSkill" runat="server" Text="Skill Name" Style="float: right; margin-top: 5px;"></asp:Label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="tbaddSkill" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="width: 100%; margin-top: 15px;">
                                            <asp:Button ID="Btn3" class="btn btn-outline-dark allButtons" runat="server" OnClick="skillAdd" Text="Add Skill" Style="margin-left: 150px;" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="margin-top: 60px;">
                                    <div class="row" style="width: 100%;">
                                        <div class="col-md-6" style="margin-left: 100px;">
                                            <h2 style="font-weight: bold; float: right;">Update Skill</h2>
                                        </div>
                                    </div>

                                    <!-- Add skill  -->

                                    <div class="container-fluid" id="AdminUpdateskill">
                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbskillupdateId" runat="server" Text="Skill Id" Style="float: right; margin-top: 5px;"></asp:Label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="tbskillupdateId" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row" style="width: 100%; margin-top: 30px;">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lbskillupdatename" runat="server" Text="Skill Name" Style="float: right; margin-top: 5px;"></asp:Label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="tbskillupdatename" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row" style="width: 100%; margin-top: 25px;">
                                            <asp:Button ID="Btn4" class="btn btn-outline-dark allButtons" runat="server" OnClick="skillUpdate" Text="Update" Style="margin-left: 150px;" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="container-fluid" id="usersSkill">
                                    <table class="table table-bordered table-striped mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 200px; text-align: center;">Skill Id</th>
                                                <th scope="col">Skill Name</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <HeaderTemplate>
                                            <div class="table-wrapper-scroll-y my-custom-scrollbar" style="height: 400px;">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table class="table table-bordered table-striped mb-0 col-auto" runat="server">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 200px; text-align: center;">
                                                            <asp:Label ID="Label5" class="text-center" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("skillName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="heading4" class="col-md-8 row" style="min-height: 900px;">

                        <!-- Admin Page Settings Change password -->

                        <div style="width: 100%;">
                            <div class="row" style="width: 100%;">
                                <div class="col-md-4" style="margin-left: 100px;">
                                    <h2 style="font-weight: bold; float: right;">Change Password</h2>
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
                                    <asp:Button ID="Btn5" class="btn btn-outline-dark allButtons" runat="server" Text="Save password" OnClick="changepassword" Style="margin-left: 370px;" />
                                </div>
                            </div>

                            <hr style="background-color: lightgray; margin-top: 70px;" />

                        </div>

                        <!-- Admin Page Settings Deactivate Account -->

                        <div style="width: 100%; margin-top: 50px;">

                            <div class="row" style="width: 100%;">
                                <div class="col-md-4" style="margin-left: 100px;">
                                    <h2 style="font-weight: bold;">Deactivate Account</h2>
                                </div>
                            </div>

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
                                    <asp:Button ID="Btn6" class="btn btn-outline-dark allButtons" OnClick="tester_Click" runat="server" Text="Deactivate" Style="margin-left: 380px;" />
                                </div>
                            </div>

                            <hr style="background-color: lightgray; margin-top: 70px;" />

                        </div>

                        <!-- Admin Page Settings Add Admin -->

                        <div style="width: 100%; margin-top: 50px; margin-bottom: 60px;">

                            <div class="row" style="width: 100%;">
                                <div class="col-md-4" style="margin-left: 100px;">
                                    <h2 style="font-weight: bold; float: right;">Add Admin</h2>
                                </div>

                            </div>

                            <div class="container-fluid" id="addAdmin">

                                <div class="row" style="width: 100%; margin-top: 30px;">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-2" style="padding-top: 5px;">
                                        <asp:Label ID="lblAdminUsername" runat="server" Text="Username" Style="float: right;"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="tbAdminusername" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row" style="width: 100%; margin-top: 15px;">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-2" style="padding-top: 5px;">
                                        <asp:Label ID="Label2" runat="server" Text="Name" Style="float: right;"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="tbadminname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row" style="width: 100%; margin-top: 15px;">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-2" style="padding-top: 5px;">
                                        <asp:Label ID="Label3" runat="server" Text="Email" Style="float: right;"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="tbadminemail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="tbadminemail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Enter a valid email."></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="row" style="width: 100%; margin-top: 15px;">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-2" style="padding-top: 5px;">
                                        <asp:Label ID="lblAdminPass" runat="server" Text="Password" Style="float: right;"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="tbAdminPass" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row" style="width: 100%; margin-top: 15px;">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3" style="padding-top: 5px;">
                                        <asp:Label ID="lblAdminConfPass" runat="server" Text="Confirm Password" Style="float: right;"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="tbAdminConfPass" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row text-center" style="width: 100%; margin-top: 15px;">
                                    <asp:Button ID="Btn7" class="btn btn-outline-dark allButtons" runat="server" Text="Add" Style="margin-left: 480px;" OnClick="Adminregister" />
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <div id="heading5" class="col-md-8 row" style="min-height: 900px;">

                        <div class="container-fluid">
                            <div class="row" style="width: 100%; ">
                                <h2 style="font-weight: bold; margin-left: auto; margin-right :auto;" class="">User Problems</h2>
                            </div>

                            <div id="endingRepo" class="btn-group btn-group-toggle" data-toggle="buttons" >
                                <label class="btn btn-dark form-check-label active" style="border-top-left-radius: 0.45rem; border-bottom-left-radius: 0.45rem;">
                                    <input class="form-check-input" type="radio" name="options" id="option1" autocomplete="off" checked/>
                                   Pending
                                </label>
                                <label id="solveRepo" class="btn btn-dark form-check-label" style="border-top-right-radius: 0.45rem; border-bottom-right-radius: 0.45rem;">
                                    <input class="form-check-input" type="radio" name="options" id="option2" autocomplete="off"/>
                                    Solved
                                </label>
                            </div>
                        </div>

                        <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                            <!-- Accordion card -->

                            <%
                                int j = 6;
                                foreach (dataObjectuser obj in finallist1)
                                {
                                    string heading = "heading" + j;
                                    string collapse = "collapseOne" + j;
                                    string hashTagWala = "#collapseOne" + j;
                            %>
                                <div class="card" style="width: 990px;">
                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="<%=heading%>">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="<%=hashTagWala %>" aria-expanded="false" aria-controls="<%=collapse %>">
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <h5 class="mb-0"><i class="fa fa-angle-double-right" style="margin-right: 25px;"></i><%=obj.title %></h5>
                                                </div>
                                                <div class="col-md-1">
                                                    <i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="container-fluid row" style="display: flex; justify-content: flex-end"">
                                            <asp:Button ID="reportsuccess" class="btn btn-outline-dark btn-sm" runat="server" OnClick="repoUpdate" Text="Solved" style="" />
                                        </div>
                                    </div>

                                    <!-- Card body -->
                                    <div id="<%=collapse %>" class="collapse" role="tabpanel" aria-labelledby="<%=heading %>" data-parent="#accordionEx">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <%=obj.message %>
                                                </div>
                                                <div class="col-md-3">
                                                    <%
                                                        Text1.Value = obj.id.ToString();
                                                        Rid = Convert.ToInt32(Text1.Value);
                                                    %>
                                                    <asp:Image ID="Image1" ImageUrl="<%=obj.img %>" runat="server" Style="height: 100px; width: 150px;" />
                                                    <input id="Text1" type="text" style="display: none" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <%
                                    j++;
                                } %>
                        </div>

                        <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true">

                            <!-- Accordion card -->

                            <%
                                int i = 6;
                                foreach (dataPendinguser obj in finallist2)
                                {
                                    string headings = "heading" + i;
                                    string collapses = "collapseOne" + i;
                                    string hashTagWala = "#collapseOne" + i;

                            %>
                            <div class="card" style="width: 990px;">

                                <!-- Card header -->

                                <div class="card-header" role="tab" id="<%=headings%>">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="<%=hashTagWala %>" aria-expanded="false" aria-controls="<%=collapses %>">
                                        <div class="row">
                                            <div class="col-md-11">
                                                <h5 class="mb-0"><i class="fa fa-angle-double-right" style="margin-right: 25px;"></i><%=obj.title %></h5>
                                            </div>
                                            <div class="col-md-1">
                                                <i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                                <!-- Card body -->
                                <div id="<%=collapses %>" class="collapse" role="tabpanel" aria-labelledby="<%=headings %>" data-parent="#accordionEx">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <%=obj.message %>
                                            </div>
                                            <div class="col-md-3">
                                                <%Image2.ImageUrl = obj.img; %>
                                                <asp:Image ID="Image2" runat="server" Style="height: 100px; width: 150px;" />
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
                        
                    <div class="col-md-2">
                        <div class="sidenav" style="width: 230px; margin-top: 10px; left: auto; right: 0; border-left: 1px solid black;">
                            <input type="text" id="txt_1" runat="server" style="opacity: 0; cursor: context-menu;" onkeyup='saveValue(this);' />
                        </div>
                    </div>

                </div>

            </section>
       
            <section id="footer" style="bottom: 0; width: 100%; margin-bottom: 0; margin-top: 25px; line-height: 2; text-align: center; padding-bottom: 40px; padding-top: 40px;">
                <footer class="footer">

                    <div class="container-fluid text-center">
                        <span class="social-media-icons fab fa-twitter"></span>
                        <span class="social-media-icons fab fa-facebook"></span>
                        <span class="social-media-icons fab fa-instagram"></span>
                        <span class="social-media-icons fas fa-envelope"></span>
                        <p id="copyright">© Copyright 2020 Coding Community - All Rights Reserved</p>
                    </div>

                </footer>
            </section>

            <script type="text/javascript">

                $("#middle-section .sidenav ul li a").on("click", function () {

                    $("#middle-section .sidenav ul li a").removeClass("waheguru");
                    $(this).addClass("waheguru");

                    var elemid = $(this).attr('id');
                    $(elemid).show();
                    var idno = elemid.substring(elemid.length - 1);

                    for (var i = 1; i <= 5; i++) {
                        if (i != idno) {
                            $("#heading" + i).hide();
                            $("#explainProblem").hide();
                        }
                    }
                });

                $(document).one('ready', function () {

                    $("#heading1").show();
                    $("#heading2").hide();
                    $("#heading3").hide();
                    $("#heading4").hide();
                    $("#heading5").hide();
                    $("#explainProblem").hide();
                    $("#accordionEx").show();
                    $("#accordionEx1").hide();

                    var isPostBackObject = document.getElementById('isPostBack');

                    if (isPostBackObject != null) {
                        var a = document.getElementById("txt_1").value;

                        $("#middle-section .sidenav ul #Pr" + a + " a").addClass("waheguru");
                        for (var i = 1; i <= 5; i++) {
                            if (i != a) {
                                $("#heading" + i).hide();

                            }
                            else {
                                $("#heading" + i).show();
                            }
                        }
                    }
                    else {
                        $("#middle-section .sidenav ul #Pr1 a").addClass("waheguru");
                    }

                });

                $("#Btn1").click(function (event) {
                    $('#txt_1').val("2");
                });

                $("#Btn2").click(function (event) {
                    $('#txt_1').val("2");
                });

                $("#Btn3").click(function (event) {
                    $('#txt_1').val("3");
                });

                $("#Btn4").click(function (event) {
                    $('#txt_1').val("3");
                });

                $("#Btn5").click(function (event) {
                    $('#txt_1').val("4");
                });

                $("#Btn6").click(function (event) {
                    $('#txt_1').val("4");
                });
                $("#Btn7").click(function (event) {
                    $('#txt_1').val("4");
                });

                $("#reportsuccess").click(function (event) {
                    $('#txt_1').val("5");
                });

                $("#showprob").on("click", function () {
                    $("#showproblem").hide();
                    $("#explainProblem").show();

                });

                $("#backrepo").on("click", function () {
                    $("#showproblem").show();
                    $("#explainProblem").hide();
                });

                $("#middle-section #heading5 .btn-group label #option1").on("click", function () {

                    $("#pendingRepo").addClass("active");
                    $("#solvedRepo").removeClass("active");
                    $("#accordionEx").show();
                    $("#accordionEx1").hide();
                });

                $("#middle-section #heading5 .btn-group label #option2").on("click", function () {
                    $("#pendingRepo").removeClass("active");
                    $("#solvedRepo").addClass("active");
                    $("#accordionEx1").show();
                    $("#accordionEx").hide();
                });

            </script>
        
        </form>
    </body>
</html>
