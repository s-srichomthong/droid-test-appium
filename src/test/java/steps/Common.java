package steps;

import cucumber.api.java.After;
import driver.BaseSettings;

public class Common {
    @After
    public void cleanup() {
        BaseSettings.closeDriver();
    }
}
