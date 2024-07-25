package com.rolan.javaee.persistence;

import com.rolan.javaee.logic.User;
import com.rolan.javaee.persistence.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersistenceController {
    
    // Controladora que tendrá todas las instancias de clases JPA
    private UserJpaController userJpa = null;
    
    // Instanciamos en controlador vacío.
    public PersistenceController() {
        userJpa = new UserJpaController();
    }
    
    // CRUD EN BASE DE DATOS CON: USER
    public List<User> findAllUsers() {
        return userJpa.findUserEntities();
    }
    public User findUserById(int userId) {
        return userJpa.findUser(userId);
    }
    public void createUser(User user) {
        userJpa.create(user);
    }
    public void deleteUser(int id) {
        try {
            userJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
