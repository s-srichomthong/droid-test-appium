package driver;

import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

public class BaseSettings {
    private static final Map<String, String> environmentVariables = System.getenv();

    private static AppiumDriver<WebElement> driver;

    public static AppiumDriver<WebElement> getDriver() throws MalformedURLException {
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("platformName", "Android");
        capabilities.setCapability("fullReset", "false");
        capabilities.setCapability("noReset", "true");
        capabilities.setCapability("appPackage", "th.co.scb.scbeasy");
        capabilities.setCapability("appActivity", "th.co.scb.scbeasy.login.LoginActivity");
        capabilities.setCapability("autoLaunch", "false");

        if (driver == null)
            driver = new AppiumDriver<WebElement>(new URL("http://127.0.0.1:4723/wd/hub"), capabilities) {
                @Override
                public WebElement scrollTo(String s) {
                    return null;
                }

                @Override
                public WebElement scrollToExact(String s) {
                    return null;
                }
            };
        return driver;
    }

    public static void closeDriver() {
        if (driver == null) {
            return;
        }
        driver.closeApp();
        driver.quit();
        driver = null;
    }

    private BaseSettings() {}
}
