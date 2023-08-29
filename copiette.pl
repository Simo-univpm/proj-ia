:- dynamic category/2.
:- dynamic price/2.
:- dynamic performance/2.
:- dynamic user_rating/3.


% FACTS

% Users
user(john).
user(wick).
user(lisa).
user(homer).
user(marge).
user(bart).

% Search history of users
search_history(john, [intel_i9_10900k, amd_ryzen_9_5950x, intel_core_i7_11700k, amd_ryzen_7_5800x, intel_core_i5_11600k]).
search_history(wick, [amd_ryzen_9_5950x, intel_core_i7_11700k, amd_ryzen_5_5600x, nvidia_geforce_rtx_3080]).
search_history(lisa, [nvidia_geforce_rtx_3090, amd_radeon_rx_6900_xt, nvidia_geforce_rtx_3080, amd_radeon_rx_6800_xt, nvidia_geforce_rtx_3070]).
search_history(homer, [corsair_vengeance_rgb_pro_16gb, g_skill_trident_z_neo_32gb, kingston_hyperx_predator_8gb, crucial_ballistix_32gb, team_group_t_force_delta_16gb]).
search_history(marge, [intel_i9_10900k, nvidia_geforce_rtx_3090, amd_ryzen_9_5950x, intel_core_i7_11700k, nvidia_geforce_rtx_3080]).
search_history(bart, [nvidia_geforce_rtx_3090, intel_i9_10900k, amd_radeon_rx_6900_xt, nvidia_geforce_rtx_3080, amd_ryzen_9_5950x]).

% Categorization of products
category(intel_i9_10900k, cpu).
category(amd_ryzen_9_5950x, cpu).
category(intel_core_i7_11700k, cpu).
category(amd_ryzen_7_5800x, cpu).
category(intel_core_i5_11600k, cpu).
category(amd_ryzen_5_5600x, cpu).
category(intel_pentium_gold_g6600, cpu).
category(amd_athlon_gold_4500g, cpu).
category(intel_celeron_g5905, cpu).
category(amd_ryzen_3_5300g, cpu).
category(nvidia_geforce_rtx_3090, gpu).
category(amd_radeon_rx_6900_xt, gpu).
category(nvidia_geforce_rtx_3080, gpu).
category(amd_radeon_rx_6800_xt, gpu).
category(nvidia_geforce_rtx_3070, gpu).
category(amd_radeon_rx_6700_xt, gpu).
category(nvidia_geforce_rtx_3060_ti, gpu).
category(amd_radeon_rx_6600_xt, gpu).
category(nvidia_geforce_rtx_3050, gpu).
category(amd_radeon_rx_6500_xt, gpu).
category(corsair_vengeance_rgb_pro_16gb, ram).
category(g_skill_trident_z_neo_32gb, ram).
category(kingston_hyperx_predator_8gb, ram).
category(crucial_ballistix_32gb, ram).
category(team_group_t_force_delta_16gb, ram).
category(hyperx_fury_rgb_8gb, ram).
category(patriot_viper_steel_16gb, ram).
category(a_data_xpg_spectrix_d60g_32gb, ram).
category(mushkin_enhanced_redline_16gb, ram).
category(samsung_32gb_ddr4_ecc, ram).

% Price facts for products
price(intel_i9_10900k, 499.99).
price(amd_ryzen_9_5950x, 749.99).
price(intel_core_i7_11700k, 399.99).
price(amd_ryzen_7_5800x, 449.99).
price(intel_core_i5_11600k, 299.99).
price(amd_ryzen_5_5600x, 279.99).
price(intel_pentium_gold_g6600, 89.99).
price(amd_athlon_gold_4500g, 129.99).
price(intel_celeron_g5905, 59.99).
price(amd_ryzen_3_5300g, 119.99).
price(nvidia_geforce_rtx_3090, 1499.99).
price(amd_radeon_rx_6900_xt, 999.99).
price(nvidia_geforce_rtx_3080, 799.99).
price(amd_radeon_rx_6800_xt, 649.99).
price(nvidia_geforce_rtx_3070, 599.99).
price(amd_radeon_rx_6700_xt, 449.99).
price(nvidia_geforce_rtx_3060_ti, 399.99).
price(amd_radeon_rx_6600_xt, 349.99).
price(nvidia_geforce_rtx_3050, 229.99).
price(amd_radeon_rx_6500_xt, 199.99).
price(corsair_vengeance_rgb_pro_16gb, 129.99).
price(g_skill_trident_z_neo_32gb, 199.99).
price(kingston_hyperx_predator_8gb, 69.99).
price(crucial_ballistix_32gb, 149.99).
price(team_group_t_force_delta_16gb, 89.99).
price(hyperx_fury_rgb_8gb, 59.99).
price(patriot_viper_steel_16gb, 109.99).
price(a_data_xpg_spectrix_d60g_32gb, 169.99).
price(mushkin_enhanced_redline_16gb, 119.99).
price(samsung_32gb_ddr4_ecc, 249.99).

% Performance facts for products
performance(intel_i9_10900k, 4.7).
performance(amd_ryzen_9_5950x, 4.9).
performance(intel_core_i7_11700k, 4.5).
performance(amd_ryzen_7_5800x, 4.6).
performance(intel_core_i5_11600k, 4.2).
performance(amd_ryzen_5_5600x, 4.4).
performance(intel_pentium_gold_g6600, 3.0).
performance(amd_athlon_gold_4500g, 3.5).
performance(intel_celeron_g5905, 2.8).
performance(amd_ryzen_3_5300g, 3.2).
performance(nvidia_geforce_rtx_3090, 4.8).
performance(amd_radeon_rx_6900_xt, 4.7).
performance(nvidia_geforce_rtx_3080, 4.6).
performance(amd_radeon_rx_6800_xt, 4.5).
performance(nvidia_geforce_rtx_3070, 4.3).
performance(amd_radeon_rx_6700_xt, 4.1).
performance(nvidia_geforce_rtx_3060_ti, 3.9).
performance(amd_radeon_rx_6600_xt, 3.8).
performance(nvidia_geforce_rtx_3050, 3.0).
performance(amd_radeon_rx_6500_xt, 2.9).
performance(corsair_vengeance_rgb_pro_16gb, 4.3).
performance(g_skill_trident_z_neo_32gb, 4.5).
performance(kingston_hyperx_predator_8gb, 3.6).
performance(crucial_ballistix_32gb, 4.0).
performance(team_group_t_force_delta_16gb, 3.8).
performance(hyperx_fury_rgb_8gb, 3.5).
performance(patriot_viper_steel_16gb, 3.9).
performance(a_data_xpg_spectrix_d60g_32gb, 4.2).
performance(mushkin_enhanced_redline_16gb, 3.7).
performance(samsung_32gb_ddr4_ecc, 4.4).

% User ratings for products
user_rating(john, intel_i9_10900k, 4.5).
user_rating(john, amd_ryzen_9_5950x, 4.8).
user_rating(john, intel_core_i7_11700k, 4.4).
user_rating(wick, intel_i9_10900k, 4.5).
user_rating(wick, amd_ryzen_5_5600x, 4.8).
user_rating(wick, intel_core_i7_11700k, 4.4).
user_rating(lisa, nvidia_geforce_rtx_3090, 5.0).
user_rating(lisa, amd_radeon_rx_6900_xt, 4.6).
user_rating(lisa, nvidia_geforce_rtx_3080, 4.9).
user_rating(homer, corsair_vengeance_rgb_pro_16gb, 4.0).
user_rating(homer, g_skill_trident_z_neo_32gb, 4.2).
user_rating(homer, kingston_hyperx_predator_8gb, 3.8).
user_rating(marge, nvidia_geforce_rtx_3090, 4.7).
user_rating(marge, intel_i9_10900k, 4.6).
user_rating(marge, amd_radeon_rx_6900_xt, 4.5).
user_rating(bart, nvidia_geforce_rtx_3090, 4.9).
user_rating(bart, intel_i9_10900k, 4.8).
user_rating(bart, amd_ryzen_7_5800x, 4.7).




% RULES

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
    (Denominator = 0 -> Similarity = 0 ; Similarity is Numerator / Denominator).

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

% Parse the price input, converting "skip" to -1.0
parse_price_input(skip, -1.0) :- !.
parse_price_input(Value, ParsedValue) :-
    (   number(Value)
    ->  ParsedValue is float(Value)
    ;   write('Invalid price input. Skipping price filter.'), nl,
        ParsedValue = -1.0
    ).

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


% Main entry point of the program
init :-
    write('MAIN MENU:'), nl,
    write('1. login as user.'), nl,
    write('2. login as admin.'), nl,
    write('3. exit.'), nl, 
    
    read(Input),
    menu_switch(Input).




/*
il menu utente dovrà dividersi in procedure come quello dell'admin
e seguire quindi la "stessa sintassi"
*/

% main menu used by user
menu_switch(1) :-
    write('USER MENU '), nl,
    write('1. get suggestion.'),
    write('2. rate component.'),
    write('3. Go back to main menu.'), nl,
    write('Select option...'), nl,
    read(Input),
    user_option(Input).

/*
user_option(1) :- 
user_option(2) :- 
user_option(3) :- 
*/

% main menu used by user
menu_switch_OLD(1) :-
    write('USER MENU '), nl,
    write('Enter your username: '),
    read(User),
    (   search_history(User, _)    % Check if the user exists in the search history
    ->  (
            write('Enter the minimum price (or type "skip" to skip): '),
            read(MinPriceInput),
            parse_price_input(MinPriceInput, MinPrice),
            write('Enter the maximum price (or type "skip" to skip): '),
            read(MaxPriceInput),
            parse_price_input(MaxPriceInput, MaxPrice),
            write('Enter the category (or type "skip" to skip): '),
            read(CategoryFilter),
            (   category_exists(CategoryFilter)
            ->  recommend(User, MinPrice, MaxPrice, CategoryFilter, Recommendations),
                nl,
                write('Recommendations for '), write(User), write(':'), nl,
                print_recommendations(Recommendations)
            ;   write('Category not found. Using "skip" for category filter.'), nl,
                recommend(User, MinPrice, MaxPrice, 'skip', Recommendations),
                nl,
                write('Recommendations for '), write(User), write(':'), nl,
                print_recommendations(Recommendations)
            )
        )
    ;   write('User not found.')
    ).

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
menu_switch(_) :- write('Invalid operation, please try again.'),
                  nl,
                  init.



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
    listing(performance).

add_component :-

    write('Insert component\'s category (cpu, gpu, ram):'), nl,
    read(Category),

    write('Insert component\'s model:'), nl,
    read(Model),

    write('Insert component\'s price:'), nl,
    read(Price),

    write('Insert component\'s performance [0.0 - 5.0]'), nl,
    read(Performance),

    assert(category(Model, Category)),
    assert(price(Model, Price)),
    assert(performance(Model, Performance)),

    write('Component added.'), nl.


delete_component :-
    
    write('Insert component model to delete from knowledge base:'), nl,
    read(Model),

    retractall(category(Model, _)),
    retractall(price(Model, _)),
    retractall(performance(Model, _)),

    write('Component removed.'), nl.