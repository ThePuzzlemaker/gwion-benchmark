#!/usr/bin/env escript

-module(fib).
-export([main/1]).
-mode(compile).

-spec fib(int) -> int.
fib(N) when N < 2 ->
    N;
fib(N) ->
    fib(N - 1) + fib(N - 2).

loop(0) ->
    ok;
loop(N) ->
    io:format("~p~n", [fib(28)]),
    loop(N - 1).

main(_) ->
    loop(5).
