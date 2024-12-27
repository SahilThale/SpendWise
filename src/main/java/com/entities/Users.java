package com.entities;


import javax.persistence.*;

@Entity
@Table(name = "users")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String username;  // Renamed to lowercase "username"
    private String email;
    private String password;

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;  // Lowercase "username"
    }

    public void setUsername(String username) {
        this.username = username;  // Lowercase "username"
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

    // Constructors
    public Users(int id, String username, String email, String password) {
        super();
        this.id = id;
        this.username = username;  // Lowercase "username"
        this.email = email;
        this.password = password;
    }

    public Users() {
        super();
    }
}
