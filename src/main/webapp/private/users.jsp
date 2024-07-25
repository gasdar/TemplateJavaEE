<%-- 
    Document   : users.jsp
    Created on : 22-07-2024, 22:35:53
    Author     : Eliulson
--%>
<%@page import="com.rolan.javaee.logic.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Info</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../assets/css/main.css">
    </head>
    <body>
        <%
            List<User> userLists = (List) request.getSession().getAttribute("user_lists");
        %>
        <main class="userflex">
            <nav class="usernav">
                <ul class="userlist">
                    <li class="userlist__item">
                        <div class="userlist__button">
                            <img src="../assets/svgs/home.svg" alt="main icon" class="userlist__icon"/>
                            <a href="../index.jsp" class="usernav__link">Inicio</a>
                        </div>
                    </li>

                    <li class="userlist__item userlist__item--click">
                        <div class="userlist__button userlist__button--click">
                            <img src="../assets/svgs/docs.svg" alt="document icons" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Servicios</a>
                            <img src="../assets/svgs/arrow.svg" alt="arrow icon" class="userlist__arrow"/>
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
                            <img src="../assets/svgs/stats.svg" alt="stats icon" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Estadísticas</a>
                        </div>
                    </li>

                    <li class="userlist__item userlist__item--click">
                        <div class="userlist__button userlist__button--click">
                            <img src="../assets/svgs/notification.svg" alt="bell icon" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Notificaciones</a>
                            <img src="../assets/svgs/arrow.svg" alt="arrow icon" class="userlist__arrow"/>
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
                            <img src="../assets/svgs/contact.svg" alt="contact icon" class="userlist__icon"/>
                            <a href="#" class="usernav__link">Contacto</a>
                        </div>
                    </li>
                </ul>
            </nav>

            <div class="useraction">
                
                <h2>Lista de Usuarios del Sistema</h2>
                
                <table class="table table-dark table-hover mb-2">
                    <thead>
                        <tr>
                            <th>N° User</th>
                            <th>DNI</th>
                            <th>Username</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for(User user : userLists) {%>
                        <tr>
                            <td><%=user.getId()%></td>
                            <td><%=user.getDni()%></td>
                            <td><%=user.getUsername()%></td>
                            <td><%=user.getEmail()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <%if(userLists.isEmpty()){%>
                <div class="form-text alert alert-danger">Aún no existen registros en la BD!</div>
                <%}%>
                
            </div>
        </main>
        
        <script src="../assets/js/main.js"></script>
    </body>
</html>
