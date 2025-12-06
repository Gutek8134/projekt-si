(deffacts initial
(pytanie "Ile masz lat?" "wiek" "Mniej niż 18" "Więcej niż 18")
)

(defrule ponizej-18
(not (odpowiedz $?))
(not (pytanie ? "plec" $?))
(not (plec $?))
(wiek "Mniej niż 18")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Jesteś kobietą czy mężczyzną?\\nJeśli jesteś osobą niebinarną, wybierz płeć, która jest ci bliższa." "plec" "Kobieta" "Mężczyzna"))
)

(defrule kobieta
(not (odpowiedz $?))
(plec "Kobieta")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Zmierzch"))
)

(defrule mezczyzna
(not (odpowiedz $?))
(not (pytanie ? "katolik" $?))
(not (katolik $?))
(plec "Mężczyzna")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy jesteś Katolikiem?" "katolik" "Tak" "Nie"))
)

(defrule katolik
(not (odpowiedz $?))
(katolik "Tak")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "The Killer Nun"))
)

(defrule nie-katolik
(not (odpowiedz $?))
(katolik "Nie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Zjedzeni żywcem"))
)

(defrule powyzej-18
(not (odpowiedz $?))
(not (pytanie ? "boi-sie" $?))
(not (boi-sie $?))
(wiek "Więcej niż 18")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Boisz się bardziej żywych czy zmarłych?" "boi-sie" "Żywych" "Zmarłych" "Obu naraz" "Pełzających" "Diabła" ))
)

(defrule boi-sie-zywych
(not (odpowiedz $?))
(not (pytanie ? "wlochacze" $?))
(not (wlochacze $?))
(boi-sie "Żywych")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Co sądzisz o psach, włochatych ludziach i włochatych psach?" "wlochacze" "Przerażają mnie" "Są spoko"))
)

(defrule wlochacze-straszni
(not (odpowiedz $?))
(not (pytanie ? "eko" $?))
(not (eko $?))
(wlochacze "Przerażają mnie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy jesteś osobą ekologiczną?" "eko" "Tak" "Nie"))
)

(defrule tak-eko
(not (odpowiedz $?))
(eko "Tak")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Wilkołaki"))
)

(defrule nie-eko
(not (odpowiedz $?))
(not (pytanie ? "nie-lubi-dorastania" $?))
(not (nie-lubi-dorastania $?))
(eko "Nie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy dorastanie jest do bani?" "nie-lubi-dorastania" "Tak" "Nie"))
)

(defrule dorastanie-do-bani
(not (odpowiedz $?))
(nie-lubi-dorastania "Tak")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Zdjęcia Ginger"))
)

(defrule dorastanie-spoko
(not (odpowiedz $?))
(not (pytanie ? "wb-odwiedziny" $?))
(not (wb-odwiedziny $?))
(nie-lubi-dorastania "Nie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Co wolał(a/o)byś odwiedzić w Wielkiej Brytanii?" "wb-odwiedziny" "Cyrk lub kino dla dorosłych" "Zamek na wsi" "Wiejskie pole bitwy"))
)

(defrule odwiedziny-cyrk
(not (odpowiedz $?))
(wb-odwiedziny "Cyrk lub kino dla dorosłych")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Amerykański wilkołak w Londynie"))
)

(defrule odwiedziny-zamek
(not (odpowiedz $?))
(wb-odwiedziny "Zamek na wsi")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Wilkołak"))
)

(defrule odwiedziny-pole-bitwy
(not (odpowiedz $?))
(wb-odwiedziny "Wiejskie pole bitwy")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Dog Soldiers"))
)

(defrule wlochacze-spoko
(not (odpowiedz $?))
(not (pytanie ? "boi-sie-madrych" $?))
(not (boi-sie-madrych $?))
(wlochacze "Są spoko")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy boisz się inteligentnych ludzi?" "boi-sie-madrych" "Tak" "Maniacy są straszniejsi"))
)

(defrule maniacy-straszniejsi
(not (odpowiedz $?))
(not (pytanie ? "straszni-maniacy" $?))
(not (straszni-maniacy $?))
(boi-sie-madrych "Maniacy są straszniejsi")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Najstraszniejsi są dla mnie" "straszni-maniacy" "ludzie w swetrach" "ludzie, którzy biorą Halloween na poważnie" "zbyt poważni fani hokeja" "Teksańczycy" "nerdy filmowe" "nikczemne androgeniczne dzieci"))
)

(defrule maniacy-w-swetrach
(not (odpowiedz $?))
(straszni-maniacy "ludzie w swetrach")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Koszmar z ulicy Wiązów"))
)

(defrule maniacy-halloween
(not (odpowiedz $?))
(straszni-maniacy "ludzie, którzy biorą Halloween na poważnie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Halloween"))
)

(defrule maniacy-hokeja
(not (odpowiedz $?))
(straszni-maniacy "zbyt poważni fani hokeja")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Piątek 13-go"))
)

(defrule maniacy-z-teksasu
(not (odpowiedz $?))
(straszni-maniacy "Teksańczycy")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Teksańska masakra piłą łańcuchową"))
)

(defrule maniacy-filmowi
(not (odpowiedz $?))
(straszni-maniacy "nerdy filmowe")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Krzyk"))
)

(defrule maniacy-dzieci
(not (odpowiedz $?))
(straszni-maniacy "nikczemne androgeniczne dzieci")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Uśpiony obóz"))
)


(defrule madrzy-straszniejsi
(not (odpowiedz $?))
(not (pytanie ? "straszni-madrzy" $?))
(not (straszni-madrzy $?))
(boi-sie-madrych "Tak")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Który typ przeraża cię bardziej?" "straszni-madrzy" "Kosmici" "Naukowcy"))
)

(defrule straszni-kosmici
(not (odpowiedz $?))
(not (pytanie ? "boi-sie-cyrku" $?))
(not (boi-sie-cyrku $?))
(straszni-madrzy "Kosmici")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy boisz się cyrku?" "boi-sie-cyrku" "Tak" "Nie"))
)

(defrule tak-boi-sie-cyrku
(not (odpowiedz $?))
(boi-sie-cyrku "Tak")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Mordercze klowny z kosmosu"))
)

(defrule nie-boi-sie-cyrku
(not (odpowiedz $?))
(boi-sie-cyrku "Nie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Obcy"))
)

(defrule straszni-naukowcy
(not (odpowiedz $?))
(not (pytanie ? "boi-sie-owadow" $?))
(not (boi-sie-owadow $?))
(straszni-madrzy "Naukowcy")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy boisz się owadów?" "boi-sie-owadow" "Tak" "Nie"))
)

(defrule tak-boi-sie-owadow
(not (odpowiedz $?))
(boi-sie-owadów "Tak")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Mucha"))
)

(defrule nie-boi-sie-owadow
(not (odpowiedz $?))
(not (pytanie ? "opinia-odciete-glowy" $?))
(not (opinia-odciete-glowy $?))
(boi-sie-owadów "Nie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Co sądzisz o ludziach uprawiających seks z odciętymi wskrzeszonymi głowami?" "opinia-odciete-glowy" "Bardzo mi się to podoba!" "CO."))
)

(defrule zwyrol
(not (odpowiedz $?))
(opinia-odciete-glowy "Bardzo mi się to podoba!")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Reanimator"))
)

(defrule normalna-osoba
(not (odpowiedz $?))
(opinia-odciete-glowy "CO.")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Frankenstein"))
)

(defrule boi-sie-obu-naraz
(not (odpowiedz $?))
(not (pytanie ? "christopher-lee" $?))
(not (christopher-lee $?))
(boi-sie "Obu naraz")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Christopher lee to..." "christopher-lee" "Ten typek co grał Hrabie Dooku" "Legenda"))
)

(defrule christopher-lee-to-legenda
(not (odpowiedz $?))
(not (pytanie ? "opinia-hipisi" $?))
(not (opinia-hipisi $?))
(christopher-lee "Legenda")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Czy lubisz hipisów?" "opinia-hipisi" "Nie" "Prawdziwy koszmar to 19. wieczna dziewica"))
)

(defrule opinia-hipisi-nie-lubi
(not (odpowiedz $?))
(opinia-hipisi "Nie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Dracula A.D. 1972"))
)

(defrule opinia-hipisi-dziewica
(not (odpowiedz $?))
(opinia-hipisi "Prawdziwy koszmar to 19. wieczna dziewica")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "The horror of Dracula"))
)

(defrule christopher-lee-to-dooku
(not (odpowiedz $?))
(not (pytanie ? "opinia-wampiry" $?))
(not (opinia-wampiry $?))
(christopher-lee "Ten typek co grał Hrabie Dooku")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (pytanie "Wolę jak wampiry są..." "opinia-wampiry" "Ciche" "Wschodnio Europejskie" "Z olbrzymią fryzurą jak ul"))
)

(defrule opinia-wampiry-ciche
(not (odpowiedz $?))
(opinia-wampiry "Ciche")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Nosferatu"))
)

(defrule opinia-wampiry-wschodnio-europejskie
(not (odpowiedz $?))
(opinia-wampiry "Wschodnio Europejskie")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Dracula (1931)"))
)

(defrule opinia-wampiry-fryzura-jak-ul
(not (odpowiedz $?))
(opinia-wampiry "Z olbrzymią fryzurą jak ul")
?p <- (pytanie $?)
=>
(retract ?p)
(assert (odpowiedz "Dracula (1992)"))
)