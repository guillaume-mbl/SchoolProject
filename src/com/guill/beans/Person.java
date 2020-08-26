package com.guill.beans;

public class Person {

	private String nom;
    private String prenom;
    private boolean majeur;
   
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public boolean isMajeur() {
        return majeur;
    }
    public void setMajeur(boolean majeur) {
        this.majeur = majeur;
    }
}
