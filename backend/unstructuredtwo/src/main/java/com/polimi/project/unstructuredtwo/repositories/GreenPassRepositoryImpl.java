package com.polimi.project.unstructuredtwo.repositories;

import com.polimi.project.unstructuredtwo.entities.GreenPass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.query.Criteria;

import java.util.Date;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.*;

public class GreenPassRepositoryImpl implements GreenPassRepository {


    @Autowired
    MongoTemplate mongoTemplate;

    @Override
    public Optional<GreenPass> validGreenPassSwab(String taxCode, Date date) {
        Aggregation aggregation = newAggregation(
                unwind("tests"),
                match(Criteria.where("taxCode").is(taxCode)),
                project().andExpression("toDate(tests.date)").as("test_date"),
                match(Criteria.where("test_date").gte(date)),
                sort(Sort.Direction.DESC, "test_date"),
                group("test_date").first("test_date").as("date")
        );
        return Optional.of(mongoTemplate.aggregate(aggregation, "people_registration", GreenPass.class).getMappedResults().get(0));
    }
}
