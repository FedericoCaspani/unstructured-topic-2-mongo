package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Field;

@Getter
@Setter
@AllArgsConstructor
public class Ratio {

    @Field("_id")
    private Long id;

    @Field("num_tot")
    private Double numTot;

    @Field("num_pos")
    private Double numPos;
}
