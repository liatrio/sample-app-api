function fn() {
    var env = karate.env; // get system property 'karate.env'
    if (!env) {
        env = 'dev';
    }
    var config = {
        env: env,
        myVarName: 'someValue',
        baseUrl : 'localhost:8080'
    };
    // config.baseUrl = karate.properties['app.url'];
    return config;
}