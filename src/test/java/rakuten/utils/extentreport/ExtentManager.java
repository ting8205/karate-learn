package rakuten.utils.extentreport;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.reporter.configuration.Protocol;
import com.aventstack.extentreports.reporter.configuration.Theme;
import com.aventstack.extentreports.reporter.configuration.ViewName;
import com.intuit.karate.Logger;
import com.intuit.karate.StringUtils;
import lombok.Getter;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExtentManager {
    static Logger logger = new Logger();
    private static ExtentManager instance;
    @Getter
    private ExtentReports extentReports;
    @Getter
    private String reportPath;

    private ExtentManager() {
        if (instance != null) {
            throw new RuntimeException("Use getInstance() to create");
        }
    }

    public static ExtentManager getInstance() {
        if (instance == null) {
            logger.info("Initializing extent report...");
            instance = new ExtentManager();
            instance.reportPath = StringUtils.isBlank(System.getProperty("report")) ? "test-output" + File.separator + "Extent_Report.html" : System.getProperty("report") + File.separator + "Extent_Report.html";
            instance.createInstance(instance.reportPath);
            logger.info("Extent report is created in " + instance.reportPath);
        }
        return instance;
    }

    private void createInstance(String fileName) {
        ExtentSparkReporter htmlReporter = new ExtentSparkReporter(fileName);
        htmlReporter.config().setTheme(Theme.STANDARD);
        htmlReporter.config().setEncoding("UTF-8");
        htmlReporter.config().setDocumentTitle("Karate Extent Report");
        htmlReporter.config().setReportName("Karate Extent Demo");
        htmlReporter.viewConfigurer().viewOrder().as(
                new ViewName[]{
                        ViewName.DASHBOARD,
                        ViewName.TEST,
                        ViewName.AUTHOR,
                        ViewName.DEVICE,
                        ViewName.EXCEPTION,
                        ViewName.LOG
                }).apply();


        htmlReporter.config().setTimeStampFormat("MM/dd/yyyy hh:mm:ss a");
        extentReports = new ExtentReports();
        extentReports.setSystemInfo("type", StringUtils.isBlank(System.getProperty("karate.env")) ? "api" : System.getProperty("karate.env"));
        extentReports.setSystemInfo("ui proxy", System.getProperty("ui.proxy"));
        extentReports.setSystemInfo("api proxy", System.getProperty("api.proxy"));
        extentReports.attachReporter(htmlReporter);
    }
}
