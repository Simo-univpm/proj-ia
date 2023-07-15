:- dynamic component/4.


/* Components database */
/* CPU */
component('CPU', 'Intel Pentium Gold', 120, 'bassa').
component('CPU', 'AMD Ryzen 3', 180, 'bassa').
component('CPU', 'Intel Core i3', 150, 'bassa').
component('CPU', 'Intel Core i5', 250, 'media').
component('CPU', 'AMD Ryzen 5', 280, 'media').
component('CPU', 'Intel Core i7', 400, 'alta').
component('CPU', 'Intel Core i9', 600, 'alta').
component('CPU', 'AMD Ryzen 7', 450, 'alta').
component('CPU', 'AMD Ryzen 9', 800, 'alta').

/* GPU */
component('GPU', 'NVIDIA GeForce GTX 1650', 200, 'bassa').
component('GPU', 'AMD Radeon RX 550', 150, 'bassa').
component('GPU', 'NVIDIA GeForce GTX 1060', 300, 'media').
component('GPU', 'AMD Radeon RX 580', 250, 'media').
component('GPU', 'NVIDIA GeForce RTX 3060', 500, 'alta').
component('GPU', 'NVIDIA GeForce RTX 2080', 700, 'alta').
component('GPU', 'NVIDIA GeForce RTX 3070', 900, 'alta').
component('GPU', 'AMD Radeon RX 6900 XT', 800, 'alta').
component('GPU', 'NVIDIA GeForce RTX 3090', 1500, 'alta').

/* RAM */
component('RAM', '4GB DDR4', 60, 'bassa').
component('RAM', '6GB DDR4', 70, 'bassa').
component('RAM', '8GB DDR4', 80, 'bassa').
component('RAM', '12GB DDR4', 120, 'media').
component('RAM', '16GB DDR4', 150, 'media').
component('RAM', '32GB DDR4', 300, 'alta').
component('RAM', '24GB DDR4', 250, 'media').
component('RAM', '64GB DDR4', 600, 'alta').
component('RAM', '128GB DDR4', 1200, 'alta').

/* STORAGE */
component('Storage', '128GB SSD', 60, 'bassa').
component('Storage', '500GB HDD', 50, 'bassa').
component('Storage', '256GB SSD', 80, 'bassa').
component('Storage', '1TB HDD', 70, 'media').
component('Storage', '512GB SSD', 120, 'media').
component('Storage', '2TB HDD', 100, 'alta').
component('Storage', '1TB SSD', 200, 'alta').
component('Storage', '2TB SSD', 300, 'media').
component('Storage', '4TB SSD', 600, 'alta').


/* Start rule */
start:-
    write('*** PC Configuration Recommendation System ***'), nl,
    write('Answer the following questions to get a recommended PC configuration.'), nl,
    menu.

/* Main menu rule */
menu:-
    nl,
    write('1. Select purpose (gaming, work, study):'), nl,
    read(Purpose),
    validatePurpose(Purpose),
    nl,
    write('2. Enter your budget (in euros):'), nl,
    read(Budget),
    validateBudget(Budget),
    nl,
    write('3. Select performance level (bassa, media, alta):'), nl,
    read(Performance),
    validatePerformance(Performance),
    nl,
    recommendConfiguration(Purpose, Budget, Performance).

/* Helper rule to validate purpose */
validatePurpose(Purpose):-
    member(Purpose, [gaming, work, study]).

/* Helper rule to validate budget */
validateBudget(Budget):-
    number(Budget),
    Budget > 0.

/* Helper rule to validate performance */
validatePerformance(Performance):-
    member(Performance, [bassa, media, alta]).

/* Recommend PC configuration rule */
recommendConfiguration(Purpose, Budget, Performance):-
    nl,
    write('*** Recommended PC Configuration ***'), nl,
    nl,
    component('CPU', CPU, CPUPrice, Performance),
    component('GPU', GPU, GPUPrice, Performance),
    component('RAM', RAM, RAMPrice, Performance),
    component('Storage', Storage, StoragePrice, Performance),
    TotalPrice is CPUPrice + GPUPrice + RAMPrice + StoragePrice,
    TotalPrice =< Budget,
    write('CPU: '), write(CPU), nl,
    write('GPU: '), write(GPU), nl,
    write('RAM: '), write(RAM), nl,
    write('Storage: '), write(Storage), nl,
    write('Total Price: '), write(TotalPrice), write(' euros'), nl,
    nl,
    write('Are you satisfied with this configuration? (yes/no)'), nl,
    read(Response),
    validateResponse(Response, Purpose, Budget, Performance).

/* Helper rule to validate user's response */
validateResponse(Response, Purpose, Budget, Performance):-
    (Response = yes -> write('Great! Enjoy your new PC configuration.'), nl;
     Response = no -> recommendConfiguration(Purpose, Budget, Performance);
     write('Invalid response. Please enter "yes" or "no".'), nl, menu).

/* Entry point */
:- initialization(start, main).