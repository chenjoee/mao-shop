package io.github.chenjoee.pms;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

@SpringBootApplication
@EnableEurekaClient
@EnableDiscoveryClient
//@EnableCircuitBreaker
@EnableHystrix
public class PMSApplication {

    public static void main(String[] args) {
        SpringApplication.run(PMSApplication.class, args);
    }

}