package com.bdu.webservice_assignment.mongodb;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

// This automatically exposes endpoints at: http://localhost:8080/people
@RepositoryRestResource(collectionResourceRel = "people", path = "people")
public interface PersonRepository extends MongoRepository<Person, String> {
    // You can add custom finders here if needed, e.g.:
    // List<Person> findByLastName(@Param("name") String name);
}