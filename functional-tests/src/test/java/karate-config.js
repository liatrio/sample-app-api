function () {
    var config = { // base config JSON
      baseUrl: karate.properties['baseUrl']
    };
    karate.log('baseUrl system property was:', config.baseUrl);

    return config;
}