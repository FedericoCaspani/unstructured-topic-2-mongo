package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class Vaccine {

    private boolean approved;
    private String brand;
    private String date;

    @Field("expiration_date")
    private String expirationDate;

    private String lot;

    @Field("production_date")
    private String productionDate;
    private String type;

    private List<Doctor> doctors;
    private List<Nurse> nurses;

    private Place place;
}
