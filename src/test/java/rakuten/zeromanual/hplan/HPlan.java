package rakuten.zeromanual.hplan;

import com.intuit.karate.junit5.Karate;
import rakuten.CommonTestRunner;

public class HPlan extends CommonTestRunner  {
    @Override
    protected void setFeaturePath() {
        featurePath = "hplan.feature";
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
    @Karate.Test
    Karate scenario3() {
        return karate()
                .tags("tc003");
    }
}
