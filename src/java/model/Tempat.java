/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Tempat {

    private int placeID;
    private String namaTempat;
    private String alamat;
    private String kategori;
    private String foto;
    private Integer rating;
    private Integer rataRata;

    public Tempat() {
    }

    public Tempat(int placeID, String namaTempat, String alamat,
                  String kategori, String foto, Integer rating) {
        this.placeID = placeID;
        this.namaTempat = namaTempat;
        this.alamat = alamat;
        this.kategori = kategori;
        this.foto = foto;
        this.rating = rating;
    }

    public int getPlaceID() {
        return placeID;
    }

    public void setPlaceID(int placeID) {
        this.placeID = placeID;
    }

    public String getNamaTempat() {
        return namaTempat;
    }

    public void setNamaTempat(String namaTempat) {
        this.namaTempat = namaTempat;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
    
    public Integer getRataRata() {
        return rataRata;
    }

    public void setRataRata(Integer rataRata) {
        this.rataRata = rataRata;
    }
}
