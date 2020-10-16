package models;

public class UserModel {
    /**
     * Class to create user for login to WebJet.
     * @param userName user name
     * @param password password
     */
    public UserModel(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    private final String userName;
    private final String password;

}
