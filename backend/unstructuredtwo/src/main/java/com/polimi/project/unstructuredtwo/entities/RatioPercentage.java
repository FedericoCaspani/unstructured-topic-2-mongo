package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Field;

@Getter
@Setter
@AllArgsConstructor
public class RatioPercentage {

    private Long id;
    private Double numTot;
    private Double numPos;
    private Double percentage;
}
