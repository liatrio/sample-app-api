function fn() {
    var env = karate.env; // get system property 'karate.env'
    if (!env) {
        env = 'dev';
    }
    var config = {
        env: env,
        myVarName: 'someValue',
        apiUrl : 'localhost'
    };
    config.apiUrl = karate.properties['app.url'];
    return config;
}