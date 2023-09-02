% declaring dynamic facts for db assert and retract operations
:- dynamic category/2.
:- dynamic price/2.
:- dynamic user_rating/3.

% Users registered in the recommendation system
user(simone).
user(francesco).
user(nicholas).

% Facts of search history of registered users
% giacomo is a user who searched cpus
search_history(simone, [intel_i9, amd_ryzen_9, intel_i7, amd_ryzen_7]).

% franci is a user who searched for gpus
search_history(francesco, [nvidia_rtx_3090, amd_rx_6900, nvidia_rtx_3080, nvidia_rtx_3070]).

% marco is a user who searched for ram modules
search_history(nicholas, [corsair_16gb, g_skill_32gb, crucial_32gb]).


% Facts of products and their category (cpu, gpu, ram)
%cpus
category(intel_i9, cpu).
category(amd_ryzen_9, cpu).
category(intel_i7, cpu).
category(amd_ryzen_7, cpu).
category(intel_i5, cpu).
category(amd_ryzen_5, cpu).
category(intel_pentium, cpu).
category(amd_athlon, cpu).
category(intel_celeron, cpu).
category(amd_ryzen_3, cpu).

%gpus
category(nvidia_rtx_3090, gpu).
category(amd_rx_6900, gpu).
category(nvidia_rtx_3080, gpu).
category(amd_rx_6800, gpu).
category(nvidia_rtx_3070, gpu).
category(amd_rx_6700, gpu).
category(nvidia_rtx_3060, gpu).
category(amd_rx_6600, gpu).
category(nvidia_rtx_3050, gpu).
category(amd_rx_6500, gpu).

%ram
category(corsair_16gb, ram).
category(g_skill_32gb, ram).
category(kingston_8gb, ram).
category(crucial_32gb, ram).
category(team_group_16gb, ram).
category(hyperx_8gb, ram).
category(patriot_16gb, ram).
category(a_data_32gb, ram).
category(mushkin_16gb, ram).
category(samsung_32gb, ram).


% Price facts 
price(intel_i9, 499.99).
price(amd_ryzen_9, 749.99).
price(intel_i7, 399.99).
price(amd_ryzen_7, 449.99).
price(intel_i5, 299.99).
price(amd_ryzen_5, 279.99).
price(intel_pentium, 89.99).
price(amd_athlon, 129.99).
price(intel_celeron, 59.99).
price(amd_ryzen_3, 119.99).

price(nvidia_rtx_3090, 1499.99).
price(amd_rx_6900, 999.99).
price(nvidia_rtx_3080, 799.99).
price(amd_rx_6800, 649.99).
price(nvidia_rtx_3070, 599.99).
price(amd_rx_6700, 449.99).
price(nvidia_rtx_3060, 399.99).
price(amd_rx_6600, 349.99).
price(nvidia_rtx_3050, 229.99).
price(amd_rx_6500, 199.99).

price(corsair_16gb, 129.99).
price(g_skill_32gb, 199.99).
price(kingston_8gb, 69.99).
price(crucial_32gb, 149.99).
price(team_group_16gb, 89.99).
price(hyperx_8gb, 59.99).
price(patriot_16gb, 109.99).
price(a_data_32gb, 169.99).
price(mushkin_16gb, 119.99).
price(samsung_32gb, 249.99).

% User ratings for products
user_rating(simone, intel_i9, 4.5).
user_rating(simone, amd_ryzen_9, 4.8).
user_rating(simone, intel_i7, 4.4).

user_rating(francesco, nvidia_rtx_3090, 5.0).
user_rating(francesco, amd_rx_6900, 4.6).
user_rating(francesco, nvidia_rtx_3080, 4.9).

user_rating(nicholas, corsair_16gb, 4.0).
user_rating(nicholas, g_skill_32gb, 4.2).
user_rating(nicholas, kingston_8gb, 3.8).

% Calculate the Pearson correlation coefficient between two lists of ratings
pearson_correlation(User1Ratings, User2Ratings, Similarity) :-
    length(User1Ratings, N),
    length(User2Ratings, N),
    sum_ratings(User1Ratings, Sum1),
    sum_ratings(User2Ratings, Sum2),
    sum_squared_ratings(User1Ratings, SumSquared1),
    sum_squared_ratings(User2Ratings, SumSquared2),
    sum_product_ratings(User1Ratings, User2Ratings, SumProduct),
    Numerator is N * SumProduct - Sum1 * Sum2,
    Denominator1 is sqrt(N * SumSquared1 - Sum1 * Sum1),
    Denominator2 is sqrt(N * SumSquared2 - Sum2 * Sum2),
    Denominator is Denominator1 * Denominator2,
    (Denominator = 0 -> Similarity = 0 ; Similarity is Numerator / Denominator),
    write('Similarity: '), write(Similarity).

% Calculate the sum of ratings in a list
sum_ratings([], 0).
sum_ratings([Rating|Rest], Sum) :-
    sum_ratings(Rest, RestSum),
    Sum is RestSum + Rating.

% Calculate the sum of squared ratings in a list
sum_squared_ratings([], 0).
sum_squared_ratings([Rating|Rest], Sum) :-
    sum_squared_ratings(Rest, RestSum),
    Sum is RestSum + Rating * Rating.

% Calculate the sum of product of ratings between two lists
sum_product_ratings([], [], 0).
sum_product_ratings([Rating1|Rest1], [Rating2|Rest2], Sum) :-
    sum_product_ratings(Rest1, Rest2, RestSum),
    Sum is RestSum + Rating1 * Rating2.


%============================================================================


% Remove duplicate recommendations from the list
remove_duplicates([], []).
remove_duplicates([[Product, Category, Price]|Tail], [[Product, Category, Price]|Result]) :-
    remove_duplicates(Tail, Result).

% Format the recommendations as a list of formatted strings
format_recommendations([], []).
format_recommendations([[Product, Category, Price]|Tail], [Formatted|Result]) :-
    format(atom(Formatted), "Product Name: ~w, Category: ~w, Price: ~2f", [Product, Category, Price]),
    format_recommendations(Tail, Result).

% Collaborative filtering algorithm with user ratings
recommend(User, MinPrice, MaxPrice, CategoryFilter, Recommendation) :-
    search_history(User, SearchHistory),
    % Find all products that match the user's search history, category, and price range
    findall([Product, Category, Price], (
        member(Product, SearchHistory),
        category(Product, Category),
        price(Product, Price),
        (MinPrice =< 0.0 ; Price >= MinPrice),
        (MaxPrice =< 0.0 ; Price =< MaxPrice),
        (CategoryFilter = 'skip' ; CategoryFilter = Category)
    ), ExistingRecommendations),
    % Retrieve user's ratings for products
    findall(Rating, user_rating(User, _, Rating), UserRatings),
    % Collaborative filtering: Find similar users based on their ratings
    findall(SimilarUser, (
        user_rating(SimilarUser, _, _),
        SimilarUser \= User,
        findall(SimilarRating, user_rating(SimilarUser, _, SimilarRating), SimilarRatings),
        pearson_correlation(UserRatings, SimilarRatings, Similarity),
        Similarity > 0.3 % Minimum similarity threshold (adjust as needed)
    ), SimilarUsers),
    % Find products that the similar users have searched for and add them to recommendations
    findall([Product, Category, Price], (
        member(SimilarUser, SimilarUsers),
        search_history(SimilarUser, SimilarSearchHistory),
        member(Product, SimilarSearchHistory),
        category(Product, Category),
        price(Product, Price),
        \+ member([Product, Category, Price], ExistingRecommendations), % Exclude already recommended products
        (MinPrice =< 0.0 ; Price >= MinPrice),
        (MaxPrice =< 0.0 ; Price =< MaxPrice),
        (CategoryFilter = 'skip' ; CategoryFilter = Category)
    ), CollaborativeRecommendations),
    % Combine and sort the collaborative recommendations
    sort(CollaborativeRecommendations, SortedCollaborativeRecommendations),
    % Combine and sort the existing recommendations
    sort(ExistingRecommendations, SortedExistingRecommendations),
    % Merge the collaborative and existing recommendations
    append(SortedCollaborativeRecommendations, SortedExistingRecommendations, AllRecommendations),
    % Remove duplicate recommendations
    remove_duplicates(AllRecommendations, UniqueRecommendations),
    % Format the recommendations for display
    format_recommendations(UniqueRecommendations, Recommendation).

% Print the list of recommendations
print_recommendations([]) :-
    nl,
    write('No suggestions.'), nl.
print_recommendations(Recommendations) :-
    print_recommendations_list(Recommendations).

% Print each recommendation in the list
print_recommendations_list([]).
print_recommendations_list([Recommendation|Tail]) :-
    write('- '), write(Recommendation), nl,
    print_recommendations_list(Tail).

% Check if a category exists
category_exists(Category) :-
    category(_, Category).

/* ====================================================================================================== */
/* menu section */ 

% Entry point of the program
init :-
    write('MAIN MENU:'), nl,
    write('1. go to user menu.'), nl,
    write('2. go to admin menu.'), nl,
    write('3. exit.'), nl,
    write('Select option...'), nl,
    read(Input),
    menu_switch(Input).

% main menu used by user
menu_switch(1) :-
    write('USER MENU '), nl,
    write('1. get suggestion.'), nl,
    write('2. review component.'), nl,
    write('3. check reviews.'), nl,
    write('4. Go back to main menu.'), nl,
    write('Select option...'), nl,
    read(Input),
    user_option(Input).

% main menu used by admin
menu_switch(2) :-
    write('ADMIN MENU'), nl,
    write('1. View all facts.'), nl,
    write('2. Insert new component.'), nl,
    write('3. Delete a fact.'), nl,
    write('4. Go back to main menu.'), nl,
    write('Select option...'), nl,
    read(Input),
    admin_option(Input).

menu_switch(3) :- write('Program exited...'),
                  halt.

% default case
menu_switch(_) :- write('Invalid operation, please try again.'),
                  nl,
                  init.

/* ====================================================================================================== */
/* User options section */ 

user_option(1) :- get_recommendation,
                  nl,
                  menu_switch(1).

user_option(2) :- review_component,
                  nl,
                  menu_switch(1).

user_option(3) :- listing(user_rating),
                  nl,
                  menu_switch(1).

user_option(4) :- init.
user_option(_) :- write('Invalid operation, please try again.'),
                  nl,
                  menu_switch(1).

get_recommendation :-

    write('Enter username: '), nl, 
    read(User),
    (   search_history(User, _)    % Check if the user exists in the search history
    ->  (
            write('Enter min price (or type "skip" to skip): '),
            read(MinPrice),

            write('Enter max price (or type "skip" to skip): '),
            read(MaxPrice),

            write('Enter category of product (or type "skip" to skip): '),
            read(CategoryFilter),

            (   
                category_exists(CategoryFilter) -> recommend(User, MinPrice, MaxPrice, CategoryFilter, Recommendations), nl,
                write('Recommendations for '), write(User), write(':'), nl, print_recommendations(Recommendations)
                
            ;   write('Category not found. Using "skip" for category filter.'), nl,
                recommend(User, MinPrice, MaxPrice, 'skip', Recommendations), nl,
                write('Recommendations for '), write(User), write(':'), nl, print_recommendations(Recommendations)
            )
        )
    ;   write('User not found.')
    ).

review_component :-

    write('Enter username:'), nl,
    read(Username),

    write('Enter component\'s model:'), nl,
    read(Model),

    write('Enter rating:'), nl,
    read(Rating),

    assert(user_rating(Username, Model, Rating)),
    write('Review added.'), nl.
/* ====================================================================================================== */
/* Admin options section */ 

admin_option(1) :- print_all_facts,
                   nl,
                   menu_switch(2).

admin_option(2) :- add_component,
                   nl,
                   menu_switch(2).

admin_option(3) :- delete_component,
                   nl,
                   menu_switch(2).

admin_option(4) :- init.
admin_option(_) :- write('Invalid operation, please try again.'),
                   nl,
                   menu_switch(2).


print_all_facts :-
    listing(category),
    listing(price),
    listing(user_rating).

add_component :-

    write('Enter component\'s category (cpu, gpu, ram):'), nl,
    read(Category),

    write('Enter component\'s model:'), nl,
    read(Model),

    write('Enter component\'s price:'), nl,
    read(Price),

    write('Enter component\'s performance [0.0 - 5.0]'), nl,
    read(Performance),

    assert(category(Model, Category)),
    assert(price(Model, Price)),
    assert(performance(Model, Performance)),

    write('Component added.'), nl.


delete_component :-
    
    write('Enter component model to delete from knowledge base:'), nl,
    read(Model),

    retractall(category(Model, _)),
    retractall(price(Model, _)),
    retractall(performance(Model, _)),

    write('Component removed.'), nl.