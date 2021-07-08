<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Coding_Community.AboutUs" MaintainScrollPositionOnPostback="true" ErrorPage="~/ErrorPage.aspx"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>About Us</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/images/logo2.png" type="image/x-icon" />

    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/web/assets/mobirise-icons/mobirise-icons.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/tether/tether.min.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/bootstrap/css/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/bootstrap/css/bootstrap-reboot.min.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/dropdown/css/style.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/theme/css/style.css" />
    <link rel="stylesheet" href="https://mobirise.com/bootstrap-template/about-us-page-template/assets/mobirise/css/mbr-additional.css" type="text/css" />

    <script src="https://kit.fontawesome.com/c3eac449ca.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</head>
<body>
    
    <form id="form1" method="post" runat="server">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="min-height: 46px;">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/mainLogo.jpeg" style="width: 160px; height: 40px;" Enabled="false"/>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button> 

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Title Page.aspx">Home <span class="sr-only" style="position: absolute;">(current)</span></a>
                        </li>
                        <li class="nav-item active temp">
                            <a class="nav-link" href="LoginPage.aspx">Login <span class="sr-only" style="position: absolute;">(current)</span></a>
                        </li>
                        <li class="nav-item active temp">
                            <a class="nav-link" href="Register Page.aspx">Register <span class="sr-only" style="position: absolute;">(current)</span></a>
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
                    <div class="custom-control-inline" id="user-profile">


                        <% if (Session["username"] != null)
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
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="dropdown-item" OnClick="toUserDashBoard"><span class="picon" style="margin-right: 10px;"><i class="fa fa-user-circle"></i></span>My Account</asp:LinkButton>

                                <!--<a class="dropdown-item" href="#" onclick="logoutFunction()"><span class="picon" style="margin-right: 10px;"><i class="fa fa-info-circle"></i></span>Logout</a>-->
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="logout_click" CssClass="dropdown-item"><span class="picon" style="margin-right: 10px;"><i class="fa fa-sign-out"></i></span>Logout</asp:LinkButton>

                            </div>
                        </div>

                    </div>
                </div>
            </nav>

        <section class="header1 cid-qyvisAZ1Bw" id="header1-7" data-rv-view="758" style="margin-top: 50px;">

            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="mbr-white col-md-10">
                        <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-2">MEET OUR TEAM</h3>
                        <p class="mbr-text align-center pb-3 mbr-fonts-style display-5">
                            We are all very different. We were born in different cities, at different times, we love different music, food, movies. But we have something that unites us all. It is our love for coding. We are not just a team, we are a family and aim to provide you the best platform ever for solving your queries and gaining some experience.
                        </p>
                        <div class="mbr-section-btn align-center">
                            <a class="btn btn-md btn-outline-dark display-4" href="#form1-4">CONTACT US</a>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <section class="header1 cid-qyvcqB36eR" id="header1-0" data-rv-view="761" style="background-image: url(https://previews.123rf.com/images/maxkabakov/maxkabakov1506/maxkabakov150600376/40834310-social-network-concept-pixelated-blue-text-community-on-digital-wall-background-with-binary-code-3d-.jpg); padding-bottom: 135px; padding-top: 135px;">

            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="mbr-white col-md-10">
                    </div>
                </div>
            </div>

        </section>

        <section class="features1 cid-qyvcAqZyNq" id="features1-1" data-rv-view="764">

            <div class="container">
                <div class="media-container-row">

                    <div class="card p-3 col-12 col-md-6 col-lg-4" style="border: none;">
                        <div class="card-img pb-3">
                            <!--<span class="mbr-iconfont mbri-users" style="color: rgb(0, 0, 0);" media-simple="true"></span>-->
                            <img alt="creativity_logo" src="https://img.icons8.com/fluent/96/000000/creativity.png" style="width: 100px; height: 100px;" />

                        </div>
                        <div class="card-box">
                            <h4 class="card-title py-3 mbr-fonts-style display-5">Creativity</h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                It's the ability to think outside the box. We make decisions, create something new and generate a lot of ideas.
                            </p>
                        </div>
                    </div>

                    <div class="card p-3 col-12 col-md-6 col-lg-4" style="border: none;">
                        <div class="card-img pb-3">
                            <img src="https://www.pinclipart.com/picdir/big/344-3446087_trusted-by-kitchen-bath-professionals-everywhere-authenticity-seal.png" style="width: 80px; height: 100px;" />
                        </div>
                        <div class="card-box">
                            <h4 class="card-title py-3 mbr-fonts-style display-5">Authenticity</h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                This is a secure website and we assure you our website experience to be one of the best you ever had.
                            </p>
                        </div>
                    </div>

                    <div class="card p-3 col-12 col-md-6 col-lg-4" style="border: none;">
                        <div class="card-img pb-3">

                            <img src="https://cdn4.iconfinder.com/data/icons/simplicity-vector-icon-set/512/click.png" style="width: 100px; height: 100px;" />

                        </div>
                        <div class="card-box">
                            <h4 class="card-title py-3 mbr-fonts-style display-5">Simple
                            </h4>
                            <p class="mbr-text mbr-fonts-style display-7">
                                We aim at making our website as simple and genuine as we can and providing best services to you.
                            </p>
                        </div>
                    </div>



                </div>

            </div>

        </section>

        <section class="carousel slide testimonials-slider cid-qyvf5AQs7c" id="testimonials-slider1-3" data-rv-view="767" style="background-color: #41aea9;">


            <div class="container text-center">


                <div class="carousel slide" data-ride="carousel" role="listbox">
                    <div class="carousel-inner">

                        <div class="carousel-item active">
                            <div class="user col-md-8">
                                <div class="user_image">
                                    <img src="https://scontent-del1-1.xx.fbcdn.net/v/t31.0-8/10256596_606042109522944_2789137629512401041_o.jpg?_nc_cat=105&ccb=2&_nc_sid=174925&_nc_ohc=G532xrfQkY4AX-DsEdf&_nc_oc=AQm5QyRm7sPjVeMDJwPkfsOC1cNtGxQi-RKma3jKnm9gQUki2ieQ0OLX4-P7LghExVQ&_nc_ht=scontent-del1-1.xx&oh=d9649d366c05592539cd28ff641fbe80&oe=5FC98A4A" alt="Gaurav's Image" />
                                </div>
                                <div class="user_text pb-3">
                                    <p class="mbr-fonts-style display-7">
                                        All issues are resolved promptly. In communication, the employees are pleasant, helpful. Always offer new ideas, new ways to develop, improve our project.
                                    </p>

                                </div>
                                <div class="user_name mbr-bold pb-2 mbr-fonts-style display-7">
                                    Gaurav
                                </div>
                                <div class="user_desk mbr-light mbr-fonts-style display-7">
                                    Developer
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="user col-md-8">
                                <div class="user_image">
                                    <img src="https://scontent.fluh1-1.fna.fbcdn.net/v/t1.0-1/c0.107.200.200a/p200x200/123507075_393059181831914_2536330793478954841_o.jpg?_nc_cat=106&ccb=2&_nc_sid=7206a8&_nc_ohc=Xcs5TdF3cZ0AX83tyrk&_nc_oc=AQnt0zY1934Tq7Os0lRt3tDu--wD0aD7ScKXTOAeQA2d8SJxPIyCXzvqk7_mosu80Zo&_nc_ht=scontent.fluh1-1.fna&tp=27&oh=6c9b20d52e4d3786b8de0d23bc8afb51&oe=5FC7D6C3" alt="Harbilas's Image" />

                                </div>
                                <div class="user_text pb-3">
                                    <p class="mbr-fonts-style display-7">
                                        All issues are resolved promptly. In communication, the employees are pleasant, helpful. Always offer new ideas, new ways to develop, improve our project.
                                    </p>
                                </div>
                                <div class="user_name mbr-bold pb-2 mbr-fonts-style display-7">
                                    Harbilas 
                                </div>
                                <div class="user_desk mbr-light mbr-fonts-style display-7">
                                    DESIGNER
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="user col-md-8">
                                <div class="user_image">
                                    <img src="https://scontent-del1-1.xx.fbcdn.net/v/t1.0-1/p320x320/123361425_1805263886304786_4614728597764171901_n.jpg?_nc_cat=105&ccb=2&_nc_sid=7206a8&_nc_ohc=Q3GfPo4DOPcAX8SbnkN&_nc_ht=scontent-del1-1.xx&tp=6&oh=6676ec8db6ed40f6c0eb46d6cc0951cb&oe=5FC9BC1C" alt="Dheeraj's Image" />

                                </div>
                                <div class="user_text pb-3">
                                    <p class="mbr-fonts-style display-7">
                                        Good afternoon. I am very pleased with the quality of the work of your employee representing your wonderful company.
                                    </p>
                                </div>
                                <div class="user_name mbr-bold pb-2 mbr-fonts-style display-7">
                                    Dheeraj 
                                </div>
                                <div class="user_desk mbr-light mbr-fonts-style display-7">
                                    DEVELOPER
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="user col-md-8">
                                <div class="user_image">
                                    <img src="https://scontent-del1-1.xx.fbcdn.net/v/t1.0-1/s320x320/48404773_633299173754163_3780642308014211072_o.jpg?_nc_cat=109&ccb=2&_nc_sid=7206a8&_nc_ohc=vQnIXtx8rmEAX91Khok&_nc_ht=scontent-del1-1.xx&tp=7&oh=a3c493fd9fcfb79aec1d63f8b0db059b&oe=5FC706E8" alt="Gurinder's Image" />

                                </div>
                                <div class="user_text pb-3">
                                    <p class="mbr-fonts-style display-7">
                                        Excellent client manager. He is always accurate, all promises are fulfilled, all questions get answers, the company presents very attentive and positive approach.
                                    </p>
                                </div>
                                <div class="user_name mbr-bold pb-2 mbr-fonts-style display-7">
                                    Gurinder 
                                </div>
                                <div class="user_desk mbr-light mbr-fonts-style display-7">
                                    DESIGNER
                                </div>
                            </div>
                        </div>
                    </div>

                    <a class="carousel-control-prev" role="button" data-slide="prev" href="#testimonials-slider1-3">
                        <span aria-hidden="true" class="carousel-control-prev-icon"></span>
                        <span class="sr-only">Previous</span>
                    </a>

                    <a class="carousel-control-next" role="button" data-slide="next" href="#testimonials-slider1-3">
                        <span aria-hidden="true" class="carousel-control-next-icon"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </section>

        <section class="mbr-section form1 cid-qyvf9K0GGo" id="form1-4" data-rv-view="791">

            <div class="container">
                <div class="row justify-content-center">
                    <div class="title col-12 col-lg-8">
                        <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">CONTACT US</h2>

                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="media-container-column col-lg-8" data-form-type="formoid">
                        <div data-form-alert="" hidden="">
                            Thanks for filling out the form!
                        </div>

                        <div class="mbr-form">
                            <div class="row row-sm-offset">
                                <div class="col-md-4 multi-horizontal" data-for="name">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7" runat="server" for="contactUsName">Name</label>
                                        <input type="text" class="form-control" name="name" data-form-field="Name" runat="server" required="" id="contactUsName" />
                                    </div>
                                </div>
                                <div class="col-md-4 multi-horizontal" data-for="email">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7" runat="server" for="contactUsEmail">Email</label>
                                        <input type="email" class="form-control" name="email" data-form-field="Email" runat="server" required="" id="contactUsEmail" />
                                    </div>
                                </div>
                                <div class="col-md-4 multi-horizontal" data-for="subject">
                                    <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7" runat="server" for="subject">Subject</label>
                                        <input type="text" class="form-control" name="subject" runat="server" data-form-field="Phone" id="subject" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" data-for="message">
                                <label class="form-control-label mbr-fonts-style display-7" runat="server" for="contactUsMessage">Message</label>
                                <textarea type="text" class="form-control" name="message" runat="server" rows="7" data-form-field="Message" id="contactUsMessage"></textarea>
                            </div>
                            <asp:Button ID="Button2" runat="server" Text="Send Form" class="btn btn-outline-dark" OnClick="contactus"></asp:Button>

                        </div>
                    </div>
                </div>
             </div>
        </section>

        <section class="cid-qyvfbdUvMJ" id="footer6-5" data-rv-view="794" style="background-color: #343A40; padding-top: 60px; padding-bottom: 60px;">

            <div class="media-container-row align-center mbr-white" style="margin-bottom: 15px;">
                <i class="social-media-icons fab fa-twitter" style="margin-right: 10px;"></i>
                <i class="social-media-icons fab fa-facebook" style="margin-right: 10px;"></i>
                <i class="social-media-icons fab fa-instagram" style="margin-right: 10px;"></i>
                <i class="social-media-icons fas fa-envelope" style="margin-right: 10px;"></i>
            </div>

            <div class="media-container-row align-center mbr-white">
                <p class="mbr-text mb-0 mbr-fonts-style display-7" style="color: white;">© Copyright 2020 Coding Community - All Rights Reserved</p>
            </div>

        </section>

        <!-- BootStrap Jquery -->

    </form>

    <script>
            <%
        if (Session["username"] == null)
        {
                    %>
        document.getElementById('user-profile').style.display = 'none';
        $('.temp').show();

                <%
        }
        if (Session["username"] != null)
        {
                    %>
        document.getElementById('user-profile').style.display = 'inline-flex';
        $('.temp').hide();

                <%
        }
                %>
    </script>

</body>
</html>
     