<%@page import="model.Inventory"%>
<%@page import="model.Size"%>
<%@page import="dbmanager.ProductManager"%>
<%@page import="model.Product"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>
        <title>Product Size</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link href="${pageContext.request.contextPath}/css/history.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="../../components/sidebar-dashboard.jsp" %>
        <%
            Product pro = (Product) request.getAttribute("Product");
        %>
        <section class="h-100" style="margin-top: 80px">
            <div class="container h-100 py-5 d-flex justify-content-center align-items-center">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Product Size</h3>
                        </div>
                        <div class="button-add">
                        <button type="button" onclick="location.href = './add-size.jsp?id=<%=pro.getId()%>'" ><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                            </svg>Add New</button>
                    </div>
                        <%
                            ArrayList<Inventory> list = (ArrayList<Inventory>)request.getAttribute("ListInv");
                            for (Inventory inv : list) {
                        %>

                        <div id="myCart">
                            <div class="card artItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="<%=pro.getImage()%>" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2"><%=pro.getName()%></p></div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            Quantity: <%=inv.getQuantity()%>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">Size: <%=inv.getSizeNum() %></h5>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- MDB -->
        <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/notification/notification.js" type="text/javascript"></script>
        <script>
            function alertSuccess() {
                const title = "Message";
                const message = 'Add new size success';
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
            if(request.getAttribute("addSize") != null){
                %>
                <script>
                    alertSuccess();
                </script>
        <%
            }
        %>
</html>