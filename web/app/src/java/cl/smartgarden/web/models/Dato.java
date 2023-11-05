/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.smartgarden.web.models;

import java.util.Date;

/**
 *
 * @author Roberto Vargas <robertoignaciovargas@gmail.com>
 */
public class Dato {

    int idDispositivo;
    Date fechaDato;
    float temperaturaAmbiente;
    int humedadAmbiente;
    int nivelAgua;
    int nivelLuz;
    int humedadSuelo;

    public Dato() {
    }

    public Dato(int idDispositivo, Date fechaDato, float temperaturaAmbiente, int humedadAmbiente, int nivelAgua, int nivelLuz, int humedadSuelo) {
        this.idDispositivo = idDispositivo;
        this.fechaDato = fechaDato;
        this.temperaturaAmbiente = temperaturaAmbiente;
        this.humedadAmbiente = humedadAmbiente;
        this.nivelAgua = nivelAgua;
        this.nivelLuz = nivelLuz;
        this.humedadSuelo = humedadSuelo;
    }

    public int getIdDispositivo() {
        return idDispositivo;
    }

    public Date getFechaDato() {
        return fechaDato;
    }

    public float getTemperaturaAmbiente() {
        return temperaturaAmbiente;
    }

    public int getHumedadAmbiente() {
        return humedadAmbiente;
    }

    public int getNivelAgua() {
        return nivelAgua;
    }

    public int getNivelLuz() {
        return nivelLuz;
    }

    public int getHumedadSuelo() {
        return humedadSuelo;
    }

    public void setIdDispositivo(int idDispositivo) {
        this.idDispositivo = idDispositivo;
    }

    public void setFechaDato(Date fechaDato) {
        this.fechaDato = fechaDato;
    }

    public void setTemperaturaAmbiente(float temperaturaAmbiente) {
        this.temperaturaAmbiente = temperaturaAmbiente;
    }

    public void setHumedadAmbiente(int humedadAmbiente) {
        this.humedadAmbiente = humedadAmbiente;
    }

    public void setNivelAgua(int nivelAgua) {
        this.nivelAgua = nivelAgua;
    }

    public void setNivelLuz(int nivelLuz) {
        this.nivelLuz = nivelLuz;
    }

    public void setHumedadSuelo(int humedadSuelo) {
        this.humedadSuelo = humedadSuelo;
    }

}
