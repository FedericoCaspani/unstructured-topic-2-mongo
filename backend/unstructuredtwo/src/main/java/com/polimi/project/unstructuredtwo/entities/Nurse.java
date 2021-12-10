package com.polimi.project.unstructuredtwo.entities;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Nurse extends Stuff {
    public Nurse(String name, String title) {
        super(name, title);
    }
}
