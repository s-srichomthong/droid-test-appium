package steps;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "json:target/cucumber/cucumber.json", "junit:target/cucumber/cucumber.xml", "rerun:target/cucumber/rerun.txt"},
        features = {"src/test/resources/features/droid-test"}
)
public class DroidTest {
}
