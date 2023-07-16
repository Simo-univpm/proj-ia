:- dynamic component/7.
%:- dynamic laptop/7.
%:- dynamic gaming_console/7.

initialize_db :-
    retractall(component(_, _, _, _, _, _, _)),
    %fare anche: retractall(laptop(_, _, _, _, _, _, _)),
    %fare anche: retractall(gaming_console(_, _, _, _, _, _, _)),
    %no?
    %implementare anche login, forse

    assert(component(0, 'CPU', 'Intel Core i3',           100, 3,  0,  65)),
    assert(component(1, 'GPU', 'NVIDIA GeForce RTX 3080', 700, 10, 16, 185)),
    assert(laptop(2, 'LAPTOP', 'Microsoft Surface Book', 1400, 7, 16, 85)),
    assert(gaming_console(3, 'GAMING CONSOLE', 'Sony PlayStation 4 Pro', 399, 8, 8, 310)).


% utilizziamo l'operatore ; per combinare le clausole dei tre tipi di fatti in un'unica clausola. In questo modo, evitiamo la duplicazione di codice e semplifichiamo la funzione. 
print_facts :-
    (component(Id, Type, Model, Price, Performance, Memory, Energy);
      laptop(Id, Type, Model, Price, Performance, Memory, Energy);
      gaming_console(Id, Type, Model, Price, Performance, Memory, Energy)
    ),
    format("ID: ~w, TYPE: ~w, MODEL: ~w, PRICE: ~w Euros, PERFORMANCE: ~w, MEMORY: ~w GB, ENERGY CONSUMPTION: ~w WATTS~n", [Id, Type, Model, Price, Performance, Memory, Energy]),
    fail.

print_facts.

add_component :-
    write('Add a new component using the following syntax:'), nl,
    write('component\\laptop\\gaming_console(Id, \'Type\', \'Name\', Price, Performance, Memory, Power).'), nl,
    read(Term),
    assert(Term),
    write('Component added.'), nl.

delete_fact_by_id :-
    write('Insert ID of fact you want to delete:'), nl,
    read(FactId),
    (retract(component(FactId, _, _, _, _, _, _)); retract(laptop(FactId, _, _, _, _, _, _)); retract(gaming_console(FactId, _, _, _, _, _, _))).
    
delete_fact_by_id(_).




/* Menu per l'amministratore */
admin_menu :-
    write('1. View all facts.'), nl,
    write('2. Insert new fact.'), nl,
    write('3. Delete a fact.'), nl,
    write('4. Exit.'), nl,
    write('Select option...'), nl,
    read(Input),
    admin_option(Input).


admin_option(1) :- print_facts,
                   nl,
                   admin_menu.

admin_option(2) :- add_component,
                   nl,
                   admin_menu.

admin_option(3) :- delete_fact_by_id,
                   nl,
                   admin_menu.

admin_option(4) :- write('Program exited...'),
                   halt.

admin_option(_) :- write('Invalid operation, please try again.'),
                   nl,
                   admin_menu.












/*
    write('  ID: '), write(Id),
    write(', TYPE: '),               write(Type),
    write(', MODEL: '),              write(Brand),
    write(', PRICE: '),              write(Price),      write(' Euros'),
    write(', PERFORMANCE: '),        write(Performance),
    write(', MEMORY: '),             write(Memory),     write(' GB'),
    write(', ENERGY CONSUMPTION: '), write(Power),      write(' WATTS'),
*/
