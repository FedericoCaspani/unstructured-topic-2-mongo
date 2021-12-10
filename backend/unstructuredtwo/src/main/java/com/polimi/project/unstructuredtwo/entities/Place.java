package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Place {

    private String address;
    private String departments;
    private String entity;
    private String gps;
    private String name;

}
