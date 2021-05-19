#!/usr/bin/env escript

-module(for).
-export([main/1]).
-mode(compile).

create_list(Max, N, Acc) when N >= Max ->
    Acc;
create_list(Max, N, Acc) ->
    create_list(Max, N + 1, [N | Acc]).

sum([Hd | Tl], Acc) ->
    sum(Tl, Hd + Acc);
sum([], Acc) ->
    Acc.

main(_) ->
    List = create_list(1000000, 0, []),
    Sum = sum(List, 0),
    io:format("~p~n", [Sum]).
