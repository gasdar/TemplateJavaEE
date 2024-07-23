package com.rolan.javaee.servlets;

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


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener Lista de usuarios "BD Lógica"
        List<User> userLists = new ArrayList<>();
        userLists.add(new User("11.111.111-1", "Pepe", "pepe@gmail.com", "123"));
        userLists.add(new User("22.222.222-2", "Rolan", "rolan@gmail.com", "123"));
        userLists.add(new User("33.333.333-3", "Maria", "maria@gmail.com", "123"));
        userLists.add(new User("44.444.444-4", "Camila", "camila@gmail.com", "123"));
        
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
        
        System.out.println("userDni = " + userDni);
        System.out.println("username = " + username);
        System.out.println("userEmail = " + userEmail);
        System.out.println("userPass = " + userPass);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
