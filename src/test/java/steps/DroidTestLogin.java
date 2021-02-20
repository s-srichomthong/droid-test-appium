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
import utils.Methods;

import java.net.MalformedURLException;
import java.util.concurrent.TimeUnit;

public class DroidTestLogin {

    private final AppiumDriver<WebElement> driver;

    public DroidTestLogin() throws MalformedURLException {
        driver = BaseSettings.getDriver();
    }

    @Given("I'm a application user I login with \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void customerExistingToDBankAndEligibleForCampaign(String email, String password) throws Throwable {
        driver.launchApp();
        implicitWait(5);
        driver.resetApp() ; // reset cache
        implicitWait(5);
        driver.launchApp();
        final AppLogin loginPage = new AppLogin(driver, email, password);
        loginPage.login();
        final WebElement landingPoint  = driver.findElementById("th.co.scb.scbeasy:id/main_landing_mock_img_top");
        landingPoint.click();
        implicitWait(3);
    }

    @When("I click to login")
    public void IClickLogIn(){

    }

    @Then("I should successfully loin to the application and see the Main page")
    public void iShouldLoinToMain(){

    }

    @And("I will see welcome text of my \"([^\"]*)\"")
    public void iWillSeeMyName() {

    }

    private void implicitWait(final int seconds) {
        driver.manage().timeouts().implicitlyWait(seconds, TimeUnit.SECONDS);
    }
}
