package com.polimi.project.unstructuredtwo.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ModifyManyResult {

    private Long matchedCount;
    private Long modifiedCount;

}
