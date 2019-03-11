package io.liatr.sampleappapi;


import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.RestController;

@RestController
@PropertySource(ignoreResourceNotFound = true, value = "classpath:application.properties")
public class HelloController {

//    @Value("${appVersion}")
//    private String appVersion;
//
//    @RequestMapping("/index")
//    public String hello() {
//        return "Hello. This is an index page for testing.";
//    }
//
//    @RequestMapping("/version")
//    public String getVersion() {
//        return appVersion;
//    }
//}
}
