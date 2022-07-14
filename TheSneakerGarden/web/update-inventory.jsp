<%-- 
    Document   : add
    Created on : Mar 19, 2022, 10:21:47 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if (session.getAttribute("user") == null) {
        response.sendRedirect("./login");
    } else {
        if (user.getRoleID() != 1) {
            response.sendRedirect("./login");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="./components/head.jsp" %>--%>  
        <link rel="shortcut icon" href="./images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Update inventory</title>
        <style type="text/css">
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .container form .user-input {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;

            }
            form .user-input .input-user {
                margin-bottom: 15px;
                width: calc(100% / 2 - 20px);
            }
            .user-input .input-user .details {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
            }
            .input-user{
                align-items: center;
            }
            .user-input .input-user input {
                height: 45px;
                width: 100%;
                outline: none;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding-left: 15px;
                font-size: 16px;
                border-bottom-width: 2px;
                transition: all 0.3s ease;
            }

            .user-input .input-user input:focus,
            .user-input .input-user input:valid {
                border-color: #9b59b6;
            }


            .buttonAdd {
                display: flex;
                justify-content: center;
                padding-top: 50px
            }
            .buttonAdd button{
                width: 200px;
                height: 60px;
                color: white;
                background: #00C897;
                border-radius: 10px
            }
            @media (max-width: 584px) {
                .container {
                    max-width: 100%;
                }
                form .user-input .input-user {
                    margin-bottom: 15px;
                    width: 100%;
                }

            }

        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    </head>
    <body>
        <%@include file="./components/sidebar-dashboard.jsp" %>  
        <div class="main-content">
            <header>
                <div class="search-wrapper"><span class="las la-search"></span>
                    <input type="search" placeholder="Search..."/>
                </div> 
                <div class="user-wrapper">
                    <div>
                        <h4><%=user.getUserFullName()%></h4>   
                        <a  style="color: black; text-decoration: none" href="./login">Logout</a>    
                    </div>
                </div>
            </header>

            <main>
                <h3 style="display: flex;
                    justify-content: center;
                    font-size: 40px; color:#00C897  ">Update inventory</h3>

                <div style="display: flex; justify-content: center">
                    <div class="container" >
                        <form action="#">
                            <div class="user-input">
                                <div class="input-user">
                                    <span class="details">ID </span>
                                    <input
                                        placeholder="IV_001"
                                        required
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Name</span>
                                    <input
                                        placeholder="John Doe"
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Quantity</span>
                                    <input

                                        placeholder="johndoe@gmail.com"
                                        required
                                        />
                                </div>


                            </div>
                        </form>
                    </div>
                </div>




                <div class="buttonAdd"> 
                    <Button>
                        Update inventory
                    </Button>
                </div>
            </main>
        </div>
    </body>
</html>
