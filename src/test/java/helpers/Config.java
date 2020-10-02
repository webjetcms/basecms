package helpers;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class Config {

    private static String username;
    private static String password;
    private static String base_url;

    public  Config() {

        try (InputStream input = new FileInputStream("src/test/resources/config.properties")) {

            Properties prop = new Properties();

            prop.load(input);

            username= prop.getProperty("USERNAME");
            password= prop.getProperty("PASSWORD");
            base_url= prop.getProperty("BASE_URL");


        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static String getUsername() {
        return username;
    }

    public static String getPassword() {
        return password;
    }

    public static String getBase_url() {
        return base_url;
    }



}