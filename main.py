from clips import Environment
from clips.facts import ImpliedFact
import mttkinter.mtTkinter as tk
import threading
from functools import partial

RULES_FILE = "horrors.clp"


def get_answer(environment: Environment) -> str:
    print("getting answer")
    fact: ImpliedFact
    for fact in environment._facts.facts():
        # print(fact)
        if fact.template.name == "odpowiedz":
            value = fact[0]
            assert isinstance(value, str)
            return value

    return ""


def get_question(environment: Environment) -> tuple[str, str, tuple[str]]:
    print("getting question")
    fact: ImpliedFact
    for fact in environment._facts.facts():
        # print(fact)
        if fact.template.name == "pytanie":
            question: str = fact[0]
            answer_predicate_name: str = fact[1]
            possible_answers = fact[2:]
            assert isinstance(question, str) and isinstance(answer_predicate_name, str) and isinstance(
                possible_answers, tuple)
            return question, answer_predicate_name, possible_answers

    raise LookupError("No fact of type 'pytanie'")


def set_up_gui(root: tk.Tk) -> tuple[tk.Label, tk.Frame, tk.Button]:
    root.title("Jaki horror powinieneś obejrzeć")
    root.geometry("600x400")
    question_label = tk.Label(root, text="Ładowanie", name="question")
    answers_frame = tk.Frame(root, name="answers")
    submit_button = tk.Button(root, text="Dalej", name="submit")

    question_label.pack(pady=20)
    answers_frame.pack(expand=True, fill="both")
    submit_button.pack(pady=20)

    return question_label, answers_frame, submit_button


def assert_and_reason(environment: Environment, answer_predicate_name: str, user_answer: tk.StringVar, reasoning_finished_event: threading.Event) -> None:
    # print(f"({answer_predicate_name} \"{user_answer.get()}\")")

    # print("asserting")
    environment._facts.assert_string(
        f"({answer_predicate_name} \"{user_answer.get()}\")")
    # print("reasoning")
    # while environment._agenda.run(1):
    #     for activation in environment._agenda.activations():
    #         print(activation)
    environment._agenda.run()
    # print("finished")
    reasoning_finished_event.set()


def reasoning(root: tk.Tk,
              question_label: tk.Label,
              answers_frame: tk.Frame,
              submit_button: tk.Button
              ) -> None:
    environment = Environment()
    environment.load(RULES_FILE)
    environment.reset()

    user_answer = tk.StringVar(root, name="user_answer")

    reasoning_finished_event = threading.Event()

    while not (system_answer := get_answer(environment)):
        question, answer_predicate, possible_user_answers = get_question(
            environment)

        # Ask question
        question_label.config(text=question.replace("\\n", "\n"))

        # Delete old answers
        for child in answers_frame.children.copy().values():
            child.destroy()

        # Create new answers
        for answer in possible_user_answers:
            tk.Radiobutton(answers_frame, text=answer,
                           variable=user_answer, value=answer).pack(fill="x", ipady=5)

        # Bind button
        submit_button.config(command=partial(
            assert_and_reason, environment, answer_predicate, user_answer, reasoning_finished_event))

        reasoning_finished_event.wait()
        reasoning_finished_event.clear()

    question_label.destroy()
    answers_frame.destroy()
    submit_button.destroy()

    system_answer_label = tk.Label(
        root, text=f"Powinieneś/Powinnaś/Powinnoś obejrzeć\n{system_answer}", font=("Arial", 16, "bold"))
    system_answer_label.pack(fill="both", expand=True)
    environment.clear()
    del environment


def main() -> None:
    root = tk.Tk()
    gui = set_up_gui(root)

    reasoning_process = threading.Thread(
        target=reasoning, args=(root, *gui), daemon=True)
    reasoning_process.start()
    root.mainloop()


if __name__ == "__main__":
    main()
