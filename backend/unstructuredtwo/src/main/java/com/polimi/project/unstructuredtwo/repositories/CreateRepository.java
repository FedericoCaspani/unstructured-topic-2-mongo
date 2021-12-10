package com.polimi.project.unstructuredtwo.repositories;

import com.polimi.project.unstructuredtwo.dto.ModifyManyResult;
import com.polimi.project.unstructuredtwo.entities.Person;
import com.polimi.project.unstructuredtwo.entities.Test;
import com.polimi.project.unstructuredtwo.entities.Vaccine;

public interface CreateRepository {

    ModifyManyResult approvedVaccines(String vaccine, boolean approved);

    ModifyManyResult corruptedVaccineLot(String lot);

    ModifyManyResult insertVaccine(String taxCode, Vaccine vaccine);

    ModifyManyResult insertTest(String taxCode, Test test);

}
