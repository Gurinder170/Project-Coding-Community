<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="questionPage.aspx.cs" ValidateRequest="false" Inherits="Coding_Community.questionPage" MaintainScrollPositionOnPostback="true" ErrorPage="~/ErrorPage.aspx"%>
<%@ Import Namespace="Coding_Community" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="Scripts/tinymce/tinymce.js"></script>
    <script>
        tinymce.init({ selector: 'textarea', width: 800, height: 400, branding: false });
        function yoyo() {
            swal("You Enter wrong username or password.Please try again");
        }
    </script>

    <link rel="stylesheet" href="styles.css" />

    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet"/>
    
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function afterAnsSubmit() {
            swal("Your Answer has been posted successfully.")
                .then((value) => {
                    window.location = "Title Page.aspx";
                });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->

         <div>
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
                            <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <!-- <div class="custom-control-inline">
                        <input class="form-control mr-sm-2 my-2 my-lg-0" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div> -->
                    
                    <div class="custom-control-inline" id="user-profile">
                        <%  string username = "";
                                if (Session["username"] != null)
                                {
                                    
                                    Image2.ImageUrl = "~/UploadImages/" + Session["image"].ToString();
                                }%>
                        
                        <asp:Image ID="Image2" runat="server"  style="border-radius: 100%; height: 40px; width :40px;"/>

                        <div class="nav-item dropdown">

                            <%
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
       </div>
        <section id="middle-section" style="margin-top: 100px;">

        <div class="container row" style="margin-left: 200px; margin-top: 40px;">
            <div class="col-md-9">
                <h3 runat="server" id="heading" style="font-weight: 400;"></h3>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnAskQues" runat="server" Text="Ask Question" class="btn btn-outline-dark" style="float: right; margin-top: 20px;" OnClick="askbtn"/>
            </div>
        </div>

        <div class="container row" style="margin-left: 200px;">
            <div class="col-md-1" style="padding-right: 0; margin-top: 3px;">
                <h6 style="float: right; font-weight: 400; color: #808080 !important;">Asked</h6>
            </div>
            <div class="col-md-2" style="padding-left: 0; margin-left: 7px;">
                <asp:Label ID="lblAsked" runat="server" Text="today"></asp:Label>
            </div>
            
        </div>
        <hr style="width: 1100px;"/>

        <div class="container row" style="margin-left: 200px;">
            <div class="col-md-9">
                <!--<asp:TextBox ID="tbProblemBody" runat="server" TextMode="MultiLine"></asp:TextBox>-->
                 <div style="border: 3px black solid; padding: 40px; padding-top: 20px; border-radius: 1rem;">
                    <p runat="server" id="Qbody"></p>

                     

                    <div class="container row" style="">
            
                   <%foreach (string tagName in tagList)
                       {
                           %>           
                            <div class="" style="margin: 8px;">
                                <%string tagQuery = "OneTagPage.aspx?tagName=" + tagName; %>
                                 <h5><a href="<%=tagQuery %>"><span class="badge badge-secondary" style="padding-left: 10px; padding-right: 10px; padding-top: 3px; padding-bottom: 6px;"><%=tagName %></span></a></h5>

                            </div>
                <%} %>
                                
            </div>

                    <div class="container row" style="float: right;">
                        <div class="col-md-8">
                        </div>
                        <div class="col-md-2" style="padding-right: 0;">
                            <h6 style="width: fit-content; float: right; margin-top: 3px; margin-right: 6px; font-weight: 400; color: #808080 !important;">Asked By</h6>
                        </div>
                        <div class="col-md-2" style="padding-left: 0;">
                            <a runat="server" id="askedByLink" href="" style="color:#808080 !important"><p runat="server" id="askedBy"></p></a>
                        </div>

                    </div>

                     </div>
                

                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <div class="container row" >
                              <div class="col-md-2">

                              </div>
                              <asp:Label ID="Label3" runat="server" Text="Username:  " style="padding-top: 7px;"></asp:Label>
                              <div class="col-md-1">

                              </div>
                              <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" CssClass="form-control" style="width: 250px;"></asp:TextBox>
                          </div>
                          
                          <div class="container row" style="margin-top: 10px;">
                              <div class="col-md-2">

                              </div>
                              <asp:Label ID="pass" runat="server" Text="Password :   " style="padding-top: 7px;"></asp:Label>
                              <div class="col-md-1">

                              </div>
                              <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" style="width: 250px;"></asp:TextBox>
                          </div>
                          <div class="container row">
                              <asp:Label ID="incorrect" runat="server" Text="*You Entered wrong username or password." ForeColor="Red" Visible="false"></asp:Label>
                          </div>
                          <!--<asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>->
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                          <asp:Button ID="Button3" runat="server" Text="Login" CssClass="btn btn-outline-primary" OnClick="loginbtn"  />
                      </div>
                    </div>
                  </div>
                </div>

                <hr style="background-color: lightgray; margin-top: 35px; margin-bottom: 30px;"/>

                <h1 style="font-weight: bold; font-family: Cambria; color: lightseagreen !important; margin-bottom: 15px;">Answers</h1>
            
            <%foreach (answerDataObject dhe in ansList)
              {
                    %>
                     <div style="border: solid 3px lightseagreen; margin-bottom: 20px; padding: 20px; border-radius: 1rem;">
                    
                    <p><%=dhe.ansContent %></p>
                        
                        
                    <div class="row container-fluid">
                        <div class="col-md-6">
                            <h6 style="color: #808080 !important;font-weight: 400;">Answered On: </h6><p><%=dhe.dateTime %></p>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-4" style="float:right;">
                            <%string ansUserQueryString = "User dashboard.aspx?uname=" + dhe.username; %>
                            <h6 style="color: #808080 !important; font-weight: 400;">Answered By: </h6><a href="<%=ansUserQueryString %>" style="color:black!important"><p><%=dhe.username %></p></a>
                        </div>
                    </div>
                         
                </div>
                <%} %>
                <hr style="background-color: lightgray; margin-top: 45px;" />

                <div class="container" id="doYouKnow">
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red">Want to answer this question? <a href="LoginPage.aspx" data-toggle="modal" data-target="#exampleModalCenter"><u>Login</u></a> to contribute.</asp:Label>
                </div>

               
                
                <section id="postAnswerDiv">
                    <hr style="background-color: black; margin-top: 45px;" />
                
                    <div class="row container" style="margin-bottom: 20px;">
                        <h3>Your Answer</h3>
                    </div>
                    <div class="container" style="padding-left: 0; padding-right: 0;">
                        <textarea class="tinymce form-control" runat="server" id="yourAnswer" style="width: inherit;"></textarea>
                    </div>

                    <asp:Button ID="postAnswer" runat="server" style="margin-top:20px" Text="Post Your Answer" class="btn btn-outline-dark" OnClick="post"/>
                </section>
            </div>
                
            
            <div class="col-md-3">
                <table class="table table-sm table">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">UserName</th>
                              
                              <th scope="col">Q Answered</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                              int x= 1;
                              foreach (leaderboard obj in questionPageLeaderBoard)
                              {
                                  
                                  %>
                            <tr>
                              <th scope="row"><%=x %></th>
                                <%string userNameQuery = "User dashboard.aspx?uname=" + obj.nameOfUser; %>
                              <td><a href="<%=userNameQuery %>" style="color:black!important"><%=obj.nameOfUser %></a></td>
                              
                              <td><%=obj.questionAnswered %></td>
                            </tr>
                              <%
                                      x = x + 1;
                                  } %>
                            
                          </tbody>
                        </table>
                <div >
                    <%foreach(hotTagDataObject obj in hottagforqPage)
                        {
                            /*hotTagDataObject obj = (hotTagDataObject)hottagforqPage[i];*/
                            string tagQuery = "OneTagPage.aspx?tagName=" + obj.tagName;
                            %>
                    <a href="<%=tagQuery %>"><span class="badge badge-pill badge-dark"><%=obj.tagName %></span></a>


                    <%} %>

                </div>
            </div>

             

        </div>

            </section>

        <section class="siteFooter">
            <footer class="white-section" id="footer">
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
        document.getElementById("doYouKnow").style.display = "block";
        document.getElementById("postAnswerDiv").style.display = 'none';
        document.getElementById('user-profile').style.display = 'none';
        
        <%
        }
        if (Session["username"] != null)
        {
            %>
        document.getElementById('user-profile').style.display = 'inline-flex';
        document.getElementById("doYouKnow").style.display = "none";
        document.getElementById("postAnswerDiv").style.display = 'block';
        <%
        }
        %>


    </script>

</body>
</html>
