package com.rolan.javaee.logic;

public class User {
    
    private String dni;
    private String username;
    private String email;
    private String password;

    public User() {
    }
    public User(String dni, String username, String email, String password) {
        this.dni = dni;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public String getDni() {
        return dni;
    }
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
}
