
% Facts: Connections between locations
edge(pune, mumbai).
edge(pune, nashik).
edge(mumbai, thane).
edge(mumbai, surat).
edge(nashik, aurangabad).
edge(thane, surat).
edge(surat, vadodara).
edge(aurangabad, nagpur).

% Rules: Undirected connections
connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

% BFS: Find shortest path
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([[Current|Rest]|Queue], Goal, Path) :-
    findall(
        [Next, Current|Rest],
        (connected(Current, Next),
         \+ member(Next, [Current|Rest])),
        NewPaths
    ),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Path).

% Stop when no path exists
bfs_queue([], _, _) :- fail
