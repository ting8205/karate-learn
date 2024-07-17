package rakuten.zeromanual.RConnectMaintenancepage;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class RConnectMaintenancepageRunner {

    @Karate.Test
    Karate scenario1() {
        return Karate.run("rconnect-maintenance-page")
                .tags("tc001")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
}
