# Karate automation test framework

## Overview
A Karate framework used for API automation testing

## Build step

Maven build
```bash
mvn clean install -U -DskipTests
```

## How to execute with command-line
```bash
mvn test -Dtest="{{class_path_to_test_runner}}" -Dui.proxy={{proxy_used_for_ui}} -D"api.proxy"={{proxy_used_for_api}} -Dkarate.env={{target_environment}} -Dkarate.options="--tags {{any_target_tags}}" -Dreport={{target_extent_report_folder}} -Dui.showBrowser={{run_in_display_or_headless}}
```
1. test: for e.g: rakuten.MainTest or rakuten.rconnect.rcv3.bmc.RConnectRunner#scenario1
2. ui.proxy needs to start with http:// or https://
3. api.proxy nees to start with http:// or https://
4. karate.env:
   1. e2e for UI + API end 2 end test
   2. api for API test
5. karate.options any_target_tags to run : for e.g: rcv3
6. report path: relative / absolute path to extent report folder
7. ui.showBrowser
   1. true for displaying test browser
   2. false for headless