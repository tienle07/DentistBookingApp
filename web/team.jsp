
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="discounts.DiscountDTO"%>
<%@page import="feedbacks.FeedbackDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="patients.PatientDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>DentaCare</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/team.css">
    </head>

    <body>
        <%
            String loginPatient = "";
            ArrayList login = (ArrayList) session.getAttribute("LOGIN_USER");
            if (login != null) {
                loginPatient = ((PatientDTO) session.getAttribute("LOGIN_PATIENT")).getFullName();
            } else {
                String loginDefault = (String) session.getAttribute("LOGIN_DEFAULT");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="HomeController">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="HomeController" class="nav-link sa">Trang ch???</a></li>
                        <li class="nav-item "><a href="ShowTeamController" class="nav-link sa">Nh??m ph??t tri???n</a></li>
                        <li class="nav-item dropdown"><a href="MainController?action=Load" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">D???ch v???</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%
                                    List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                    if (listServiceType != null) {
                                        for (ServiceTypeDTO svType : listServiceType) {
                                %>	
                                <a class="dropdown-item nav-link text-primary" href="ServiceTypeHomeController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </li>
                        <li class="nav-item"><a href="LoadDoctorController" class="nav-link sa">B??c s??</a></li>
                            <%if (!loginPatient.equals("")) {%>
                        <li class="nav-item"><a href="ShowBookingPatientController" class="nav-link sa">L???ch s??? l???ch ?????t</a></li>

                        <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">????ng xu???t</a>
                                <a href="ShowProfileAccountController" class="dropdown-item nav-link text-primary text-center">H??? s?? c?? nh??n</a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item "><a href="login.jsp" class="nav-link sa" ><span>????ng nh???p</span></a></li>
                            <%}%>
                        <li class="nav-item cta"><a href="ShowBookingController" class="nav-link" ><span>?????t l???ch kh??m</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container" data-scrollax-parent="true">
                    <div class="row slider-text align-items-end">
                        <div class="col-md-7 col-sm-12 ftco-animate mb-5">
                            <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}"><a href="HomeController">Trang ch???</a></span> <span class="mr-2"><a href="#">Nh??m Ph??t Tri???n</a></span></p>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section" id="team">
            <div class="container my-3 py-5 text-center">
                <div class="row mb-5">
                    <div class="col">
                        <h1>Nh??m Ph??t Tri???n</h1>
                        <p class="my-3">
                            Hello World !
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="card h-100">
                            <div class="card-body">
                                <img class="img-fouild rounded w-80 img-fluid"
                                     src="images/doan.jpg"
                                     alt="Sophie">
                                <h4 class="pt-4">Nguy???n H???u ??oan</h4>
                                <h5>Software Engineer</h5>
                                <p style="font-size:20px">Leader</p>
                                <div class="d-flex flex-row justify-content-center">
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card h-100">
                            <div class="card-body">
                                <img class="img-fouild rounded w-80  img-fluid"
                                     src="images/quang.jpg"
                                     alt="lucy">
                                <h4 class="pt-4">Nguy???n V??n Quang</h4>
                                <h5>Software Engineer</h5>
                                <p style="font-size:20px">Back-End</p>
                                <div class="d-flex flex-row justify-content-center">
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-facebook-f"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card h-100">
                            <div class="card-body">
                                <img class="img-fouild rounded w-80 img-fluid"
                                     src="images/tu.jpg"
                                     alt="Brad">
                                <h4 class="pt-4">Nguy???n ??o??n T??</h4>
                                <h5>Software Engineer</h5>
                                <p style="font-size:20px">Front-End</p>
                                <div class="d-flex flex-row justify-content-center">
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-facebook-f"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card h-100">
                            <div class="card-body">
                                <img class="img-fouild rounded w-80 img-fluid"
                                     src="images/tien.jpg"
                                     alt="andres">
                                <h4 class="pt-4">L?? V??n Ti???n</h4>
                                <h5>Software Engineer</h5>
                                <p style="font-size:20px">Back-End</p>
                                <div class="d-flex flex-row justify-content-center">
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-facebook-f"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </div>
                                    <div class="p-4">
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">DentaCare</h2>
                            <p>Nha Khoa DentalCare cung c???p ?????y ????? c??c lo???i h??nh ??i???u tr??? nh??: T???ng qu??t, Ph???c h??nh r??ng s???, C???y gh??p implant, Ch???nh nha - ni???ng r??ng, Th???m m??? n?????u.</p>
                        </div>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Quick Links</h2>
                            <ul class="list-unstyled">
                                <li><a href="HomeController" class="py-2 d-block">Th??ng Tin</a></li>
                                <li><a href="LoadController" class="py-2 d-block">D???ch V???</a></li>
                                <li><a href="LoadDoctorController" class="py-2 d-block">B??c S??</a></li>
                                <li><a href="ShowTeamController" class="py-2 d-block">Li??n H???</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Th??ng Tin C?? S??? Ph??ng T??</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">L?? E2a-7, ???????ng D1, ??. D1, Long Th???nh M???, Th??nh Ph??? Th??? ?????c, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">0393626592</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">dentacare.noti@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> DentaCare </a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>


        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>

        <!-- Modal -->


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>
