function fn() {
    var env = 'dev'; // get system property 'karate.env'
    if (!env) {
        env = 'dev';
    }
    var config = {
        env: env,
        myVarName: 'someValue',
        apiUrl : 'localhost'
    };
    if (env == 'dev') {
        config.baseUrl = 'localhost'
    } else if (env == 'e2e') {
        config.baseUrl = 'localhost'
    }
    return {
        // env: env,
        // myVarName: 'someValue',
        apiUrl : karate.properties['app.url']
    }
}