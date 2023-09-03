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


% ===========================================================================================

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
    (Denominator = 0 -> Score = 0 ; Score is SumProduct / Denominator),
    write('Statistics for User1: Sum = '), write(Sum1), write(', Sum of Squares = '), write(SumSquared1), nl,
    write('Statistics for User2: Sum = '), write(Sum2), write(', Sum of Squares = '), write(SumSquared2), nl,
    write('Dot Product = '), write(SumProduct), nl,
    write('Denominator1 = '), write(Denominator1), nl,
    write('Denominator2 = '), write(Denominator2), nl,
    write('Denominator = '), write(Denominator), nl,
    write('Score: '), write(Score), nl.

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

% ===========================================================================================

get_recommendation :-

    write('Enter username: '), nl, 
    read(User),
    (   search_history(User, _)    % Check if the user exists in the search history
    ->  (
            write('Enter the minimum price you are willing to pay: '), nl, 
            read(MinPrice),

            write('enter the maximum price you are willing to pay: '), nl,
            read(MaxPrice),

            write('Enter the category of the product you are searching for (cpu, gpu or ram),'), nl,
            write('or enter "skip" to let the system choose a category for you:'), nl, 
            read(SelectedCategory),

            recommend(User, MinPrice, MaxPrice, SelectedCategory, Recommendations), nl,
            write('Recommendations for '), write(User), write(':'), nl, print_recommendations(Recommendations)

        )
    ;   write('User not found.')
    ).