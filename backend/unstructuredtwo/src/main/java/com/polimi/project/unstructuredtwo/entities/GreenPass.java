package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Field;

@Getter
@Setter
@AllArgsConstructor
public class GreenPass {

    @Field("_id")
    private Long id;

    private String date;
}
