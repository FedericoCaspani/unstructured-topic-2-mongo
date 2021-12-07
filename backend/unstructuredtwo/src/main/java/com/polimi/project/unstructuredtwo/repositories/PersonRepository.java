package com.polimi.project.unstructuredtwo.repositories;

import com.polimi.project.unstructuredtwo.entities.Person;
import com.polimi.project.unstructuredtwo.entities.PlaceRank;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface PersonRepository extends MongoRepository<Person, String> {

    // Q1.1
    @Aggregation(pipeline = {
            "{$project: {key: ['$tests.place', '$vaccines.place']}}",
            "{$unwind: '$key'}",
            "{$unwind: '$key'}",
            "{$project: {'key.departments': 0}}",
            "{$group: {_id: '$key', count: {$sum: 1}}}",
            "{$sort: {count: -1, '_id.name': 1}}"
    })
    List<PlaceRank> rankAllPlacesWithMostVisits();

    // Q1.2
    @Aggregation(pipeline = {
            "{$project: {key: '$tests.place'}}",
            "{$unwind: '$key'}",
            "{$unwind: '$key'}",
            "{$project: {'key.departments': 0}}",
            "{$group: {_id: '$key', count: {$sum: 1}}}",
            "{$sort: {count: -1, '_id.name': 1}}"
    })
    List<PlaceRank> rankTestPlacesWithMostVisits();

    // Q1.3
    @Aggregation(pipeline = {
            "{$project: {key: '$vaccines.place'}}",
            "{$unwind: '$key'}",
            "{$unwind: '$key'}",
            "{$project: {'key.departments': 0}}",
            "{$group: {_id: '$key', count: {$sum: 1}}}",
            "{$sort: {count: -1, '_id.name': 1}}"
    })
    List<PlaceRank> rankVaccinePlacesWithMostVisits();


    // Q2
    @Aggregation(pipeline = {
            "{$project: {key: '$vaccines.brand'}}",
            "{$unwind: '$key'}",
            "{$unwind: '$key'}",
            "{$project: {'key.brand': 0}}",
            "{$group: {_id: '$key', count: {$sum: 1}}}",
    })
    List<PlaceRank> rankByVaccinationType();


    // Q5
    @Aggregation(pipeline = {
            "{$addFields: {\n" +
                    "'category' : {\n" +
                        "$switch: {\n" +
                            "branches: [\n" +
                                "{ case: {$gte : [ '$age', 70 ] }, \n" +
                                        "then: '70+'},\n" +
                                "{case: {$and : [ { $lt : [ '$age', 70 ] },\n" +
                                        "{ $gte : [ '$age', 50 ] } ] },\n" +
                                        "then: '50-69'},\n" +
                                "{ case: {$and : [ { $lt : [ '$age', 50 ] },\n" +
                                        "{ $gte : [ '$age', 27 ] } ] },\n" +
                                        "then: '27-49'},\n" +
                                "{ case: {$lt : [ '$age',  27]} ,\n" +
                                        "then: '27' },\n" +
                            "]\n" +
                        "}\n" +
                    "}\n" +
                    "}}",
            "{'$group': {\n" +
                    "'_id': '$category',\n" +
                    "'vaccinated': {\n" +
                            "'$sum': { '$cond': [\n" +
                                        "{ '$gte': [ {$size:'$vaccines'}, 1 ] },\n" +
                                        "1,\n" +
                                        "0\n" +
                                    "]}\n" +
                            "},\n" +
                    "'totalCount': { '$sum': 1 }}}",
            "{'$project': {\n" +
                    "_id: null, 'count': {\n" +
                        "'$cond': [\n" +
                                "{  '$eq': [ '$vaccinated', 0 ] },\n" +
                                "0,\n" +
                                "{ '$divide': [ '$vaccinated', '$totalCount' ] }\n" +
                            "]\n" +
                        "}\n" +
                    "}}"
    })
    List<PlaceRank> rankAgeCategories();


}
