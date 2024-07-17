package rakuten.zeromanual.TIDP_9080;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class TIDP9080Runner {
    @Karate.Test
    Karate scenario1() {
        return Karate.run("TIDP9080.feature")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

}