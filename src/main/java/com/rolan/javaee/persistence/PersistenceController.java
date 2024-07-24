package com.rolan.javaee.persistence;

import com.rolan.javaee.logic.User;
import java.util.List;

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
    public void createUser(User user) {
        userJpa.create(user);
    }
    
    
    
}
