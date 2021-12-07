package com.polimi.project.unstructuredtwo.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;

@Document("people_registration")
@Getter
@Setter
@AllArgsConstructor
public class Person {

    @Id
    private String id;

    private int age;
    private String name;
    private String taxCode;

    @Field("emergency_contact")
    private EmergencyContact emergencyContact;

    private List<Test> tests;
    private List<Vaccine> vaccines;
}
