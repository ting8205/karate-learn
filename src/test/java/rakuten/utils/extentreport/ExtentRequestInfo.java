package rakuten.utils.extentreport;

import com.intuit.karate.StringUtils;
import com.intuit.karate.core.StepResult;
import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class ExtentRequestInfo {
    String label;
    String url;
    String method;
    Map<String, String> headers = new HashMap<>();
    String request;
    Map<String, String> form = new HashMap<>();
    String response;
    String refResponse;
    String statusCode;
    List<StepResult> stepResults = new ArrayList<>();

    public String toCurl() {
        StringBuilder builder = new StringBuilder().append("curl")
                .append(" -L -X ")
                .append(method)
                .append(" '")
                .append(url)
                .append("' \\\n");
        headers.forEach((key, val) -> builder.append("-H '")
                .append(key)
                .append(": ")
                .append(val)
                .append("' \\\n"));
        if (request != null) {
            builder.append("-d '")
                    .append(request)
                    .append("' \\\n");
        }
        form.forEach((key, val) -> builder.append("-F '")
                .append(key)
                .append("=\"")
                .append(val)
                .append("\"' \\\n"));

        return builder.toString();
    }
}
