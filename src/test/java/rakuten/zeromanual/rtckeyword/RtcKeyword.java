package rakuten.zeromanual.rtckeyword;

import com.intuit.karate.junit5.Karate;
import rakuten.CommonTestRunner;

public class RtcKeyword extends CommonTestRunner {
    @Override
    protected void setFeaturePath() {
        featurePath = "rtc-keyword.feature";
    }

    @Karate.Test
    Karate scenario1() {
        return karate()
                .tags("tc001");
    }
    @Karate.Test
    Karate scenario2() {
        return karate()
                .tags("tc002");
    }


}
