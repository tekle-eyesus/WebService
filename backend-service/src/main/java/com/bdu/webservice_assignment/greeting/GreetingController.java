package com.bdu.webservice_assignment.greeting;

import org.springframework.hateoas.EntityModel;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.*;

@RestController
public class GreetingController {

    private static final String TEMPLATE = "Hello, %s!";

    @GetMapping("/greeting")
    public EntityModel<Greeting> greeting(@RequestParam(value = "name", defaultValue = "World") String name) {

        // 1. Create the greeting object
        Greeting greeting = new Greeting(String.format(TEMPLATE, name));

        // 2. Wrap it in EntityModel and add a Self Link
        // This adds: "_links": { "self": { "href": "http://localhost:8080/greeting?name=World" } }
        return EntityModel.of(greeting,
                linkTo(methodOn(GreetingController.class).greeting(name)).withSelfRel());
    }
}