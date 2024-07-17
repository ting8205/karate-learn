package rakuten.zeromanual.apihotelRegressionSTG;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;
public class apihotelRunner {

    @Karate.Test
    Karate scenario1() {
        return Karate.run("apihotel")
                .tags("tc001")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario2() {
        return Karate.run("apihotel")
                .tags("DgetSPHotel")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario3() {
        return Karate.run("apihotel")
                .tags("DHotelDataForAPP")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario4() {
        return Karate.run("apihotel")
                .tags("overseaData")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario5() {
        return Karate.run("apihotel")
                .tags("OverseagetSPHotel")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario6() {
        return Karate.run("apihotel")
                .tags("OverseaDataForAPP")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }

}
