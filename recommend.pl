% declaring dynamic facts for db assert and retract operations
:- dynamic category/2.
:- dynamic price/2.
:- dynamic user_rating/3.

% Users registered in the recommendation system
user(simone).
user(francesco).
user(nicholas).
user(giacomo).

% Facts of search history of registered users
% simone is a user who searched mostly cpus
search_history(simone, [intel_i9, intel_i7, amd_ryzen_7, intel_i7, intel_i5, amd_rx_6500, nvidia_rtx_3060, intel_celeron]).

% francesco is a user who searched mostly gpus
search_history(francesco, [nvidia_rtx_3090, amd_rx_6900, nvidia_rtx_3080, nvidia_rtx_3070, amd_rx_6800, g_skill_32gb, crucial_32gb, intel_i5]).

% nicholas is a user who searched mostly ram modules
search_history(nicholas, [corsair_16gb, g_skill_32gb, crucial_32gb, patriot_16gb, a_data_32gb, intel_i5, intel_i7]).

% giacomo is a user who haven't searched for nothing but still gets some suggestions
search_history(giacomo,[]).


% Facts of products about their category (cpu, gpu, ram), their price, and their ratings expressed by user reviews
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
user_rating(simone, nvidia_rtx_3060, 4.0).

user_rating(francesco, nvidia_rtx_3090, 5.0).
user_rating(francesco, amd_rx_6900, 4.6).
user_rating(francesco, nvidia_rtx_3080, 4.9).

user_rating(nicholas, corsair_16gb, 4.0).
user_rating(nicholas, g_skill_32gb, 4.2).
user_rating(nicholas, kingston_8gb, 3.8).
user_rating(nicholas, intel_i5, 3.8).
user_rating(nicholas, amd_ryzen_9, 4.8).

user_rating(giacomo, intel_i7, 4.0).
user_rating(giacomo, g_skill_32gb, 5.0).


/* ====================================================================================================== */
% Calculate the Pearson correlation coefficient between two lists of ratings

pearson_correlation(RatingsUserA, RatingsUserB, Score) :-
    % Get the length of both rating lists (assuming they have the same length)
    length(RatingsUserA, N),
    length(RatingsUserB, N),
    % Calculate statistics for User1's ratings
    statistics(RatingsUserA, Sum1, SumSquared1),
    % Calculate statistics for User2's ratings
    statistics(RatingsUserB, Sum2, SumSquared2),
    % Calculate the dot product of ratings between User1 and User2
    dot_product(RatingsUserA, RatingsUserB, SumProduct),
    % Calculate the denominator for Pearson correlation coefficient
    denominator(N, Sum1, SumSquared1, Denominator1),
    denominator(N, Sum2, SumSquared2, Denominator2),
    denominator(Denominator1, Denominator2, N, Denominator), % Pass N as the fourth parameter
    % Calculate the Score
    (Denominator = 0 -> Score = 0 ; Score is SumProduct / Denominator).

% Calculate the sum and sum of squared ratings in a list
statistics([], 0, 0).
statistics([Rating|Rest], Sum, SumSquared) :-
    % Recursively calculate the sum and sum of squared ratings
    statistics(Rest, RestSum, RestSumSquared),
    Sum is RestSum + Rating,
    SumSquared is RestSumSquared + Rating * Rating.

% Calculate the dot product of ratings between two lists
dot_product([], [], 0).
dot_product([Rating1|Rest1], [Rating2|Rest2], DotProduct) :-
    % Recursively calculate the dot product
    dot_product(Rest1, Rest2, RestDotProduct),
    DotProduct is RestDotProduct + Rating1 * Rating2.

% Calculate the denominator for Pearson correlation coefficient
denominator(0, _, _, 0) :- !. % Avoid division by zero
denominator(N, Sum, SumSquared, Denominator) :-
    % Calculate the denominator using the Pearson formula
    Denominator is sqrt(N * SumSquared - Sum * Sum).



/* ====================================================================================================== */
% recommendation system core

% Define a recommend predicate that generates product recommendations for a user
recommend(User, MinPrice, MaxPrice, SelectedCategory, Recommendations) :-

    % Get the user's search history
    search_history(User, SearchHistory),

    % Find products that match the user's search history, category filter, and price range
    find_matching_products(SearchHistory, SelectedCategory, MinPrice, MaxPrice, MatchingProducts),

    % Get the user's ratings for products
    find_user_ratings(User, UserRatings),

    % Find similar users based on their ratings
    find_similar_users(User, UserRatings, SimilarUsers),

    % Generate collaborative recommendations based on what similar users have searched for
    generate_collaborative_recommendations(SimilarUsers, CollaborativeRecommendations),

    % Combine, sort, and remove duplicates from both collaborative and existing recommendations
    merge_and_sort_recommendations(MatchingProducts, CollaborativeRecommendations, UniqueRecommendations),

    % Format the unique recommendations into a list of strings for display
    format_recommendations(UniqueRecommendations, Recommendations).

/* ====================================================================================================== */
% recommendation system core helper functions

% Find products that match the user's search history, category filter, and price range
find_matching_products(SearchHistory, SelectedCategory, MinPrice, MaxPrice, MatchingProducts) :-
    findall(Product, (member(Product, SearchHistory),
                      category(Product, Category),
                      (SelectedCategory = 'skip' ; SelectedCategory = Category),
                      price(Product, Price),
                      Price >= MinPrice,
                      Price =< MaxPrice), MatchingProducts).

% Find the user's ratings for products
find_user_ratings(User, UserRatings) :-
    findall(Rating-Product, user_rating(User, Product, Rating), UserRatings).

% Find similar users based on their ratings
find_similar_users(User, UserRatings, SimilarUsers) :-
    findall(OtherUser-Similarity, (
        user(OtherUser),
        OtherUser \= User,
        find_similar(UserRatings, OtherUser, Similarity)
    ), SimilarUsers).

% Define a predicate to find the similarity between two users based on their ratings
find_similar(UserRatings, OtherUser, Similarity) :-
    find_user_ratings(OtherUser, OtherUserRatings),
    pearson_correlation(UserRatings, OtherUserRatings, Similarity).

% Generate collaborative recommendations based on similar users
generate_collaborative_recommendations(SimilarUsers, CollaborativeRecommendations) :-
    findall(Product, (member(OtherUser, SimilarUsers),
                      user_rating(OtherUser, Product, Rating),
                      Rating >= 3.3), CollaborativeRecommendations).

% Merge, sort, and remove duplicates from recommendations
merge_and_sort_recommendations(MatchingProducts, CollaborativeRecommendations, UniqueRecommendations) :-
    append(MatchingProducts, CollaborativeRecommendations, AllRecommendations),
    sort(AllRecommendations, SortedRecommendations),
    remove_duplicates(SortedRecommendations, UniqueRecommendations).

% Define a predicate to remove duplicates from a list
remove_duplicates([], []).
remove_duplicates([X|Xs], [X|Ys]) :-
    remove_duplicates(Xs, Ys),
    \+ member(X, Ys).

% Format recommendations into a list of strings
format_recommendations([], []).
format_recommendations([Product|Rest], [Formatted|FormattedRest]) :-
    format_product(Product, Formatted),
    format_recommendations(Rest, FormattedRest).

% Format a product for display
format_product(Product, Formatted) :-
    category(Product, Category),
    price(Product, Price),
    atomic_list_concat([Product, ' (Category: ', Category, ', Price: $', Price, ')'], Formatted).

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
    (   search_history(User, SearchHistory) ->
        (   SearchHistory = [] ->  % Check if the user's search history is empty
            % User has an empty search history, recommend default products
            DefaultRecommendations = [amd_ryzen_7, nvidia_rtx_3070, g_skill_32gb],
            write('Since your search history is empty, we recommend the following products:'), nl,
            print_recommendations(DefaultRecommendations)
        ;
            write('Enter the minimum price you are willing to pay: '), nl,
            read(MinPrice),

            write('Enter the maximum price you are willing to pay: '), nl,
            read(MaxPrice),

            write('Enter the category of the product you are searching for (cpu, gpu, or ram),'), nl,
            write('or enter "skip" to let the system choose a category for you:'), nl,
            read(SelectedCategory),

            recommend(User, MinPrice, MaxPrice, SelectedCategory, Recommendations),
            nl,
            write('Recommendations for '), write(User), write(':'), nl,
            print_recommendations(Recommendations)
        )
    ;
    write('User not found.')).

review_component :-

    write('Enter username:'), nl,
    read(Username),

    write('Enter component\'s model:'), nl,
    read(Model),

    write('Enter rating:'), nl,
    read(Rating),

    assert(user_rating(Username, Model, Rating)),
    write('Review added.'), nl.

% Define a predicate to print recommendations
print_recommendations([]) :- !. % Don't print anything if the list is empty.

print_recommendations(Recommendations) :-
    print_recommendations_list(Recommendations).

print_recommendations_list([]).
print_recommendations_list([Recommendation|Rest]) :-
    write('- '), write(Recommendation), nl,
    print_recommendations_list(Rest).

/* ====================================================================================================== */
/* Admin options and db management section */ 

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

    assert(category(Model, Category)),
    assert(price(Model, Price)),

    write('Component added.'), nl.


delete_component :-
    
    write('Enter component model to delete from knowledge base:'), nl,
    read(Model),

    retractall(category(Model, _)),
    retractall(price(Model, _)),
    retractall(price(user_rating, _)),

    write('Component removed.'), nl.