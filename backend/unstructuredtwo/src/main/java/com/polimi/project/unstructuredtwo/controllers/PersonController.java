package com.polimi.project.unstructuredtwo.controllers;

import com.polimi.project.unstructuredtwo.dto.ModifyManyResult;
import com.polimi.project.unstructuredtwo.entities.*;
import com.polimi.project.unstructuredtwo.services.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;
import java.util.Optional;

@RestController
public class PersonController {

    @Autowired
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
    public ResponseEntity<List<VaccineType>> vaccinesType() {
        return Optional
                .ofNullable(personService.rankByVaccineType())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/departments/busy/percentage"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<BusyDepartmentPercentage> busyDepartmentsPercentage() {
        return Optional
                .ofNullable(personService.tooBusyDepartmentsPercentage())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/departments/busy"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<PlaceRank>> busyDepartments() {
        return Optional
                .ofNullable(personService.busyDepartments())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/ratio/infected/health"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<BusyDepartmentPercentage> infectedHealthyRatio(@RequestParam(name = "date") String date) {
        return Optional
                .ofNullable(personService.ratioInfectedTested(date))
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }



    @GetMapping(value = {"/api/v1/person/rank/vaccines/age"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<RankAgeVaccine>> ageCategory() {
        return Optional
                .ofNullable(personService.rankVaccinatedAgeCategory())
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/vaccine/valid"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<GreenPass> validVaccineGreenPass(@RequestParam(name = "taxCode") String taxCode) {
        return Optional
                .ofNullable(personService.validGreenPassVacine(taxCode))
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(value = {"/api/v1/test/valid"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<GreenPass> validTestGreenPass(@RequestParam(name = "taxCode") String taxCode) throws ParseException {
        return Optional
                .ofNullable(personService.validGreenPassSwab(taxCode))
                .map(application -> ResponseEntity.ok().body(application))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }


    @PostMapping(value = {"/api/v1/vaccine/insert"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ModifyManyResult> insertVaccine(@RequestParam(name = "taxCode") String taxCode,
                                                @RequestBody Vaccine vaccine) {

        if (!personService.checkPerson(taxCode)) {
            System.out.println("n");
            return ResponseEntity.notFound().build();
        }

        return Optional
                .ofNullable(personService.insertVaccine(taxCode, vaccine))
                .map(result -> ResponseEntity.ok().body(result))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }

    @PostMapping(value = {"/api/v1/test/insert"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ModifyManyResult> insertTest(@RequestParam(name = "taxCode") String taxCode,
                                                @RequestBody Test test) {
        if (!personService.checkPerson(taxCode)) {
            System.out.println("n");
            return ResponseEntity.notFound().build();
        }

        return Optional
                .ofNullable(personService.insertTest(taxCode, test))
                .map(result -> ResponseEntity.ok().body(result))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }

    @PostMapping(value = {"/api/v1/person/insert"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Person> insertPerson(@RequestBody Person person) {
        return Optional
                .ofNullable(personService.insertPerson(person))
                .map(result -> ResponseEntity.ok().body(result))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }



    @PostMapping(value = {"/api/v1/vaccine/approve"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ModifyManyResult> approveVaccine(
            @RequestParam(name = "vaccine") String vaccine,
            @RequestParam(name = "approve") boolean approve) {
        return Optional
                .ofNullable(personService.approveVaccine(vaccine, approve))
                .map(person -> ResponseEntity.ok().body(person))
                .orElseGet(() ->  ResponseEntity.notFound().build());
    }

    @PostMapping(value = {"/api/v1/vaccine/delete/lot"}, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ModifyManyResult> deleteLot(
            @RequestParam(name = "lot") String lot) {
        return Optional
                .ofNullable(personService.deleteMessedUpLot(lot))
                .map(person -> ResponseEntity.ok().body(person))
                .orElseGet(() ->  ResponseEntity.notFound().build());
    }


}
