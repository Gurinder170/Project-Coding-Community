<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Coding_Community.LoginPage" MaintainScrollPositionOnPostback="true" ErrorPage="~/ErrorPage.aspx"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel ="stylesheet" href ="styles.css"/>
    <meta name="google-signin-client_id" content="166316997152-280qva1drfjra3su5fvl5p6nh79c8cmq.apps.googleusercontent.com"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    

    <style>

        .login-or {
            position: relative;
            color: #aaa;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .span-or {
            display: block;
            position: absolute;
            left: 50%;
            top: -2px;
            margin-left: -25px;
            background-color: #fff;
            width: 50px;
            text-align: center;
        }

        .hr-or {
            height: 1px;
            margin-top: 0px !important;
            margin-bottom: 0px !important;
        }
        
    </style>
    <script>
        function emptyfield() {
            alert("please enter your username and password")
        }

    </script>

</head>
<body style="background-image: url(images/loginPageImage.jpg); background-size: cover; background-position: center center;">
    <form id="form1"  runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
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
                            <a class="nav-link" href="Register Page.aspx">Register <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="AboutUs.aspx">About Us <span class="sr-only">(current)</span></a>
                        </li>
                        <!-- <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                      </li> -->
                    </ul>
                </div>
            </nav>
        
        <main class="d-flex align-items-center " style="height:88vh;" >
            <div class="container-fluid">
        <div class="row" style="">
			<div class="col-md-6 " style="max-width: 420px; margin-left: auto; margin-right: 80px;">
			 <div id="first">
				<div class="myform form " style="border: 1px solid rgba(0,0,0,.2); border-radius: 1.1rem; outline: 0; background-color: aliceblue;">
					 <div class="logo mb-3 col-md-12">
						 
							<div class="text-center" style="margin-top: 25px;">
                                <h1 style="font-family: 'Copperplate Gothic'; color: black !important;">Login</h1>
							</div>


                         <div class="form-group">
                             <div class="row" style="margin-left: auto;">
                                 <label>Username</label>
                             </div>
                             <div class="row">
                                 <div class="col-md-11">
                                     <asp:TextBox ID="username" class="form-control" runat="server" placeholder="Enter Username" OnTextChanged="username_TextChanged"></asp:TextBox>
                                 </div>
                                 <div class="col-md-1" style="padding-left: 0;">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" style="padding-left: 0;" runat="server" ErrorMessage="*" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                             
                             </div>
                         </div>
                         <div class="form-group ">
                             <div class="row" style="margin-left: auto;">
                                 <label>Password</label>
                             </div>
                             <div class="row">

                                 <div class="col-md-11">
                                     <asp:TextBox ID="password" class="form-control" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                                 </div>
                                 <div class="col-md-1" style="padding-left: 0;">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" style="padding-left: 0;" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                             </div>
                           </div>
                         <asp:Label ID="Label1" runat="server" Text="* You entered wrong Username or password" ForeColor="Red" Visible="false"></asp:Label>
<!-- Wrong password-->    <div class="modal fade" id="wrongpassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" runat="server">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle1">Wrong Password</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                     <p>Please try again...</p>
                                      
                                      
                                 
                                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                      
                                  </div>
                                </div>
                              </div>
                            </div>
<!-- Forgot Password -->
                         <div class="text-right" style="margin-bottom: 25px;">
                            <a  href="#" data-toggle="modal" data-target="#exampleModalCenter1">Forgot Password? </a>
                           
                         </div>  
                         <!-- Button trigger modal -->
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" runat="server">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle" >Forgot Password</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                      <asp:Label ID="Lbemailv" runat="server" Text="Enter your email to get your password.."></asp:Label><asp:Label ID="Lbotp" runat="server" Text="Enter your otp to get your password.." Visible="false"></asp:Label> 
                                      
                                       <input type="text" class="form-control" name="vemail"  runat="server"  id="vemail"/>
                                      <asp:TextBox ID="TextBox2" runat="server" Visible="false"></asp:TextBox>
                                      <asp:Label ID="lberror" runat="server" Text="Please try again...." Visible="false"></asp:Label>
                                  </div>
                                  <div class="modal-footer">
                                      <asp:Button ID="Button2" class="btn btn-secondary" runat="server" Text="Send otp" OnClick="SendOTP" />
                                      <asp:Button ID="Button3" runat="server" Text="Send Password" OnClick="SendPassword" Visible="false"/>
                                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                      
                                  </div>
                                </div>
                              </div>
                            </div>

                         <!-- Modal for terms of use -->

                         <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                             <div class="modal-dialog" role="document">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title" id="exampleModalLongTitle">Terms Of Use</h5>
                                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                             <span aria-hidden="true">&times;</span>
                                         </button>
                                     </div>
                                     <div class="modal-body">
                                         Company hereby represents and warrants that anyone and everyone assigned a Product license by Company to use the Product is an Authorized User using the Product on behalf of Company for Company’s internal purposes, and Company will ensure Authorized Users’ will comply with this Agreement. Coding Community may suspend any Entity Representative(s) and/or Authorized User(s) at any time for misuse of the Product.
                                     </div>
                                     <div class="modal-footer">
                                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                     </div>
                                 </div>
                             </div>
</div>
                         
                           <div class="form-group">
                              <p class="text-center">By signing up you accept our <a href="#" data-target="#exampleModalLong" data-toggle="modal">Terms Of Use</a></p>
                           </div>
                           <div class="col-md-12 text-center ">
                               <asp:Button ID="Button1" class=" btn btn-block mybtn btn-dark tx-tfm" runat="server"  Text="LOGIN" OnClick="SubmitBtn_Click"/>
                               
                           </div>
                         
                         
                           <div class="col-md-12 ">         
                              <div class="login-or">
                                 <hr class="hr-or"/>
                                 <span class="span-or" style="background-color: aliceblue;">or</span>
                              </div>
                           </div>
                           
                           <div class="form-group" style="margin-bottom: 50px;">
                              <p class="text-center">Don't have account? <a href="Register Page.aspx" id="signup">Sign up here</a></p>
                           </div>
                       
                       
                         </div>
                 
				</div>
			</div> 
			  
		    </div>
		</div>
    </div>

        </main>
       

            <script type="text/javascript">
                
                function showmodal() {
                    $('#exampleModalCenter1').modal('show');
                };
                function wrongpass() {
                    $('#wrongpassword').modal('show');
                };
                
            </script>


        

       
        
    </form>
   
</body>
</html>
