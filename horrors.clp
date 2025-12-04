(deffacts initial
(pytanie "Ile masz lat?" "wiek" "Mniej niż 18" "Więcej niż 18")
)

(defrule koniec
(wiek "Mniej niż 18")
=>
(assert (odpowiedz "Dracula"))
)

(defrule koniec2
(wiek "Więcej niż 18")
=>
(assert (odpowiedz "Łapie za nogę"))
)