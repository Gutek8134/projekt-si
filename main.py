from clips import Environment
from clips.facts import ImpliedFact

RULES_FILE = "horrors.clp"


def get_question(environment: Environment) -> str:
    fact: ImpliedFact
    for fact in environment._facts.facts():
        if fact.template.name == "pytanie":
            value = fact[0]
            assert isinstance(value, str)
            return value

    raise LookupError("No fact of type 'pytanie'")


def main() -> None:
    environment = Environment()
    environment.load(RULES_FILE)

    environment.reset()
    print(get_question(environment))


if __name__ == "__main__":
    main()
