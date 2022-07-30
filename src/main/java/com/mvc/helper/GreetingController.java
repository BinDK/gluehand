package com.mvc.helper;


import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class GreetingController {

    @MessageMapping("/wsbid")
    @SendTo("/auction/bidding")
    public Greeting greeting(Signal message) {
        return new Greeting(message.getName() + HtmlUtils.htmlEscape(message.getName()));
    }
}
