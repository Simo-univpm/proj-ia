/* variabili dinamiche */
:- dynamic component/6.
:- dynamic laptop/6.
:- dynamic gaming_console/6.

/* credenziali admin */
admin('admin', '123').

/* Inizializzazione del database */
initialize_db :-

    retractall(component(_, _, _, _, _, _)),
    retractall(laptop(_, _, _, _, _, _)),
    retractall(gaming_console(_, _, _, _, _, _)),

    %component('TYPE','MODEL','PRICE','PERFORMANCE (int 1-10)','MEMORY (for cpu is NA)','WATT POWER CONSUMPTION').
    assert(component('CPU', 'Intel Core i3', 100, 3, NA, 65)),
    assert(component('GPU', 'NVIDIA GeForce RTX 3080', 700, 10, '16GB', 185)),
    assert(component('RAM', 'Crucial DDR4 4GB', 50, 2, '4GB', 5)),
    assert(component('STORAGE', 'Samsung 128GB SSD', 50, 2, '128GB', 3)),

    %laptop/gaming_console('MODEL','PRICE','PERFORMANCE (int 1-10)','MEMORY', 'STORAGE', 'WATT POWER CONSUMPTION').
    assert(laptop('Lenovo Yoga', 800, 6, '8GB', '256GB SSD', 80)),
    assert(gaming_console('Microsoft Xbox 360', 199, 6, '512MB', '20GB HDD', 180)).


/* Controllo delle credenziali di accesso */
login(Username, Password) :-
    admin(Username, Password),
    write('Accesso effettuato!'), nl,
    admin_menu.

login(Username, Password) :-
    \+ admin(Username, Password),
    write('Credenziali di accesso errate!'), nl.

/* Menu per l'amministratore */
admin_menu :-
    write('1. View all facts.'), nl,
    write('2. Insert new fact.'), nl,
    write('3. Delete a fact.'), nl,
    write('4. Exit.'), nl,
    write('Select option...'), nl,
    read(Input),
    admin_option(Input).

/* Gestione delle opzioni del menu per l'amministratore */
admin_option(1) :- 
    findall(component(Cpu, Brand, Price, Performance, Memory, Power), 
            component(Cpu, Brand, Price, Performance, Memory, Power),
            AllComponents),

    write('Components list:'),nl,
    print_facts(AllComponents).

    print_facts([]).
    print_facts([component(Cpu, Brand, Price, Performance, Memory, Power)|Rest]) :-
        write('TYPE: ') write(Cpu),
        write(', MODEL: '), write(Brand),
        write(', PRICE: '), write(Price), write('€'),
        write(', PERFORMANCE: '), write(Quantity),
        write(', MEMORY: '), write(Memory), write('GB'),
        write(', WATT: '), write(Power),
        nl,
        print_facts(Rest).

    admin_menu.

admin_option(2) :-
    write('Inserisci un nuovo fatto nella forma:'), nl,
    write('component(Type, Name, Price, Rating, Memory, Power).'), nl,
    read(Term),
    assert(Term),
    write('Nuovo fatto inserito con successo.'), nl,
    admin_menu.

admin_option(3) :-
    write('Inserisci il nome del componente da eliminare:'), nl,
    read(Name),
    retractall(component(Name, _, _, _, _, _)),
    write('Fatto eliminato con successo.'), nl,
    admin_menu.

admin_option(4) :- 
    write('Uscita dal sistema di amministrazione.'), nl.

admin_option(_) :- 
    write('Opzione non valida. Riprova.'), nl,
    admin_menu.

/* Stampa i fatti */
print_facts([]).
print_facts([Fact|Facts]) :-
    write(Fact), nl,
    print_facts(Facts).