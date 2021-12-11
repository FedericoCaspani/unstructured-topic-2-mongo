package com.polimi.project.unstructuredtwo.services;

import com.polimi.project.unstructuredtwo.dto.ModifyManyResult;
import com.polimi.project.unstructuredtwo.entities.*;
import com.polimi.project.unstructuredtwo.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

@Service
public class PersonService {

    @Autowired
    PersonRepository personRepository;
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'");


    public List<PlaceRank> rankAllPlaceVisits() {
        return personRepository.rankAllPlacesWithMostVisits();
    }

    public List<PlaceRank> rankTestPlaceVisits() {
        return personRepository.rankTestPlacesWithMostVisits();
    }

    public List<PlaceRank> rankVaccinesPlaceVisits() {
        return personRepository.rankVaccinePlacesWithMostVisits();
    }

    public List<VaccineType> rankByVaccineType() {
        return personRepository.rankByVaccinationType();
    }

    public BusyDepartmentPercentage tooBusyDepartmentsPercentage() {
        BusyDepartment busyDepartment = personRepository.tooBusyDepartmentsPercentage();
        return new BusyDepartmentPercentage(
                null,
                busyDepartment.getStdDev() / busyDepartment.getAvg() * 100
        );
    }

    public List<PlaceRank> busyDepartments() {
        return personRepository.tooBusyDepartments();
    }

    public BusyDepartmentPercentage ratioInfectedTested(String date) {
        Optional<Ratio> ratioOptional = personRepository.infectedTestedRatio(date);

        if (ratioOptional.isEmpty()) {
            return null;
        } else {
            Ratio ratio = ratioOptional.get();

            double percentage = (ratio.getNumPos() / ratio.getNumTot()) * 100;
            return new BusyDepartmentPercentage(
                    null,
                    percentage
            );
        }
    }

    public List<RankAgeVaccine> rankVaccinatedAgeCategory() {
        return personRepository.rankAgeCategories();
    }

    public ModifyManyResult approveVaccine(String vaccine, boolean approve) {
        return personRepository.approvedVaccines(vaccine, approve);
    }

    public ModifyManyResult deleteMessedUpLot(String lot) {
        return personRepository.corruptedVaccineLot(lot);
    }

    public GreenPass validGreenPassVacine(String taxCode) {
        Optional<GreenPass> green = personRepository.validGreenPassVaccine(taxCode);
        if (green.isEmpty()) {
            return null;
        } else {
            return green.get();
        }
    }

    public GreenPass validGreenPassSwab(String taxCode) throws ParseException {
        LocalDateTime now = LocalDateTime.now().minus(2, ChronoUnit.DAYS);
        Optional<GreenPass> green = personRepository.validGreenPassSwab(taxCode, Date.from(now.atZone(ZoneId.systemDefault()).toInstant()));
        if (green.isEmpty()) {
           return null;
        }
        return green.get();
    }

    public boolean checkPerson(String taxCode) {
        Optional<Person> p = personRepository.findPersonByTaxCode(taxCode);
        return p.isPresent();
    }

    public ModifyManyResult insertVaccine(String taxCode, Vaccine vaccine) {
        return personRepository.insertVaccine(taxCode, vaccine);
    }

    public ModifyManyResult insertTest(String taxCode, Test test) {
        return personRepository.insertTest(taxCode, test);
    }

    public Person insertPerson(Person person) {
        return personRepository.save(person);
    }
}
