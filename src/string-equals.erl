#!/usr/bin/env escript

-module('string-equals').
-import(string, [equal/2]).
-export([main/1]).
-mode(compile).

compare([{S1, S2} | Tl], Acc) ->
    case equal(S1, S2) of
        true ->
            compare(Tl, Acc + 1);
        false ->
            compare(Tl, Acc)
    end;
compare([], Acc) ->
    Acc.

loop(0, Count) ->
    Count;
loop(N, Count) ->
    loop(N - 1, compare([
        {"abc", "abc"},
        {"a slightly longer string",
         "a slightly longer string"},
        {"a significantly longer string but still not overwhelmingly long string",
         "a significantly longer string but still not overwhelmingly long string"},
        {"", "abc"},
        {"abc", "abcd"},
        {"changed one character", "changed !ne character"},
        {"a slightly longer string",
         "a slightly longer string!"},
        {"a slightly longer string",
         "a slightly longer strinh"},
        {"a significantly longer string but still not overwhelmingly long string",
         "another"}
    ], Count)).

main(_) ->
    io:format("~p~n", [loop(1000000, 0)]).
