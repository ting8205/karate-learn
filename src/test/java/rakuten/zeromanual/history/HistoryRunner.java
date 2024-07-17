package rakuten.zeromanual.history;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class HistoryRunner {
    @Karate.Test
    Karate scenario() {
        return Karate.run("history")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
}
