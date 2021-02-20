package utils;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.TouchAction;

public class Methods {

    public static void scrollDown(AppiumDriver driver) {
        //if pressX was zero it didn't work for me
        int pressX = driver.manage().window().getSize().width / 2;
        // 4/5 of the screen as the bottom finger-press point
        int bottomY = driver.manage().window().getSize().height * 4/5;
        // just non zero point, as it didn't scroll to zero normally
        int topY = driver.manage().window().getSize().height / 8;
        //scroll with TouchAction by itself
        scroll(driver, pressX, bottomY, pressX, topY);
    }

    public static void scroll(AppiumDriver driver, int fromX, int fromY, int toX, int toY) {
        TouchAction touchAction = new TouchAction(driver);
        touchAction.longPress(fromX, fromY).moveTo(toX, toY).release().perform();
    }


}
