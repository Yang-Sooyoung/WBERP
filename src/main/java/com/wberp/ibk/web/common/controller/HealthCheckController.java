package com.yourcompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HealthCheckController {

    @GetMapping("/health")
    @ResponseBody
    public String healthCheck() {
        return "OK";
    }
}
