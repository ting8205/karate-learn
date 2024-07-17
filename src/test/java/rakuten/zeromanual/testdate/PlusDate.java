package rakuten.zeromanual.testdate;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class PlusDate {
    @Karate.Test
    Karate scenario() {
        return Karate.run("plusdate.feature")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario1() {
        return Karate.run("plusdate.feature")
                .scenarioName("html extract by regex")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

}
