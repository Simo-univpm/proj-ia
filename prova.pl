:- dynamic component/7.

initialize_db :-
    retractall(component(_, _, _, _, _, _, _)),
    assert(component(0, 'CPU', 'Intel Core i3',           100, 3,  0,  65)),
    assert(component(1, 'GPU', 'NVIDIA GeForce RTX 3080', 700, 10, 16, 185)),
    assert(component(2, 'GAMING CONSOLE', 'Sony PlayStation 4 Pro', 399, 8, 8, 310)),
    assert(component(3, 'LAPTOP', 'Microsoft Surface Book', 1400, 7, 16, 85)).


print_components :-
    findall(component(Id, Type, Brand, Price, Performance, Memory, Power), 
            component(Id, Type, Brand, Price, Performance, Memory, Power),
            AllComponents),
    
    write('Components list:'), nl,
    print_components_list(AllComponents).


print_components_list([]).
print_components_list([component(Id, Type, Brand, Price, Performance, Memory, Power)|Rest]) :-
    write('  ID: '), write(Id),
    write(', TYPE: '),               write(Type),
    write(', MODEL: '),              write(Brand),
    write(', PRICE: '),              write(Price),      write(' Euros'),
    write(', PERFORMANCE: '),        write(Performance),
    write(', MEMORY: '),             write(Memory),     write(' GB'),
    write(', ENERGY CONSUMPTION: '), write(Power),      write(' WATTS'),
    nl,
    print_components_list(Rest).

add_component :-
    write('Add a new component using the following syntax:'), nl,
    write('component(Id, \'Type\', \'Name\', Price, Performance, Memory, Power).'), nl,
    read(Term),
    assert(Term),
    write('Component added.'), nl.

delete_component :-
    write('Insert ID of component to delete:'), nl,
    read(Id),
    retract(component(Id, _, _, _, _, _, _)),
    write('Component deleted.'), nl.




/* Menu per l'amministratore */
admin_menu :-
    write('1. View all facts.'), nl,
    write('2. Insert new fact.'), nl,
    write('3. Delete a fact.'), nl,
    write('4. Exit.'), nl,
    write('Select option...'), nl,
    read(Input),
    admin_option(Input).


admin_option(1) :- print_components,
                   nl,
                   admin_menu.

admin_option(2) :- add_component,
                   nl,
                   admin_menu.

admin_option(3) :- delete_component,
                   nl,
                   admin_menu.

admin_option(4) :- write('Program exited...'),
                   halt.

admin_option(_) :- write('Invalid operation, please try again.'),
                   nl,
                   admin_menu.