package rakuten.zeromanual.SPHelper;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class SPHelperRunner {
    @Karate.Test
    Karate scenario1() {
        return Karate.run("SPHelper.feature")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

}
