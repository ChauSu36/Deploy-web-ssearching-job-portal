package stu.recruitmentweb.jobportal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestErrorController {

    private static final Logger logger = LoggerFactory.getLogger(TestErrorController.class);

    @GetMapping("/simulate-error")
    public ResponseEntity<String> simulateError() {
        logger.error("Simulated Database Timeout: Failed to process downstream transaction");
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Simulated ERROR recorded");
    }
}
