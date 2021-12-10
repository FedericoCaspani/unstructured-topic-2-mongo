package com.polimi.project.unstructuredtwo.repositories;

import com.mongodb.client.result.UpdateResult;
import com.polimi.project.unstructuredtwo.dto.ModifyManyResult;
import com.polimi.project.unstructuredtwo.entities.Person;
import com.polimi.project.unstructuredtwo.entities.Test;
import com.polimi.project.unstructuredtwo.entities.Vaccine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

public class CreateRepositoryImpl implements CreateRepository {

    @Autowired
    MongoTemplate mongoTemplate;

    @Override
    public ModifyManyResult approvedVaccines(String vaccine, boolean approved) {
        Query select = new Query(Criteria.where("vaccines.brand").is(vaccine));
        Update update = new Update();
        update.set("vaccines.$[element].approved", approved);
        update.filterArray(Criteria.where("element.brand").is(vaccine));
        UpdateResult p = mongoTemplate.updateMulti(
                select,
                update,
                Person.class);
        return new ModifyManyResult(
                p.getMatchedCount(),
                p.getModifiedCount()
        );
    }

    @Override
    public ModifyManyResult corruptedVaccineLot(String lot) {
        UpdateResult p = mongoTemplate.updateMulti(
                new Query(),
                new Update().pull("vaccines", Query.query(Criteria.where("lot").is(lot))),
                Person.class
                );
        return new ModifyManyResult(
                p.getMatchedCount(),
                p.getModifiedCount()
        );
    }

    @Override
    public ModifyManyResult insertVaccine(String taxCode, Vaccine vaccine) {
        UpdateResult p = mongoTemplate.updateFirst(
                new Query(Criteria.where("taxCode").is(taxCode)),
                new Update().push("vaccines", vaccine),
                Person.class
        );
        return new ModifyManyResult(
                p.getMatchedCount(),
                p.getModifiedCount()
        );
    }

    @Override
    public ModifyManyResult insertTest(String taxCode, Test test) {
        UpdateResult p = mongoTemplate.updateFirst(
                new Query(Criteria.where("taxCode").is(taxCode)),
                new Update().push("tests", test),
                Person.class
        );
        return new ModifyManyResult(
                p.getMatchedCount(),
                p.getModifiedCount()
        );
    }
}
