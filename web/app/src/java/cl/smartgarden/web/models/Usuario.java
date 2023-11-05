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
public class Usuario {
    int idUsuario;
    String nombreUsuario;
    String apellidoUsuario;
    String emailUsuario;
    String passwordUsuario;
    Date fechaAltaUsuario;
    String avatarUsuario;
    int dispositivoActualUsuario;
    String idFacebookUsuario;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombreUsuario, String apellidoUsuario, String emailUsuario, String passwordUsuario, Date fechaAltaUsuario, String avatarUsuario, int dispositivoActualUsuario, String idFacebookUsuario) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.emailUsuario = emailUsuario;
        this.passwordUsuario = passwordUsuario;
        this.fechaAltaUsuario = fechaAltaUsuario;
        this.avatarUsuario = avatarUsuario;
        this.dispositivoActualUsuario = dispositivoActualUsuario;
        this.idFacebookUsuario = idFacebookUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public String getApellidoUsuario() {
        return apellidoUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public String getPasswordUsuario() {
        return passwordUsuario;
    }

    public Date getFechaAltaUsuario() {
        return fechaAltaUsuario;
    }

    public String getAvatarUsuario() {
        return avatarUsuario;
    }

    public int getDispositivoActualUsuario() {
        return dispositivoActualUsuario;
    }

    public String getIdFacebookUsuario() {
        return idFacebookUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }

    public void setFechaAltaUsuario(Date fechaAltaUsuario) {
        this.fechaAltaUsuario = fechaAltaUsuario;
    }

    public void setAvatarUsuario(String avatarUsuario) {
        this.avatarUsuario = avatarUsuario;
    }

    public void setDispositivoActualUsuario(int dispositivoActualUsuario) {
        this.dispositivoActualUsuario = dispositivoActualUsuario;
    }

    public void setIdFacebookUsuario(String idFacebookUsuario) {
        this.idFacebookUsuario = idFacebookUsuario;
    }
        
}
