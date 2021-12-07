package com.polimi.project.unstructuredtwo.controllers;

import com.polimi.project.unstructuredtwo.entities.PlaceRank;
import com.polimi.project.unstructuredtwo.services.PersonService;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class PersonController {

    private PersonService personService;

    @GetMapping(value = {"/api/v1/person/rank/all/visits"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<PlaceRank>> placeAllRankVisits() {
        return Optional
                .ofNullable(personService.rankAllPlaceVisits())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/person/rank/tests/visits"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<PlaceRank>> placeTestPlaceVisits() {
        return Optional
                .ofNullable(personService.rankTestPlaceVisits())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/person/rank/vaccines/visits"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<PlaceRank>> placeVaccinesPlaceVisits() {
        return Optional
                .ofNullable(personService.rankVaccinesPlaceVisits())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/person/rank/vaccines/types"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<PlaceRank>> vaccinesType() {
        return Optional
                .ofNullable(personService.rankByVaccineType())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/person/rank/vaccines/age"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<PlaceRank>> ageCategory() {
        return Optional
                .ofNullable(personService.rankVaccinatedAgeCategory())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }


}
