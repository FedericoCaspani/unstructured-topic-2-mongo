package com.polimi.project.unstructuredtwo.services;

import com.polimi.project.unstructuredtwo.entities.PlaceRank;
import com.polimi.project.unstructuredtwo.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonService {

    @Autowired
    PersonRepository personRepository;

    public List<PlaceRank> rankAllPlaceVisits() {
        return personRepository.rankAllPlacesWithMostVisits();
    }

    public List<PlaceRank> rankTestPlaceVisits() {
        return personRepository.rankTestPlacesWithMostVisits();
    }

    public List<PlaceRank> rankVaccinesPlaceVisits() {
        return personRepository.rankVaccinePlacesWithMostVisits();
    }

    public List<PlaceRank> rankByVaccineType() {
        return personRepository.rankByVaccinationType();
    }

    public List<PlaceRank> rankVaccinatedAgeCategory() {
        return personRepository.rankAgeCategories();
    }
}
