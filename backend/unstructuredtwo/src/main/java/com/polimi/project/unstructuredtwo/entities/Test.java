package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class Test {

    private String date;
    private String result;
    private String type;

    private List<Doctor> doctors;
    private List<Nurse> nurses;

    private Place place;

}
