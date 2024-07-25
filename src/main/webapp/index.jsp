<%--
    Nada más que decir, hay que iniciar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/main.css">
        <title>Java EE</title>
    </head>
    <body>
        <main class="userflex">
            <nav class="usernav">
                <ul class="userlist">
                    <li class="userlist__item">
                        <div class="userlist__button">
                            <img src="assets/svgs/home.svg" alt="main icon" class="userlist__icon"/>
                            <a href="./index.jsp" class="usernav__link">Inicio</a>
                        </div>
                    </li>

                    <li class="userlist__item userlist__item--click">
                        <div class="userlist__button userlist__button--click">
                            <img src="assets/svgs/docs.svg" alt="document icons" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Servicios</a>
                            <img src="assets/svgs/arrow.svg" alt="arrow icon" class="userlist__arrow"/>
                        </div>

                        <ul class="userlist__show">
                            <li class="userlist__inside">
                                <a href="#" class="usernav__link usernav__link--inside">Estoy dentro</a>
                            </li>

                            <li class="userlist__inside">
                                <a href="#" class="usernav__link usernav__link--inside">Estoy dentro</a>
                            </li>
                        </ul>
                    </li>

                    <li class="userlist__item">
                        <div class="userlist__button">
                            <img src="assets/svgs/stats.svg" alt="stats icon" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Estadísticas</a>
                        </div>
                    </li>

                    <li class="userlist__item userlist__item--click">
                        <div class="userlist__button userlist__button--click">
                            <img src="assets/svgs/notification.svg" alt="bell icon" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Notificaciones</a>
                            <img src="assets/svgs/arrow.svg" alt="arrow icon" class="userlist__arrow"/>
                        </div>

                        <ul class="userlist__show">
                            <li class="userlist__inside">
                                <a href="#" class="usernav__link usernav__link--inside">Estoy dentro</a>
                            </li>

                            <li class="userlist__inside">
                                <a href="#" class="usernav__link usernav__link--inside">Estoy dentro</a>
                            </li>

                            <li class="userlist__inside">
                                <a href="#" class="usernav__link usernav__link--inside">Estoy dentro</a>
                            </li>
                        </ul>
                    </li>

                    <li class="userlist__item">
                        <div class="userlist__button">
                            <img src="assets/svgs/contact.svg" alt="contact icon" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Contacto</a>
                        </div>
                    </li>
                </ul>
            </nav>

            <div class="useraction">
                <div class="userregister mb-5">
                    <h2>Datos del Usuario</h2>

                    <div>
                        <form action="SvUser" method="POST" class="info">
                            <div class="mb-3">
                              <label for="user_dni" class="form-label">DNI</label>
                              <input type="text" class="form-control" id="user_dni" name="user_dni" required>
                            </div>
                            <div class="mb-3">
                              <label for="username" class="form-label">Nombre</label>
                              <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                              <label for="user_email" class="form-label">Email</label>
                              <input type="email" class="form-control" id="user_email" name="user_email" required>
                            </div>
                            <div class="mb-3">
                              <label for="user_pass" class="form-label">Password</label>
                              <input type="password" class="form-control" id="user_pass" name="user_pass" required>
                            </div>
                            <input type="hidden" name="user_register" value="true">
                            <button type="submit" class="btn btn-primary">Registrar</button>
                            
                            <%  String regSuccessful = String.valueOf(request.getSession().getAttribute("register_successful"));
                                String regFailed = String.valueOf(request.getSession().getAttribute("register_failed"));
                                if(!regSuccessful.equalsIgnoreCase("null")) {%>
                            <div class="mt-3 form-text alert alert-success" role="alert">
                                <%=regSuccessful%>
                            </div>
                              <%} else if(!regFailed.equalsIgnoreCase("null")) {%>
                            <div class="mt-3 form-text alert alert-warning" role="alert">
                                <%=regFailed%>
                            </div>
                              <%}%>
                        </form>
                    </div>
                </div>

                <div class="userall mb-5" >
                    <h2>Ver Usuarios</h2>
                    <div class="info">
                        <p>Para ver a los usuarios del sistema haga click en el siguiente botón.</p>
                        <form action="SvUser" method="GET">
                            <input type="submit" value="Ver Usuarios" class="btn btn-primary"/>
                        </form>
                    </div>
                </div>
                        
                <div class="userdelete mb-5">
                    <h2>Eliminar Usuario</h2>
                    <div class="info">
                        <p>Para eliminar un usuario concreto ingrese el id.</p>
                        <form action="SvUser" method="POST">
                            <div class="mb-3">
                                <label for="user_id" class="form-label">Id Usuario:</label>
                                <input type="number" class="form-control" id="user_id" name="user_id" min="0" required>
                            </div>
                            <input type="hidden" name="user_delete" value="true">
                            <input type="submit" value="Eliminar Usuario" class="btn btn-danger"/>
                        </form>
                        <%
                        String delSuccessful = String.valueOf(request.getSession().getAttribute("delete_successful"));
                        String delFailed = String.valueOf(request.getSession().getAttribute("delete_failed"));
                        if(!delSuccessful.equalsIgnoreCase("null")) {
                        %>
                        <div class="mt-3 info form-text alert alert-success" role="alert"><%=delSuccessful%></div>
                        <%} else if(!delFailed.equalsIgnoreCase("null")) {%>
                        <div class="mt-3 info form-text alert alert-warning" role="alert" ><%=delFailed%></div>
                        <%}%>
                    </div>
                </div>
            </div>
            <%  String nonActionUser = String.valueOf(request.getSession().getAttribute("unspecified_action"));
                if(!nonActionUser.equalsIgnoreCase("null")) {%>
            <div class="mt-3 info form-text alert alert-warning" role="alert"><%=nonActionUser%></div>
            <%}%>
        </main>
        
        <script src="./assets/js/main.js"></script>
    </body>
</html>
