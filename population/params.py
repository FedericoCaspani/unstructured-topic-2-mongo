
CONNECTION_STRING = "mongodb+srv://root:root@cluster0.dx6xp.mongodb.net/vaccines?retryWrites=true&w=majority"

# &&&&&&&& GENERATION CONSTANTS &&&&&&&&

NUM_PEOPLE = 20
NUM_DOCTORS = 7
NUM_NURSES = 7

# NUMBER OF PLACES TO USE FOR THE VACCINES/TESTS.
# EACH OF THEM CONTAINS A RANDOM NUMBER OF FLOORS WITH DEPARTMENTS,
# BUT ONLY ONE OF THEM WILL BE TAKEN BY EACH VACCINE/TEST.
NUM_PLACES = 6

MIN_V = 0  # MIN NUMBER OF VACCINES PER PERSON
MAX_V = 3  # MAX NUMBER OF VACCINES PER PERSON

MIN_T = 1  # MIN NUMBER OF TESTS PER PERSON
MAX_T = 3  # MAX NUMBER OF TESTS PER PERSON

POSITIVE_PROBABILITY = 0.02  # PERCENTAGE OF "POSITIVE" RESULT ON A TEST




