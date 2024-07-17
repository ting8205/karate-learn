package rakuten;

import com.intuit.karate.Logger;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.StringUtils;
import org.junit.jupiter.api.Test;
import rakuten.utils.extentreport.ExtentManager;
import rakuten.utils.extentreport.ExtentReportHook;
import rakuten.utils.CleanUpHook;

class MainTest {
    Logger logger = new Logger();

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:rakuten")
                .reportDir(System.getProperty("report"))
                .hook(new ExtentReportHook())
                .hook(new CleanUpHook())
                //.outputCucumberJson(true)
                .parallel(StringUtils.isBlank(System.getProperty("threadCount")) ? 1 : Integer.parseInt(System.getProperty("threadCount")));

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        logger.info("Extent report could be found in " + ExtentManager.getInstance().getReportPath());
    }

}
