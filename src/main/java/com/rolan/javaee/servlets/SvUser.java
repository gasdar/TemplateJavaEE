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
import java.util.ArrayList;
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
        
        response.sendRedirect("./private/users.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener datos desde la instancia HttpServletRest 'request'
        String userDni = request.getParameter("user_dni");
        String username = request.getParameter("username");
        String userEmail = request.getParameter("user_email");
        String userPass = request.getParameter("user_pass");
        
        User user = control.createUser(userDni, username, userEmail, userPass);
        HttpSession session = request.getSession();
        if(user != null) {
            session.setAttribute("successful", "El usuario se ha registrado correctamente!");            
            response.sendRedirect("index.jsp");
        } else {
            session.setAttribute("failed", "El usuario no se ha podido registrar!");            
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
