package com.polimi.project.unstructuredtwo.repositories;

import com.polimi.project.unstructuredtwo.entities.GreenPass;

import java.util.Date;

public interface GreenPassRepository {

    GreenPass validGreenPassSwab(String taxCode, Date date);

}
