from classes import *
from params import *

from pymongo import MongoClient
import pandas as pd
from random import randint

global db


# local uri: "mongodb+srv://root:password*qwerty@cluster0.63i2t.mongodb.net/test"

def get_db():
    client = MongoClient(CONNECTION_STRING)
    return client["people_registration"]


def get_doctors():
    names = pd.read_csv("dataset/names.csv", nrows=NUM_DOCTORS)
    names = names.values[:, 0]
    titles = ["Doctor", "Specialist", "Anesthetist"]
    docs = []
    for i in range(len(names)):
        docs.append(Worker(names[i], titles[i % 3]))

    return docs


def get_nurses():
    names = pd.read_csv("dataset/names.csv", skiprows=NUM_DOCTORS, nrows=NUM_NURSES)
    names = names.values[:, 0]
    titles = ["Nurse", "Assistant"]
    nurses = []
    for i in range(len(names)):
        nurses.append(Worker(names[i], titles[i % 2]))

    return nurses


def get_auth_bodies():
    places = pd.read_csv("dataset/places.csv", nrows=NUM_PLACES)

    # extracting columns as parameters from csv file
    names = places["Name"].values
    coordinates = places["Coordinates"].values
    addresses = places["Address"].values
    types = places["Entity"].values

    # creating Place objects and inserting them in a list structure to return
    bodies = []
    for i in range(NUM_PLACES):
        bodies.append(Place(names[i], coordinates[i], addresses[i], types[i]))

    return bodies


def generate_emergency_contacts():
    names = pd.read_csv("dataset/names.csv", skiprows=NUM_DOCTORS + NUM_NURSES + NUM_PEOPLE, nrows=NUM_PEOPLE)
    names = names.values[:, 0]
    relationships = ["Family contact", "Friend", "Partner"]

    contacts = []
    for i in range(NUM_PEOPLE):
        contacts.append(EmergencyContact(names[i], "email" + str(i) + "@domain.com", relationships[randint(0, 2)]))

    return contacts


def generate_vaccines(doctors, nurses, auth_bodies):
    brands = ["Pfizer", "Astrazeneca", "Sputnik V", "Johnson&Johnson", "Moderna"]
    types = ["Inactivated", "mRNA", "Viral Vector", "Toxoid"]
    lots = [["1", 2021, 4, 5], ["2", 2021, 11, 1], ["3", 2021, 9, 21], ["4", 2021, 1, 25], ["5", 2021, 6, 19]]

    vaccines = []
    for i in range(1, randint(MIN_V, MAX_V)):
        sel_lot = lots[randint(0, len(lots) - 1)]
        date = str(sel_lot[1]) + "-" + str(sel_lot[2] + 1) + "-" + str(sel_lot[3])
        production_date = str(sel_lot[1]) + "-" + str(sel_lot[2]) + "-" + str(sel_lot[3])
        info = [brands[randint(0, len(brands) - 1)], types[randint(0, len(types) - 1)], str(sel_lot[0]),
                production_date]

        auth_body = auth_bodies[randint(0, len(auth_bodies) - 1)].clone()
        auth_body.set_as_single_department()

        vaccines.append(Vaccine(date=date, info=info, place=auth_body,
                                doctors=doctors[randint(0, len(doctors) - 1)],
                                nurses=nurses[randint(0, len(nurses) - 1)]))

    return vaccines


def generate_tests(doctors, nurses, auth_bodies):
    types = ["NAAT", "Antigen"]
    lots = [["1", "2021-04-05"], ["2", "2021-11-01"], ["3", "2021-09-21"], ["4", "2021-01-25"], ["5", "2021-06-19"]]

    tests = []
    for i in range(MIN_T, MAX_T):
        date = "2021-" + str(randint(1, 12)) + "-" + str(randint(1, 28))
        result = "Negative" if (randint(0, 100) / 100) <= (1 - POSITIVE_PROBABILITY) else "Positive"

        auth_body = auth_bodies[randint(0, len(auth_bodies) - 1)].clone()
        auth_body.set_as_single_department()
        tests.append(Test(date, types[randint(0, len(types) - 1)], result,
                          place=auth_body,
                          doctors=doctors[randint(0, len(doctors) - 1)], nurses=nurses[randint(0, len(nurses) - 1)]))

    return tests


def generate_people(doctors, nurses, auth_bodies, emergency_contacts):
    names = pd.read_csv("dataset/names.csv", skiprows=NUM_DOCTORS + NUM_NURSES, nrows=NUM_PEOPLE)
    names = names.values[:, 0]

    people = []
    for i in range(NUM_PEOPLE):
        # Creating the person still without tests/vaccines
        person = Person(name=names[i], taxCode=str(i + 1), age=randint(14, 80), emergency_contact=emergency_contacts[i])
        # Separately setting vaccines and tests
        person.set_vaccines(generate_vaccines(doctors, nurses, auth_bodies))
        person.set_tests(generate_tests(doctors, nurses, auth_bodies))
        people.append(person)

    return people


if __name__ == "__main__":

    # GENERATING AUTOMATIC DATA
    doctors = get_doctors()
    nurses = get_nurses()
    auth_bodies = get_auth_bodies()
    emergency_contacts = generate_emergency_contacts()

    people = generate_people(doctors, nurses, auth_bodies, emergency_contacts)

    # CONNECTING & INSERTING ON MONGO DATABASE ALL THE GENERATED PEOPLE IN JSON FORMAT
    db = get_db()
    people_collection = db.get_collection("people_registration")
    for p in people:
        data_to_write = json.loads(p.toJSON())
        people_collection.insert_one(data_to_write)
