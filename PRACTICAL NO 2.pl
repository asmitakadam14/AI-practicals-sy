%Facts
likes(anjali,romantic).
likes(asmita,animation).
likes(sakshi,horror).
likes(vedika,comedy).
likes(sanika,historical).

movie(romantic,shiddth ).
movie(animation,moanaa).
movie(horror,bhutnath).
movie(comedy,_3iditos).
movie(historical,tanaji).




%rules
recomended(User,Movie):-
likes(User,Cat),
movie(Cat,Movie).

