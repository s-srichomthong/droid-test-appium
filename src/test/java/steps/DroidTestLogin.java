package steps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.BaseSettings;
import io.appium.java_client.AppiumDriver;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import utils.AppLogin;

import java.net.MalformedURLException;
import java.util.concurrent.TimeUnit;

public class DroidTestLogin {

    private final AppiumDriver<WebElement> driver;

    public DroidTestLogin() throws MalformedURLException {
        driver = BaseSettings.getDriver();
    }

    @Given("I'm a application user I login with \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void iLoginWithUsernameAndPassword(String email, String password) throws Throwable {
        driver.launchApp();
        implicitWait(5);
        driver.resetApp();
        implicitWait(5);
        driver.launchApp();
        implicitWait(5);

        final AppLogin loginPage = new AppLogin(driver, email, password);
        loginPage.typingLogin();
    }

    @When("I click to login")
    public void IClickLogIn(){
        implicitWait(5);
        driver.findElementById("com.srichomthong.droidtest:id/login").click();
    }

    @Then("I should successfully loin to the application and see the Main page")
    public void iShouldLoginToMain(){
        implicitWait(5);
        final WebElement landingPoint  = driver.findElementById("com.srichomthong.droidtest:id/act_main_username");
        Assert.assertTrue(landingPoint.isDisplayed());
    }

    @And("I will see welcome text of my \"([^\"]*)\"")
    public void iWillSeeMyName(String name) {
        implicitWait(5);
        final WebElement landingPoint  = driver.findElementById("com.srichomthong.droidtest:id/act_main_username");
        Assert.assertTrue(landingPoint.isDisplayed());
        Assert.assertEquals(name, landingPoint.getText());
    }

    private void implicitWait(final int seconds) {
        driver.manage().timeouts().implicitlyWait(seconds, TimeUnit.SECONDS);
    }
}
