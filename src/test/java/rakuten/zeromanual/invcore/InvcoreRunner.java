package rakuten.zeromanual.invcore;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class InvcoreRunner {

    @Karate.Test
    Karate scenario1() {
        return Karate.run("DH-Plan")
                .scenarioName("Get Plan Info")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
}
