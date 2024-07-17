package rakuten.utils.extentreport;

import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.markuputils.ExtentColor;
import com.aventstack.extentreports.markuputils.MarkupHelper;
import com.intuit.karate.RuntimeHook;
import com.intuit.karate.StringUtils;
import com.intuit.karate.core.*;
import rakuten.utils.Utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static rakuten.utils.extentreport.ExtentConstant.*;

public class ExtentReportHook implements RuntimeHook {
    private ExtentTest extentTest = null;
    ExtentRequestInfo request = null;
    private final List<String> KEYWORDS = Arrays.asList(GIVEN, WHEN, THEN, AND);

    @Override
    public boolean beforeFeature(FeatureRuntime fr) {
        ExtentManager.getInstance();
        return RuntimeHook.super.beforeFeature(fr);
    }

    @Override
    public void afterFeature(FeatureRuntime fr) {
        flush();
        RuntimeHook.super.afterFeature(fr);
    }

    @Override
    public boolean beforeScenario(ScenarioRuntime sr) {
        final List<String> parameters = new ArrayList<>();
        if (sr.scenario.getExampleData() != null) {
            sr.scenario.getExampleData().forEach((key, val) -> parameters.add(key + " : " + val));
        }

        if (sr.tags.not(COMMON, UI) || extentTest == null) {
            extentTest = ExtentManager.getInstance().getExtentReports().createTest(sr.scenario.getName());
            extentTest.createNode("Parameters").info(MarkupHelper.createUnorderedList(parameters));
        }
        flush();
        return true;
    }

    @Override
    public void afterScenario(ScenarioRuntime sr) {
        if (sr.tags.anyOf(COMMON, UI)) {
            RuntimeHook.super.afterScenario(sr);
            return;
        }

        ExtentTest node = null;
        int checkPointCount = 0;

        for (StepResult result : sr.result.getStepResults()) {
            if (result.getCallResults() != null) {
                for (FeatureResult fReasult : result.getCallResults()) {
                    node = null;
                    for (ScenarioResult scenarioResult : fReasult.getScenarioResults()) {
                        node = extentTest.createNode(scenarioResult.getScenario().getName());
                        if (scenarioResult.getScenario().getExampleData() != null) {
                            node.createNode("Parameters")
                                    .info(MarkupHelper
                                            .createUnorderedList(scenarioResult.getScenario().getExampleData()).getMarkup());
                        }

                        if (scenarioResult.getScenario().getTagsEffective() != null && scenarioResult.getScenario().getTagsEffective().contains(UI)) {
                            for (StepResult stepResult : scenarioResult.getStepResults()) {
                                generateUiTest(node, stepResult);
                            }
                        } else if (scenarioResult.getScenario().getTagsEffective() != null && scenarioResult.getScenario().getTagsEffective().allOf(COMMON, API)) {
                            request = null;
                            for (StepResult stepResult : scenarioResult.getStepResults()) {
                                generateRequest(stepResult);
                            }
                        }
                    }
                }
            }
            if (request != null && node != null){
                checkPointCount = 0;
                node.createNode("Request").info(MarkupHelper.createCodeBlock(request.toCurl()).getMarkup());
                node.createNode("Response").info("<br />Status Code: " + MarkupHelper.createLabel(request.getStatusCode(), ExtentColor.GREEN).getMarkup()
                        + (StringUtils.isBlank(request.getResponse()) ? "" :
                        "<br />" + MarkupHelper.createCodeBlock(request.getResponse()).getMarkup()));
                node.createNode("Reference Response").info((StringUtils.isBlank(request.getRefResponse()) ? "" :
                        "<br />" + MarkupHelper.createCodeBlock(request.getRefResponse()).getMarkup()));
                for (StepResult stepResult : request.getStepResults()) {
                    checkPointCount++;
                    if (stepResult.getResult().isAborted()) {
                        node.createNode("Check point " + checkPointCount + " : " + stepResult.getStep().getText()).skip("Check aborted");
                    } else if (stepResult.getResult().isFailed()) {
                        node.createNode("Check point " + checkPointCount + " : " + stepResult.getStep().getText()).fail(result.getResult().getError());
                    } else if (stepResult.getResult().isSkipped()) {
                        node.createNode("Check point " + checkPointCount + " : " + stepResult.getStep().getText()).skip("Check skipped");
                    } else if (stepResult.getStep().getText().toLowerCase().startsWith(STATUS)) {
                        node.createNode("Check point " + checkPointCount + " : " + stepResult.getStep().getText()).pass(MarkupHelper.createCodeBlock(stepResult.getStep().getText().split(" ")[1]).getMarkup());
                    } else {
                        node.createNode("Check point " + checkPointCount + " : " + stepResult.getStep().getText()).pass("");
                    }
                }
                request = null;
            }
            if (result.getStep().getText().toLowerCase().startsWith(MATCH) || result.getStep().getText().toLowerCase().startsWith(ASSERT)) {
                ExtentTest test = node == null ? extentTest : node;
                checkPointCount++;
                if (result.getResult().isAborted()) {
                    test.createNode("Check point " + checkPointCount + " : " + result.getStep().getText()).skip("Check aborted");
                } else if (result.getResult().isFailed()) {
                    test.createNode("Check point " + checkPointCount + " : " + result.getStep().getText()).fail(result.getResult().getError());
                } else if (result.getResult().isSkipped()) {
                    test.createNode("Check point " + checkPointCount + " : " + result.getStep().getText()).skip("Check skipped");
                } else if (result.getStep().getText().toLowerCase().startsWith(STATUS)) {
                    test.createNode("Check point " + checkPointCount + " : " + result.getStep().getText()).pass(MarkupHelper.createCodeBlock(result.getStep().getText().split(" ")[1]).getMarkup());
                } else {
                    test.createNode("Check point " + checkPointCount + " : " + result.getStep().getText()).pass("");
                }
            }
            flush();
        }

        extentTest = null;
        flush();
        RuntimeHook.super.afterScenario(sr);
    }

    private void generateRequest(StepResult result) {
        if (request == null) {
            request = new ExtentRequestInfo();
        }

        if (result.getStep().isPrint() && result.getStep().getText().toLowerCase().contains(URL)) {
            request.setUrl(result.getStepLog().split(" ", 3)[2].trim());
        }
        if (result.getStep().getText().toLowerCase().startsWith(SOAP)) {
            request.setMethod("POST");
        }
        if (result.getStep().getText().toLowerCase().startsWith(METHOD)) {
            request.setMethod(result.getStep().getText().split(" ")[1].toUpperCase());
        }
        if (result.getStep().isPrint() && result.getStep().getText().toLowerCase().contains(HEADERS)) {
            request.setHeaders(Utils.stringToMap(result.getStepLog().split(" ", 3)[2].trim()));
        }
        if (result.getStep().isPrint() && result.getStep().getText().toLowerCase().contains(REQUEST_BODY)) {
            request.setRequest(result.getStepLog().split(" ", 3)[2].trim());
        }
        if (result.getStep().isPrint() && result.getStep().getText().toLowerCase().contains(RESPONSE_STATUS)) {
            request.setStatusCode(result.getStepLog().split(" ", 3)[2].trim());
        }
        if (result.getStep().isPrint() && result.getStep().getText().split(" ", 2)[1].trim().equalsIgnoreCase(RESPONSE)) {
            request.setResponse(result.getStepLog().split(" ", 3)[2].trim());
        }
        if (result.getStep().isPrint() && result.getStep().getText().split(" ", 2)[1].trim().equalsIgnoreCase(REF_RESPONSE)) {
            request.setRefResponse(result.getStepLog().split(" ", 3)[2].trim());
        }
        if (result.getStep().getText().toLowerCase().startsWith(MATCH) || result.getStep().getText().toLowerCase().startsWith(ASSERT)) {
            request.getStepResults().add(result);
        }
    }

    private void generateUiTest(ExtentTest test, StepResult result) {
        if (result.getResult().isFailed()) {
            test.fail(result.getResult().getError());
            if (result.getEmbeds() != null) {
                for (Embed embeds : result.getEmbeds()) {
                    test.addScreenCaptureFromBase64String(embeds.getBase64());
                }
            }
        } else if (result.getResult().isSkipped()) {
            if (result.getResult().getError() != null) {
                test.skip(result.getResult().getError());
            } else if (!StringUtils.isBlank(result.getStepLog())) {
                test.skip(result.getStepLog());
            } else if (!StringUtils.isBlank(result.getStep().getText())) {
                test.skip(result.getStep().getText());
            }
            if (result.getEmbeds() != null) {
                for (Embed embeds : result.getEmbeds()) {
                    test.addScreenCaptureFromBase64String(embeds.getBase64());
                }
            }
        } else if (KEYWORDS.contains(result.getStep().getPrefix().toLowerCase())){
            test.pass(result.getStep().getText());
        } else if (result.getStep().isPrint()) {
            test.info(result.getStepLog());
        }
    }

    private void flush() {
        ExtentManager.getInstance().getExtentReports().flush();
    }
}
