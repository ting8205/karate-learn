function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'api';
  }
  var apiProxy = karate.properties['api.proxy'];
  karate.log('karate.api.proxy system property was:', apiProxy);
  var uiProxy = karate.properties['ui.proxy'];
  karate.log('karate.ui.proxy system property was:', uiProxy);
  var showBrowser = karate.properties['ui.showBrowser'];
  karate.log('karate.ui.showBrowser system property was:', showBrowser);
  var config = {
    env: env,
    apiProxy: apiProxy,
    uiProxy: uiProxy,
    sleep: (pause) => {
        karate.log(`Sleep for ${pause} seconds...`)
        java.lang.Thread.sleep(pause * 1000)
    },
    credential: karate.read('classpath:credentials.json')
  }
  if (env.contains('e2e')) {
    let options = [
          '--no-sandbox',
          `--proxy-server=${uiProxy}`,
          '--remote-allow-origins=*',
          '--start-maximized',
          '--disable-dev-shm-usage',
          '--ignore-ssl-errors=yes'
      ];
    if(!showBrowser) {
        options = [...options, '--headless=new'];
    }
    karate.configure('driver', {
        type: 'chrome',
        showDriverLog: false,
        addOptions: options
    });
    karate.configure('report', {
        showLog: true,
        showAllSteps: false
    });
  }
  return config;
}