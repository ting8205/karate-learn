package rakuten.zeromanual.providerapi;

import com.intuit.karate.junit5.Karate;
import rakuten.CommonTestRunner;

public class ProviderApiRunner extends CommonTestRunner {
    @Override
    protected void setFeaturePath() {
        featurePath = "provider-api.feature";
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
    @Karate.Test
    Karate scenario4() {
        return karate()
                .tags("tc004");
    }
    @Karate.Test
    Karate scenario5() {
        return karate()
                .tags("tc005");
    }
    @Karate.Test
    Karate scenario6() {
        return karate()
                .tags("tc006");
    }
    @Karate.Test
    Karate scenario7() {
        return karate()
                .tags("tc007");
    }    @Karate.Test
    Karate scenario8() {
        return karate()
                .tags("tc008");
    }
    @Karate.Test
    Karate scenario9() {
        return karate()
                .tags("tc009");
    }


}
