package com.polimi.project.unstructuredtwo.repositories;

import com.polimi.project.unstructuredtwo.entities.GreenPass;

import java.util.Date;
import java.util.Optional;


public interface GreenPassRepository {

    Optional<GreenPass> validGreenPassSwab(String taxCode, Date date);

}
