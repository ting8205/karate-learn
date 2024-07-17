package rakuten.rconnect.rcv3.bmc;

import com.intuit.karate.junit5.Karate;
import rakuten.utils.CleanUpHook;
import rakuten.utils.extentreport.ExtentReportHook;

public class RConnectRunner {

    @Karate.Test
    Karate scenario1() {
        return Karate.run("RCV3-BMC")
                .scenarioName("Traveler Book -> R-Connect GetBooking -> R-Connect SelectUnconfirmedBooking -> R-Connect GetUnconfirmedBooking -> R-Connect ConfirmUnconfirmedBooking -> Traveler Cancel")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
    @Karate.Test
    Karate scenario2() {
        return Karate.run("RCV3-BMC")
                .scenarioName("Traveler Book -> Traveler Cancel -> R-Connect GetBooking -> R-Connect SelectUnconfirmedBooking -> R-Connect GetUnconfirmedBooking -> R-Connect ConfirmUnconfirmedBooking")
                .relativeTo(getClass())
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook());
    }
}
