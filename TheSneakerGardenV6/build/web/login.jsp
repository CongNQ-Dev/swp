<%
session.setAttribute("user", null);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/head.jsp" %>
        <title>Login</title>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/login.css">
        <link href="./notification/notification.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="h-100" style="margin-top: 130px; margin-bottom: 200px">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-7 col-sm-9">
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">Login</h1>
                                <form method="POST" class="needs-validation" novalidate="" autocomplete="off" action="login"
                                      id="LoginForm">
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted">User Name</label>
                                        <input id="username" type="text" class="form-control" name="txtUserName" value=""
                                               required autofocus>
                                    </div>

                                    <div class="mb-3">
                                        <div class="mb-2 w-100">
                                            <label class="text-muted" for="password">Password</label>
                                            
                                        </div>
                                        <input id="password" type="password" class="form-control" name="txtPassword"
                                               required>
                                    </div>

                                    <div class="d-flex align-items-center">
                                        <div class="form-check">
                                            <input type="checkbox" name="remember" id="remember" class="form-check-input">
                                            <label for="remember" class="form-check-label">Remember Me</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Login
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer py-3 border-0">
                                <div class="text-center">
                                    Don't have an account? <a href="./register.jsp" class="create-one">Create One</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="components/footer.jsp" %>
        <script src="./notification/notification.js" type="text/javascript"></script>
        <script>
            function alertLogin() {
                const title = "Warnning";
                const message = ' Wrong username or password !!!';
                const position = "bottom-right";
                const duration = 1000;
                const type = 'warning';
                let callback = null;

                if (type === 'dialog') {
                  callback = (result) => {
                    console.log('result = ', result);
                    if(result === 'ok'){
                        window.location.replace("./item-management?action=delete&id="+id);
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
        </script>
        <%
            if(request.getAttribute("login") != null){
            %>
            <script>
                alertLogin();
            </script>
        <%
            }
        %>
        <script src="./js/login.js"></script>
    </body>

</html>