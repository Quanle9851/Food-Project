/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

/**
 *
 * @author Bao
 */
public class UserError {
    private String fullNameError;
    private String userIDError;
    private String passwordError;
    private String confirmError;
    private String phoneError;

    public UserError() {
        this.fullNameError = "";
        this.userIDError = "";
        this.passwordError = "";
        this.confirmError = "";
         this.phoneError = "";
    }

    public UserError(String fullNameError, String userIDError, String passwordError, String confirmError, String phoneError) {
        this.fullNameError = fullNameError;
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.phoneError = phoneError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }
    
    
    
}
