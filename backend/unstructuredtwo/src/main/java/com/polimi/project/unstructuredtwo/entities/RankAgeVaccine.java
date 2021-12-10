package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Field;

@Getter
@Setter
@AllArgsConstructor
public class RankAgeVaccine {

    @Field("_id")
    private String ageCategory;

    @Field("vaccination_rate")
    private Double vaccinationRatio;
}
