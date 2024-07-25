package com.rolan.javaee.logic;

import com.rolan.javaee.persistence.PersistenceController;
import java.util.List;

public class LogicalController {
    
    // INSTANCIA DE COMUNICACIÓN CON CONSULTAS EN LA BASE DE DATOS
    private PersistenceController persisController = null;
    
    public LogicalController() {
        this.persisController = new PersistenceController();
    }
    
    // ACCIONES RELACIONADAS CON: USER
    public List<User> findAllUsers() {
        return this.persisController.findAllUsers();
    }
    private User findUserById(int userId) {
        return this.persisController.findUserById(userId);
    }
    private User findUserByUsernameOrEmailAndPassword(String userDni, String username, String userPass) {
        List<User> usersDB = this.findAllUsers();
        if(!usersDB.isEmpty()) {
            for(User user : usersDB) {
                if( user.getDni().equals(userDni) && user.getUsername().equals(username) && user.getPassword().equals(userPass) ){
                    return user;
                }
            }
        }
        return null;
    }
    public User createUser(String userDni, String username, String userEmail, String userPass) {
        User newUser = new User(userDni, username, userEmail, userPass);
        
        // Los campos, ya se encuentran verificados y se crea el usuario
        this.persisController.createUser(newUser);
        User userDB = this.findUserByUsernameOrEmailAndPassword(userDni, username, userPass);
        
        return (userDB != null) ? userDB : null;
    }
    public User delete(String userId) {
        User user;
        try {
            int id = Integer.parseInt(userId);
            user = this.findUserById(id);
            System.out.println("USUARIO BUSCADO");
            System.out.println("ID: " + id);
            System.out.println("USER: " + user);
            if(user != null) {
                this.persisController.deleteUser(user.getId());
            }
            return user;
        } catch(NumberFormatException e) {
            return null;
        }
    }
    
}
