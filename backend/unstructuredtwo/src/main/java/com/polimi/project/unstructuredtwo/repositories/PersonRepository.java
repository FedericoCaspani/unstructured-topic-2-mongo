package com.polimi.project.unstructuredtwo.repositories;

import com.polimi.project.unstructuredtwo.entities.*;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.List;
import java.util.Optional;

public interface PersonRepository extends MongoRepository<Person, String>, CreateRepository, GreenPassRepository {

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
    List<VaccineType> rankByVaccinationType();


    // Q3
    @Aggregation(pipeline = {
            "{$project: { all: ['$tests', '$vaccines']}}",
            "{$unwind: '$all'}",
            "{$unwind: '$all'}",
            "{$group: \n" +
                    "    {\n" +
                    "    _id: '$all.place',\n" +
                    "    visits: { $sum: 1 }\n" +
                    "    }}",
            "{$group: { \n" +
                    "      _id: null, \n" +
                    "      stdDev: { $stdDevSamp: '$visits'},\n" +
                    "      avg: {$avg: '$visits'}\n" +
                    "    }}"
    })
    BusyDepartment tooBusyDepartmentsPercentage();

    // Q3.1
    @Aggregation(pipeline = {
            "{$project: { all: ['$tests', '$vaccines']}}",
            "{$unwind: '$all'}",
            "{$unwind: '$all'}",
            "{$group: \n" +
                    "    {\n" +
                    "    _id: '$all.place',\n" +
                    "    count: { $sum: 1 }\n" +
                    "    }}"
    })
    List<PlaceRank> tooBusyDepartments();


    // Q4
    @Aggregation(pipeline = {
            "{$unwind: '$tests'}",
            "{$match: {\n" +
                    "    'tests.date': '?0'\n" +
                    "  }}",
            "{$group: {\n" +
                        "_id: null,\n" +
                        "num_tot: {$sum: 1},\n" +
                        "num_pos: {$sum: {$cond: [{$eq: ['$tests.result', 'Positive']}, 1 , 0]}},\n" +
                    "  }}"
    })
    Optional<Ratio> infectedTestedRatio(String date);

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
                    "'_id': $_id, 'vaccination_rate': {\n" +
                        "'$cond': [\n" +
                                "{  '$eq': [ '$vaccinated', 0 ] },\n" +
                                "0,\n" +
                                "{ '$divide': [ '$vaccinated', '$totalCount' ] }\n" +
                            "]\n" +
                        "}\n" +
                    "}}"
    })
    List<RankAgeVaccine> rankAgeCategories();

    // Q6
    @Aggregation(pipeline = {
            "{$unwind: '$vaccines'}",
            "{$match: {'taxCode': '?0'}}",
            "{$project: {\n" +
                    "    vaccine_date: {\n" +
                    "      $toDate: '$vaccines.expiration_date'\n" +
                    "    },\n" +
                    "  }}",
            "{$match: {'vaccine_date': {'$gte': new Date()}}}",
            "{$group: {\n" +
                    "    _id: 0,\n" +
                    "    date: {$max: '$vaccine_date'}\n" +
                    "  }}"
    })
    GreenPass validGreenPassVaccine(String taxCode);

    // C1.1
    @Query("{taxCode: '?0'}")
    Optional<Person> findPersonByTaxCode(String taxCode);

}
