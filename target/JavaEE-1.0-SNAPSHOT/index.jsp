<%--
    Nada más que decir, hay que iniciar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/app.css">
        <title>Java EE</title>
    </head>
    <body>
        
        <nav class="usernav">
            <ul class="userlist">
                <li class="userlist__item">
                    <div class="userlist__button">
                        <img src="assets/svgs/home.svg" alt="main icon" class="userlist__icon"/>
                        <a href="#" class="usernav__link">Inicio</a>
                    </div>
                </li>
                
                <li class="userlist__item">
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
                
                <li class="userlist__item">
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
        
        <div class="userdata contenedor seccion">
            <h2 class="userdata__heading">Datos del Usuario</h2>
            
            <div>
                <form action="SvUser" method="POST" class="info">
                    <div class="mb-3">
                      <label for="user_dni" class="form-label">DNI</label>
                      <input type="text" class="form-control" id="user_dni" name="user_dni">
                    </div>
                    <div class="mb-3">
                      <label for="username" class="form-label">Nombre</label>
                      <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="mb-3">
                      <label for="user_email" class="form-label">Email</label>
                      <input type="email" class="form-control" id="user_email" name="user_email">
                    </div>
                    <div class="mb-3">
                      <label for="user_pass" class="form-label">Password</label>
                      <input type="password" class="form-control" id="user_pass" name="user_pass">
                    </div>
                    <button type="submit" class="btn btn-primary">Registrar</button>
                  </form>
            </div>
        </div>
        
        <div class="allusers contenedor seccion" >
            <h2>Ver Usuarios</h2>
            <div class="info">
                <p>Para ver a los usuarios del sistema haga click en el siguiente botón</p>
                <form action="SvUser" method="GET">
                    <input type="submit" value="Ver Usuarios" class="btn btn-primary">
                </form>
            </div>
        </div>
        
        <div>
            <img src="./assets/svgs/leaf.svg" alt="hoja">
        </div>
        
        
        <script src="./assets/js/main.js"></script>
    </body>
</html>
