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
    write('Score: '), write(Score), nl,
    flush_output. % Add this line to flush the output buffer