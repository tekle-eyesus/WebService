package com.bdu.webservice_assignment.greeting;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

@Controller
public class GraphqlController {

    @QueryMapping
    public String hello(@Argument String name) {
        String inputName = (name != null) ? name : "Flutter User";
        return "Hello " + inputName + ", from GraphQL!";
    }
}