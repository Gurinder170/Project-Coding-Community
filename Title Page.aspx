<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Title Page.aspx.cs" Inherits="Coding_Community.Home_Page" ErrorPage="~/ErrorPage.aspx" %>
<%@ Import Namespace="Coding_Community" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
    <title>TITLE PAGE</title>

    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
    <style>
        body {
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10;
            background-color: rgba(0,0,0,0.5); /*dim the background*/
        }
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

        <!-- Navbar -->

      
            <nav class="navbar navbar-expand-lg navbar-dark webAppTheme fixed-top bg-dark">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">


                        <li class="nav-item active temp" >
                            <a class="nav-link" href="LoginPage.aspx">Login</a>
                        </li>
                        <li class="nav-item active temp" >
                            <a class="nav-link" href="Register Page.aspx">Register <span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="HelpCentrePage.aspx">Help <span class="sr-only">(current)</span></a>
                        </li>
                        
                    </ul>
                    <!-- <div class="custom-control-inline">
                        <input class="form-control mr-sm-2 my-2 my-lg-0" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div> -->
                    <div class="custom-control-inline" style="margin-left :auto; margin-right: auto; position: absolute; margin-left: 300px;">
                        <asp:TextBox ID="tbsearch" class="form-control mr-sm-2 my-2 my-lg-0" runat="server" style="width: 800px;" placeholder="Search"></asp:TextBox>
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="btnsearch" style="padding-top: 5px; color: white !important;"><i class="fa fa-search"></i></asp:LinkButton>
                        
                    </div> 
                    
                    <div class="custom-control-inline" id="user-profile" style="margin-left: auto; margin-right: 1rem;">
                        <% 
                            if (Session["username"] != null && Session["uname"].ToString()=="user")
                            {
                                Image1.ImageUrl = "~/UploadImages/" + Session["image"].ToString();
                            }
                            else
                            {
                                Image1.ImageUrl = "https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg";
                                LinkButton2.Visible = false;
                            }
                                %>
                                
                        
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
                                
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-item" OnClick="logout_click"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>
                            </div>
                        </div>

                        

                    </div>
                </div>
            </nav>
        
             <asp:Panel ID="Panel1" runat="server" class="overlay" visible="false" Height="">

             <div id="searchBoxResults" class="container" style=" padding: 10px; padding-bottom: 25px; background-color: white; height: 600px; width: 1200px; margin-top: 50px;  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <div class="row" style="padding-left: 20px; padding-right: 20px;">
                    <h3 style="margin-left: 10px; margin-top: 10px;">Results</h3>
                    <asp:Button ID="btnCancel" OnClick="btncancel" OnClientClick="hidePanel();" runat="server" Text="X" style="border: none; background-color: white; font-weight: 700; margin-left :auto; margin-right: 0; font-size: 20px;" />
                </div>
                <hr style="border: 1px solid lightgray; width: 100%;" />

                <div style="overflow-y: scroll; overflow-x: hidden; height: 480px;">
                    <div class="container-fluid">
                         <%foreach (dataObjectuser obj in finallist3)
                             {
                                 string queryString = "questionPage.aspx?id=" + obj.id;%>
                        <div class="row" style="margin-bottom: 10px; background-color: white; box-shadow: 0 4px 8px 0 lightblue, 0 6px 20px 0 lightblue; margin-left: 0; margin-right: 0; margin-top: 6px;">
                             
                            <div class="col-md-12" style="border-left: solid white 5px;">
                                <div class="row" style="" id="question-title">
                                    <div class="row" style="margin-top: 8px; margin-left: 15px; width: 100%; font-size: x-large;">
                                        <a target="_blank" href="<%=queryString %>" style="text-decoration: none;">
                                            <p class=""><%=obj.title %></p>
                                        </a>
                                    </div>
                                    <%  dataConnectoruser connector = new dataConnectoruser();
                                ArrayList list = connector.tagArrayProvider(obj.id);%>
                                   
                                    <div class="row" style="margin-top: 5px; margin-left: 15px; margin-bottom: 10px; width: 100%;">
                                          <%   foreach (string tagname in list)
                                    {
                                %>
                                        <div class="" style="margin: 3px;">
                                            <span class="badge badge-secondary" style="padding-bottom: 7px; padding-top: 7px; padding-left: 7px; padding-right: 7px;"><%=tagname %></span>
                                           

                                        </div>
                                          <%} %>
                                    </div>

                                    <div class="container" style="display: flex; justify-content: flex-end">
                                        <div class="row" style="margin-right: 10px;  text-shadow: 1px 1px;">
                                            <h6 style="margin-right: 10px; margin-top: 3px;">Asked By:</h6>
                                            <p><%=obj.username %> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                      
                        </div>
                          <%} %>
                    </div>

                  
                </div>

            </div>

        </asp:Panel>

        
       <section id="middle-section" style="margin-top:80px;">
           
            <div class="container-fluid row" style="padding-left: 0; padding-right: 0;margin-left:0;margin-right:0;">
                <div class="col-md-2"> 
                    <div class="sidenav" style="width: 270px; /*border-right:0.5px solid lightgray;*/">
                        <ul style="list-style-type:none; margin-top: 200px;">
                            <li><a href="#">Hot Tags</a></li>
                            <%for (int i= 0;i<5;i++)
                                {
                                    hotTagDataObject obj = (hotTagDataObject)hotTagList[i];
                                    %>
                            <%string querystring = "OneTagPage.aspx?tagName=" + obj.tagName; %>
                           <li style="margin:5px;"> <button  type="button" class="btn" style="margin-left:30px; padding:0; border: 1px white solid;">
                                <a style="font-size:17px; color:white !important" href="<%=querystring %>"><%=obj.tagName %><span style="margin-left:6px;" class="badge badge-light"><%=obj.tagCount %></span></a>
                            </button>
                               </li>
                            <%} %>
                            
                        </ul>
                    </div>
                </div>
                <div id="heading1" class="col-md-8" style="padding-left: 10px; padding-right: 10px;">
                    
                    <div class="panel-heading" style="margin-left:15px;">
                        <h1 style="text-align: left; margin-top: 20px;color:black!important">All Questions<p>
                            <%
                                if (Session["username"] != null && Session["uname"].ToString() == "Admin")
                                {
                                    Button1.Visible = false;
                                }
                                else
                                {
                                    Button1.Visible = true;
                                }
                                %>
                            <asp:Button ID="Button1" CssClass="btn btn-outline-dark" runat="server" OnClick="ask_QuestionButton" Text="Ask a Question" style="float:right;" />
                        </h1>
                        <div class="row" style="margin-top: 25px; margin-left: 10px;">
                            <asp:Label ID="Label1" runat="server" Text="20,930,345" style="margin-right: 10px; padding-left: 15px;"></asp:Label>questions
                        </div>
                        <hr />
                    </div>

                    <div>

                        <%foreach (dataObject obj in finallist)
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
                                    <%  dataConnector connector = new dataConnector();
                                        ArrayList list = connector.tagArrayProvider(obj.id);%>

                                    <div class="row" style="margin-top: 5px; margin-left: 15px; margin-bottom: 10px; width: 100%;">
                                        <%   foreach (string tagname in list)
                                            {
                                        %>
                                        <div class="" style="margin: 3px;">
                                            <%string tagQueryStringForQuestion = "OneTagPage.aspx?tagName=" + tagname; %>
                                            <a href="<%=tagQueryStringForQuestion %>"><span class="badge badge-dark" style="padding-bottom: 7px; padding-top: 7px; padding-left: 7px; padding-right: 7px;"><%=tagname %></span></a>

                                        </div>
                                        <%}
                                            %>
                                
                                 </div>

                                    <div class="container" style="display: flex; justify-content: flex-end">
                                        <div class="row" style="margin-right: 10px;">
                                            <p style="margin-right: 10px;">Asked By: </p>
                                            <%string userProfileQuery = "User dashboard.aspx?uname=" + obj.userName; %>
                                            <a href="<%=userProfileQuery %>" style="color:black!important"><p><%=obj.userName %></p></a>
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
                    <div class="sidenav" style="width: 270px; left: auto; right: 0; padding-right:15px; padding-left :15px; background-color: white;  border-left:0.5px solid lightgray;">
                        <table class="table table-sm table" style="margin-top:200px; background-color: white; border-collapse:collapse; border:1px solid black;" >
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">UserName</th>
                              
                              <th scope="col">Questions Answered</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                              int  x = 1;
                              foreach (leaderboard obj in leaderBoardContent)
                              {

                                  %>
                            <tr >
                              <th scope="row" style="border:1px solid black;"><%=x %></th>
                                <%string nameOfUserLeader = "User dashboard.aspx?uname=" + obj.nameOfUser; %>
                              <td style="border:1px solid black;"><a href="<%=nameOfUserLeader %>" style="font-size:medium; color: black !important;"><%=obj.nameOfUser %></a></td>
                              
                              <td style="border:1px solid black;"><%=obj.questionAnswered %></td>
                            </tr>
                              <%
                                      x = x + 1;
                                  } %>
                            
                          </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </section>
            
             
         <!--    <asp:Repeater ID="Repeater1" runat="server">

                    <ItemTemplate  >
                        <div style="border-bottom: solid 1px; margin-top: 20px;">

                         <div class="row" style="margin-top: 8px; margin-left: 15px;">
                            <asp:Label ID="Label1" runat="server" Text="Title:"></asp:Label>
                            <a href="userProfilePage.aspx">
                             <asp:Label ID="lblval"  runat="server" Text=></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text= Visible="false"></asp:Label></div>
                           </a>
                       
                           

                        
                         <div class="row" style="margin-top: 5px; margin-left: 15px; margin-bottom: 10px;">
                             <span class="badge badge-secondary"></span>
                             <!--<span class="badge badge-primary">Primary</span>
                             
                             <span class="badge badge-success">Success</span>
                             <span class="badge badge-danger">Danger</span>
                             <span class="badge badge-warning">Warning</span>
                             <span class="badge badge-info">Info</span>
                             <span class="badge badge-light">Light</span>
                             <span class="badge badge-dark">Dark</span>
                             
                         </div>
                            

                     </div>
                   
                
                    </ItemTemplate>
                        </asp:Repeater>
             -->
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

    <!--<script src="node.js" charset="utf-8"></script>-->
    <script>
        <%    

        if (Session["username"] == null)
        {

        %>
        document.getElementById('user-profile').style.display = 'none';
        $('.temp').show();
        
        
        <%
        }
        else
        {
            %>
        $('.temp').hide();
            document.getElementById('user-profile').style.display = 'inline-flex';
            
            document.querySelector('#currentUser').textContent = <%= Session["username"].ToString()%>;
        <%
        }

        %>




    </script>
    <!--<script type = "text/javascript" >
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>-->
        
</body>
</html>
