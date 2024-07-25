package com.rolan.javaee.servlets;

import com.rolan.javaee.logic.LogicalController;
import com.rolan.javaee.logic.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "SvUser", urlPatterns = {"/SvUser"})
public class SvUser extends HttpServlet {

    private LogicalController control = null;
    
    public SvUser() {
        this.control = new LogicalController();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<User> userLists = this.control.findAllUsers();
        
        /*La sesión siempre se crea de forma automática cuando un usuario entra a
        la web, de manera correcta, se autentica de manera baja*/
        HttpSession session = request.getSession();
        session.setAttribute("user_lists", userLists);
        session.setAttribute("delete_failed", "null");
        session.setAttribute("delete_successful", "null");
        session.setAttribute("register_failed", "null");
        session.setAttribute("register_successful", "null");
        session.setAttribute("unspecified_action", "null");
        
        response.sendRedirect("./private/users.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userDelete = request.getParameter("user_delete");
        String userRegister = request.getParameter("user_register");
        HttpSession session = request.getSession();
        
        if(userDelete!=null && !userDelete.isEmpty() && userDelete.equalsIgnoreCase("true")) {
            // Eliminamos usuario
            String userId = request.getParameter("user_id");
            User user = control.delete(userId);
            if(user != null) {
                session.setAttribute("delete_successful", "La eliminación se ha realizado correctamente!");
                session.setAttribute("delete_failed", "null");
            } else {
                session.setAttribute("delete_failed", "No se ha encontrado el registro para ser eliminado!");
                session.setAttribute("delete_successful", "null");
            }
            session.setAttribute("unspecified_action", "null");
        } else if(userRegister!=null && !userRegister.isEmpty() && userRegister.equalsIgnoreCase("true")) {
            // Obtener datos desde la instancia HttpServletRest 'request'
            String userDni = request.getParameter("user_dni");
            String username = request.getParameter("username");
            String userEmail = request.getParameter("user_email");
            String userPass = request.getParameter("user_pass");
            User user = control.createUser(userDni, username, userEmail, userPass);
            if(user != null) {
                session.setAttribute("register_successful", "El usuario se ha registrado correctamente!");            
                session.setAttribute("register_failed", "null");
            } else {
                session.setAttribute("register_failed", "El usuario no se ha podido registrar!");            
                session.setAttribute("register_successful", "null");
            }
            session.setAttribute("unspecified_action", "null");
        } else {
            // No se específica acción
            session.setAttribute("unspecified_action", "No se ha específicado la funcionalidad correctamente!");
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
