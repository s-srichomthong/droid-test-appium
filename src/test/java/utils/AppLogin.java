package utils;

import driver.BaseSettings;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.net.MalformedURLException;
import java.util.concurrent.TimeUnit;

public class AppLogin {

    private final AppiumDriver driver;
    private String email;
    private String password;

    public AppLogin(AppiumDriver driver, String email, String password) throws MalformedURLException {
        this.driver = driver;
        this.email = email;
        this.password = password;
    }

    public void typingLogin(){
        implicitWait(5);
        final WebElement usernameEdt = driver.findElementById("com.srichomthong.droidtest:id/username");
        usernameEdt.sendKeys(email);
        implicitWait(2);

        final WebElement passwordEdt = driver.findElementById("com.srichomthong.droidtest:id/password");
        passwordEdt.sendKeys(password);
        implicitWait(2);
    }

    private void implicitWait(final int seconds) {
        driver.manage().timeouts().implicitlyWait(seconds, TimeUnit.SECONDS);
    }

}
