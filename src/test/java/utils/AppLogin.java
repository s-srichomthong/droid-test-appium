package utils;

import driver.BaseSettings;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.net.MalformedURLException;
import java.util.concurrent.TimeUnit;

public class AppLogin {

    private final AppiumDriver driver;
    private String rmId;

    public AppLogin(AppiumDriver driver, String email, String rmId) throws MalformedURLException {
        this.driver = driver;
        this.rmId = rmId;
    }

    public void login(){
        implicitWait(5);
        final WebElement userName = driver.findElementById("th.co.scb.scbeasy:id/act_login_edt_username");
        userName.sendKeys(rmId);
        implicitWait(2);
        driver.findElementById("th.co.scb.scbeasy:id/act_btn_login").click();
        implicitWait(5);
    }

    private void implicitWait(final int seconds) {
        driver.manage().timeouts().implicitlyWait(seconds, TimeUnit.SECONDS);
    }

}
