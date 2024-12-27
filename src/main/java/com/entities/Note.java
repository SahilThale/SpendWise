package com.entities;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "notes")
public class Note {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;

    @Column(length = 1500)
    private String content;

    private Date addedDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private Users user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = true) // Allow null for category
    private Category category;

    // Default constructor
    public Note() {
        super();
    }

    // Constructor without 'id' (for creating new Notes)
    public Note(String title, String content, Date addedDate, Users user, Category category) {
        super();
        this.title = title;
        this.content = content;
        this.addedDate = addedDate;
        this.user = user;
        this.category = category;
    }

    // Constructor with 'id' (for retrieving Notes with a known ID)
    public Note(int id, String title, String content, Date addedDate, Users user, Category category) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
        this.addedDate = addedDate;
        this.user = user;
        this.category = category;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
