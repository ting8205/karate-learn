package rakuten.utils;

import com.intuit.karate.Logger;
import com.intuit.karate.RuntimeHook;
import com.intuit.karate.core.ScenarioRuntime;
import com.intuit.karate.driver.Driver;

import java.util.ArrayList;
import java.util.List;

public class CleanUpHook implements RuntimeHook {
    Logger logger = new Logger();
    private static List<Driver> driverCollection = new ArrayList<>();

    public static void collectDrivers(Driver driver) {
        driverCollection.add(driver);
    }

    @Override
    public void afterScenario(ScenarioRuntime sr) {
        driverCollection.forEach(driver -> driver.close());
        RuntimeHook.super.afterScenario(sr);
    }
}
