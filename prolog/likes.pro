likes(wallace, cheese).
likes(grommit, cheese).
likes(wandolene, sheep).

friend(X, Y) :- likes(X, Z), likes(Y, Z), \+(X = Y).
friend_me(X, Y) :- likes(X, Z), likes(Y, Z).