<%-- 
    Document   : Header
    Created on : 7 Apr, 2024, 10:32:31 AM
    Author     : PRITHVIRAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Baby Glow</title>
        <link rel="shortcut icon" type="image/png" href="../Assets/Templates/Admin/images/logos/favicon.png" />
        <link rel="stylesheet" href="../Assets/Templates/Admin/css/styles.min.css" />
        <style>
            /* Custom CSS for sidebar hover color, rounded border, and text color */
            .scroll-sidebar #sidebarnav .sidebar-item:hover .sidebar-link {
                background-color: #f8e3e7 !important;
                border-radius: 10px; /* Adjust the border-radius as needed */
                color: #FFC0CB !important; /* Text color on hover */
            }
            .nav-item:hover .nav-link {
                /* Your hover styles for nav-item */
                background-color: white;
                border-radius: 5px; /* Adjust the border-radius as needed */
                color: #f8e3e7;
            }
            .nav-item.active .nav-link {
                /* Your styles for the active nav-item background */
                background-color: pink !important;
                color: white !important;
            }
        </style>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div>
                    <div class="brand-logo d-flex align-items-center justify-content-between">
                        <a href="./Homepage.jsp" class="text-nowrap logo-img">
                            <img src="../Assets/Templates/Admin/images/logos/logomain2.png" width="180" alt="" />
                        </a>
                        <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                            <i class="ti ti-x fs-8"></i>
                        </div>
                    </div>
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                        <ul id="sidebarnav">
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Home</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./Homepage.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-layout-dashboard"></i>
                                    </span>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">UI COMPONENTS</span>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./Emergency.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-article"></i>
                                    </span>
                                    <span class="hide-menu">Emergency Contacts</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./District.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-alert-circle"></i>
                                    </span>
                                    <span class="hide-menu">Add District</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./Place.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-cards"></i>
                                    </span>
                                    <span class="hide-menu">Add Place</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./Services.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-file-description"></i>
                                    </span>
                                    <span class="hide-menu">Add Services</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./Userlist.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-typography"></i>
                                    </span>
                                    <span class="hide-menu">View Userlist</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="./Hospitallist.jsp" aria-expanded="false">
                                    <span>
                                        <i class="ti ti-typography"></i>
                                    </span>
                                    <span class="hide-menu">Hospital list</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <!--  Header Start -->
                <header class="app-header">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <ul class="navbar-nav">
                            <li class="nav-item d-block d-xl-none">
                                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                                    <i class="ti ti-menu-2"></i>
                                </a>
                            </li>
<!--                            <li class="nav-item">
                                <a class="nav-link nav-icon-hover" href="javascript:void(0)" onclick="sendMail()">
                                    <i class="ti ti-bell-ringing"></i>
                                    <div class="notification bg-primary rounded-circle"></div>
                                </a>
                                
                            </li>-->
                            <!--            <li class="nav-item">
                                          <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                                            <i class="ti ti-send"></i>
                                            <div class="notification bg-primary rounded-circle"></div>
                                          </a>
                                        </li>-->
                        </ul>
                        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                            <a href="javascript:void(0)" onclick="sendMail()" class="btn btn-outline-primary mx-3 mt-2 d-block">Send Reminders</a>
                            <a href="../Guest/Login.jsp" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                        </div>
                </header>
                <!--  Header End -->
                <div class="container-fluid">
