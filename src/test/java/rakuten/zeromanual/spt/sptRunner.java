package rakuten.zeromanual.spt;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class sptRunner {
    @Karate.Test
    Karate scenario1() {
        return Karate.run("sptapi")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

    @Karate.Test
    Karate scenario2() {
        return Karate.run("sptapi")
                .tags("scenarioRate")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

    @Karate.Test
    Karate scenario3() {
        return Karate.run("sptapi")
                .tags("scenarioHotelAvail")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

    @Karate.Test
    Karate scenario4() {
        return Karate.run("sptapi")
                .tags("scenarioError")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
            }