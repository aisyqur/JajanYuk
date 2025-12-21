/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

public class Login {
    private String username;
    private String password;

    public Login() {}

    public Login(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Getter & Setter
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Validasi input
    public boolean validateUser() {
        if (username == null || username.isEmpty()) return false;
        if (password == null || password.isEmpty()) return false;
        return true;
    }
}