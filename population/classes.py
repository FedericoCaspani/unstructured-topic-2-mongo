import json
from random import randint
from typing import List
from datetime import datetime, timedelta


# &&&&&&&& CLASSES &&&&&&&&


# class for the emergency contact
class EmergencyContact:
    name: str
    email: str
    relationship: str

    def __init__(self, name, email, relationship):
        self.name = name
        self.email = email
        self.relationship = relationship

    def print(self):
        print("Emergency Contact: " + self.name + " - " + self.email + " (" + self.relationship + ")")


# class for containing both doctors and nurses
class Worker:
    name: str
    title: str

    def __init__(self, name, title):
        self.name = name
        self.title = title

    @staticmethod
    def print(self):
        print(self.name + " - " + self.title)


# class for containing all the needed information about authorized body
class Place:
    name: str
    entity: str
    address: str
    gps: str
    departments: []

    def __init__(self, name, gps, address, entity):
        self.name = name
        self.entity = entity
        self.address = address
        self.gps = gps
        self.departments = self.gen_departments()

    @staticmethod
    def gen_departments():
        # all possible departments
        departments = ["DT.1", "DT.2", "DT.3", "D1.1", "D1.2", "D2.1", "D2.2", "D2.3", "D2.4", "D3.1"]
        # generate only some floors
        possible_combs = [3, 5, 8, 10]
        combination = randint(0, len(possible_combs) - 1)
        return departments[:possible_combs[combination]]

    def print(self, adder):
        print(adder + "Authorized body:")
        print(adder + "Name: " + str(self.name))
        print(adder + "Type of entity: " + str(self.entity))
        print(adder + "Address | Coordinates: " + str(self.address) + " | " + str(self.gps))
        print(adder + "Departments: " + str(self.departments))
        print()

    def clone(self):
        clone = Place(self.name, self.gps, self.address, self.entity)
        return clone

    def set_as_single_department(self):
        chosen = randint(0, len(self.departments)-1)
        self.departments = self.departments[chosen]


# class for modeling Vaccines
class Vaccine:
    date: str
    expiration_date: str
    brand: str
    type: str
    lot: str
    approved: bool
    production_date: str
    place: Place
    doctors: List[Worker] = []
    nurses: List[Worker] = []

    def __init__(self, dose_number, date, info, place, doctors, nurses):
        self.date = date

        date2 = datetime.strptime(date, "%Y-%m-%d")
        if dose_number == 1:
            date2 += timedelta(days=21)
        else:
            date2 += timedelta(days=365)
        self.expiration_date = date2.strftime("%Y-%m-%d")

        self.brand = info[0]
        self.type = info[1]
        self.lot = info[2]
        self.production_date = info[3]
        self.approved = True
        self.place = place
        self.doctors = []
        self.doctors.append(doctors)
        self.nurses = []
        self.nurses.append(nurses)

    def print(self, adder):
        print(adder + "Vaccine done in date: " + self.date)
        print(
            adder + "Brand: " + self.brand + ", Type: " + self.type + ", Lot: " + self.lot + ", Production date: " + self.production_date)
        self.place.print(adder="        ")
        print(adder + "Doctors: [")
        for d in self.doctors:
            print(adder + "" + adder + "" + d.name + " - " + d.title)
        print(adder + "]")
        print(adder + "Nurses: [")
        for n in self.nurses:
            print(adder + "" + adder + "" + n.name + " - " + n.title)
        print(adder + "]")


# class for modeling the Tests
class Test:
    date: str
    type: str
    result: str
    place: Place
    doctors: List[Worker] = []
    nurses: List[Worker] = []

    def __init__(self, date, type, result, place, doctors, nurses):
        self.date = date
        self.type = type
        self.result = result
        self.place = place
        self.doctors = []
        self.doctors.append(doctors)
        self.nurses = []
        self.nurses.append(nurses)

    def print(self, adder):
        print(adder + "Test done in date: " + self.date)
        print(adder + "Type: " + self.type)
        self.place.print(adder="        ")
        print(adder + "Doctors: [")
        for d in self.doctors:
            print(adder + "" + adder + "" + d.name + " - " + d.title)
        print(adder + "]")
        print(adder + "Nurses: [")
        for n in self.nurses:
            print(adder + "" + adder + "" + n.name + " - " + n.title)
        print(adder + "]\n")


# Main class
class Person:
    name: str
    taxCode: str
    age: int
    emergency_contact: EmergencyContact
    vaccines: List[Vaccine] = []
    tests: List[Test] = []

    def __init__(self, name, taxCode, age, emergency_contact):
        self.name = name
        self.taxCode = taxCode
        self.age = age
        self.emergency_contact = emergency_contact
        self.vaccines = []
        self.tests = []

    def set_vaccines(self, vaccines):
        for v in vaccines:
            self.vaccines.append(v)

    def set_tests(self, tests):
        for t in tests:
            self.tests.append(t)

    def print(self):
        print("PERSON")
        print("Name: " + self.name)
        print("Tax Code: " + self.taxCode)
        print("Age: " + str(self.age))
        self.emergency_contact.print()
        print("Vaccines: [")
        for v in self.vaccines:
            v.print(adder="    ")
        print("]")
        print("Tests: [")
        for t in self.tests:
            t.print(adder="    ")
        print("]")
        print("\n\n\n\n")

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)
