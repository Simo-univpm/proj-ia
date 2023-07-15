:- dynamic component/6.
:- dynamic admin/2.

/* Inizializzazione del database */
initialize_db :- 
    retractall(component(_, _, _, _, _, _)),
    assert(component('CPU', 'Intel Core i3', 100, 3, NA, 65)),
    assert(component('CPU', 'AMD Ryzen 5 Pro', 200, 6, NA, 95)),
    assert(component('CPU', 'Intel Xeon', 600, 10, NA, 170)),
    assert(component('GPU', 'NVIDIA GeForce GTX 1050', 150, 3, '4GB', 80)),
    assert(component('GPU', 'NVIDIA GeForce GTX 1660', 350, 7, '8GB', 125)),
    assert(component('GPU', 'NVIDIA GeForce RTX 3080', 700, 10, '16GB', 185)),
    assert(component('RAM', 'Crucial DDR4 4GB', 50, 2, '4GB', 5)),
    assert(component('RAM', 'Kingston HyperX DDR4 8GB', 150, 6, '8GB', 9)),
    assert(component('RAM', 'Corsair Vengeance LPX DDR4 16GB', 300, 10, '16GB', 16)),
    assert(component('STORAGE', 'Samsung 128GB SSD', 50, 2, '128GB', 3)),
    assert(component('STORAGE', 'Western Digital 2TB SSD', 250, 9, '2TB', 10)),
    assert(component('STORAGE', 'Crucial MX500 2TB SSD', 300, 10, '2TB', 11)),
    assert(laptop('Lenovo Yoga', 800, 6, '8GB', '256GB SSD', 80)),
    assert(laptop('Apple MacBook Pro', 2000, 8, '16GB', '512GB SSD', 95)),
    assert(laptop('Asus ROG Zephyrus', 1700, 9, '32GB', '1TB SSD', 130)),
    assert(gaming_console('Sony PlayStation 3', 199, 6, '256MB', '120GB HDD', 190)),
    assert(gaming_console('Microsoft Xbox 360', 199, 6, '512MB', '20GB HDD', 180)),
    assert(gaming_console('Sony PlayStation 4 Pro', 399, 8, '8GB', '1TB HDD', 310)).

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
    write('1. Visualizza tutti i fatti.'), nl,
    write('2. Inserisci un nuovo fatto.'), nl,
    write('3. Elimina un fatto.'), nl,
    write('4. Esci.'), nl,
    write('Seleziona un'), nl,
    read(Input),
    admin_option(Input).

/* Gestione delle opzioni del menu per l'amministratore */
admin_option(1) :- 
    findall(Fact, component(Fact, _, _, _, _, _), Facts),
    write('Elenco di tutti i fatti:'), nl,
    print_facts(Facts),
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

/* Admin credentials */
admin('admin', 'password123').