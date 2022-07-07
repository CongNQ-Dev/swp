<!-- Navbar -->

<header class="main-container container position-sticky top-0">
    <div class="row">
        <div class="col-lg-3 col-2 logo">
            <a class="navbar-brand pb-4" href="./home">
                <img src="./images/LogoTheSneakerGarden.png" alt=""width="100px" height="150"
                     class="d-inline-block align-text-top nav-icon">
            </a>
        </div>
<!--        <div class="col-8 col-logo-title">
            <div class="d-flex justify-content-center">
                <h1 class="logo-title">The Sneaker Garden</h1>
            </div>
        </div>-->
        <div class="col-lg-9 col-2 my-auto">
            
            <nav class="navbar navbar-expand-lg navbar-dark">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar">
                        <div class="d-block">
                            <div class="d-flex">
                                <li class="nav-item" >
                                    <a id="homeActive" class="nav-link" aria-current="page" href="./home">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a id="shopActive" class="nav-link" aria-current="page" href="./shop">Shop</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Product
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a id="nikeActive" class="nav-link" aria-current="page" href="./shop?bId=1">Nike</a>
                                        <a id="adidasActive" class="nav-link" aria-current="page" href="./shop?bId=2">Adidas</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a id="aboutActive" class="nav-link" aria-current="page" href="./about.jsp">About</a>
                                </li>
                            </div>
                        </div>

                        <div class="d-block">
                            <div class="d-flex">
                                <li class="nav-item">
                                    <form action="search" class="d-flex justify-content-center">
                                        <input name="keyword" class="form-control search" type="text" placeholder="Search" aria-label="Search" 
                                               >
                                        <button type="submit" class="btn btn-black"
                                                style=" border-top-right-radius: 30px;
                                                border-bottom-right-radius: 30px;"
                                                ><i class="bi bi-search"></i></button> 
                                    </form>
                                </li>

                                <li class="nav-item dropdown" id="dropdown-profile">
                                    <button class="nav-link dropdown-toggle person"
                                            style="display: inline-block; margin-left: .5em;" id="navbarDropdown" role="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <%
                                            if (session.getAttribute("user") == null) {
                                        %>
                                            <i class="bi bi-box-arrow-in-left"></i>
                                        <%
                                        } else {
                                        %>
                                            <i class="bi bi-person-circle"></i>
                                        <%
                                            }
                                        %>

                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <%
                                            if (session.getAttribute("user") == null) {
                                        %>
                                            <li><a class="dropdown-item" href="./login">Login</a></li>
                                            <li><a class="dropdown-item" href="./register">Register</a></li>                         
                                        <%
                                        } else {
                                        %>
                                            <li><a class="dropdown-item" href="./profile.jsp">Profile</a></li>
                                            <li><a class="dropdown-item" href="./../TheSneakerGarden/OrderDetailsCustomer">History</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="#">Logout</a></li>
                                        <%
                                            }
                                        %>

                                    </ul>

                                </li>
                                <button class="btn btn-outline-success custom-btn person" type="button"
                                        style="display: inline-block; margin-left: .5em;" onclick="location.href = './cart'"><i
                                        class="bi bi-cart-plus-fill"></i></button>

                            </div>
                        </div>
                    </ul>


                </div>


            </nav>
        </div>
    </div>
</header>
