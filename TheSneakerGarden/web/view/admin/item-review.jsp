<%-- 
    Document   : item-review
    Created on : Jul 28, 2022, 10:13:27 AM
    Author     : Admin
--%>

<%@page import="model.Review"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("./login");
    } else {
        User user = (User) session.getAttribute("user");
        if (user.getRoleID() != 1) {
            response.sendRedirect("./login");
        } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="../../components/head.jsp" %>--%>   
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Item management</title>
        <link href="${pageContext.request.contextPath}/notification/notification.css" rel="stylesheet" type="text/css">
        <style type="text/css">
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .table-container{
                padding: 0 10%;
                margin: 40px auto 0;
            }
            .heading{
                font-size: 40px;
                text-align: center;
                color: #00C897;
                margin-bottom: 50px;
            }
            .table{
                border-collapse: collapse;
            }
            .table thead{
                background: #00C897;
            }
            .table thead tr th{
                font-size: 14px;
                font-weight: 600;
                letter-spacing: 0.35px;
                color: #fff;
                opacity: 1;
                padding: 12px;
                vertical-align: top;
                text-align: center;
                border: 1px solid #000000;
            }
            .table tbody tr td{
                font-size: 14px;
                font-weight: 600;
                letter-spacing: 0.35px;
                color: #000000;
                opacity: 1;
                padding: 8px;
                text-align: center;
                border: 1px solid #000000;
            }
            .button-add{
                padding-bottom: 20px;
                display: flex;
                justify-content: flex-end;
            }
            .button-add button{
                width: 150px;
                height: 50px;
                font-size: 18px;
                background-color: #00C897;
                color: white;
                font-weight: bold;
                border-radius: 10px;
            }
            @media (max-width: 768px){
                .table thead{
                    display: none;
                }
                .table, .table tbody, .table tr, .table td{
                    display: block;
                    width: 100%;
                }
                .table tr{
                    margin-bottom: 15px;
                }
                .table tbody tr td {
                    text-align: right;
                    padding-left: 50%;
                    position: relative;
                }
                .table td:before{
                    position: absolute;
                    left: 0;
                    width: 50%;
                    padding-left: 15px;
                    font-weight: 600;
                    font-size: 14px;
                    text-align: left;

                }
            }
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="../../components/sidebar-dashboard.jsp"%>  
        <div class="main-content">
            <header>
                <div class="search-wrapper">
                    <form action="search-product">
                        <input name="txtsearch" type="text" placeholder="Search by name..."/>
                        <button style="submit" class="btn btn-warning"><span class="las la-search"></span></button>
                    </form>
                </div> 
                <div class="user-wrapper">
                    <div>
                        <h4><%=user.getUserFullName()%></h4>   
                        <a  style="color: black; text-decoration: none" href="login">Logout</a>    
                    </div>
                </div>
            </header>
            <main>
                <div class="table-container">
                    <h1 class="heading">Item Review</h1>
                    <table class="table" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Time</th> 
                                <th>Rating</th>
                                <th>Message</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Review> listReview = (ArrayList<Review>) request.getAttribute("listReview");
                                ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
                                if (listReview != null) {
                                    for (Review rv : listReview) {
                                        for (User u : userList) {
                                            if (u.getUserId() == rv.getCustomerID()) {

                            %>
                            <tr>
                                <td><%=u.getUserAccount()%></td>
                                <td><%=rv.getReviewDate()%></td>
                                <td>
                                    <%
                                        if (rv.getRating() == 5) {
                                    %>        
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <%
                                    } else if (rv.getRating() < 5 & rv.getRating() >= 4) {
                                    %>        
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <%
                                    } else if (rv.getRating() < 4 & rv.getRating() >= 3) {
                                    %>        
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <%
                                    } else if (rv.getRating() < 3 & rv.getRating() >= 2) {
                                    %>        
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <%
                                    } else if (rv.getRating() < 2 & rv.getRating() >= 1) {
                                    %>        
                                    <i aria-hidden="true" class="fa fa-star"></i>
                                    <%
                                    } else if (rv.getRating() < 1 & rv.getRating() >= 0) {
                                    %>        

                                    <%
                                        }
                                    %>
                                </td>
                                <td><%=rv.getMessage()%></td>
                                <td><a href="#" onclick="alertDelete(<%=rv.getReviewID()%>)" style="color: red"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </a>
                                </td>
                                <%
                                            }
                                        }
                                    }
                                } else {
                                %>
                        <p>There are no reviews yet</p>
                        <%
                            }
                        %>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
        <div class="overlay"></div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/notification/notification.js" type="text/javascript"></script>
        <script>
                                    var myParam = location.search.split('id=')[1].charAt(0);
                                    function alertDelete(id) {
                                        const title = "Warnning";
                                        const message = ' Are you want to delete this item?';
                                        const position = "center";
                                        const duration = 3000;
                                        const type = 'dialog';
                                        let callback = null;

                                        if (type === 'dialog') {
                                            callback = (result) => {
                                                console.log('result = ', result);
                                                if (result === 'ok') {
                                                    //sleep(3500).then(() => { window.location.replace("./item-management?action=delete&id="+id) });
                                                    window.location.replace("./ReviewControl?action=delete&id="+myParam+"&rid=" + id);
                                                }
                                            };
                                        }

                                        const popup = Notification({
                                            position: position,
                                            duration: duration
                                        });

                                        if (!popup[type]) {
                                            popup.error({
                                                title: 'Error',
                                                message: `Notification has no such method "${type}"`
                                            });
                                            return;
                                        }

                                        popup[type]({
                                            title: title,
                                            message: message,
                                            callback: callback
                                        });
                                    }

                                    function alertSuccess() {
                                        const title = "Delete";
                                        const message = 'Delete product success';
                                        const position = "bottom-right";
                                        const duration = 3000;
                                        const type = 'success';
                                        let callback = null;

                                        const popup = Notification({
                                            position: position,
                                            duration: duration
                                        });

                                        if (!popup[type]) {
                                            popup.error({
                                                title: 'Error',
                                                message: `Notification has no such method "${type}"`
                                            });
                                            return;
                                        }

                                        popup[type]({
                                            title: title,
                                            message: message,
                                            callback: callback
                                        });
                                    }
                                    function sleep(ms) {
                                        return new Promise(resolve => setTimeout(resolve, ms));
                                    }
        </script>
        <%
            if (request.getAttribute("delete") != null) {
        %>
        <script>
            alertSuccess();
        </script>
        <%
            }
        %>
    </body>

</html>
<%
        }
    }
%>