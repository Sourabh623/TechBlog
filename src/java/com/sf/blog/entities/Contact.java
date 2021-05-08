
package com.sf.blog.entities;


public class Contact {
    
    private int id;
    private String name;
    private String surname;
    private String email;
    private long number;
    private String message;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    

    public Contact() {
    }

    public Contact(String name, String surname, String email, long number, String message) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.number = number;
        this.message = message;
    }

    public Contact(int id, String name, String surname, String email, long number, String message) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.number = number;
        this.message = message;
    }
    
    
    
    
}
