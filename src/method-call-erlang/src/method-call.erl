-module('method-call').
-export([main/1]).
-mode(compile).

loop1(0) ->
    io:format("~p~n", [toggle:value()]);
loop1(N) ->
    toggle:activate(),
    loop1(N - 1).

loop2(0) ->
    io:format("~p~n", [nthtoggle:value()]);
loop2(N) ->
    nthtoggle:activate(),
    loop2(N - 1).

main(_) ->
    N = 100000,
    toggle:start_link(true),
    loop1(N),
    nthtoggle:start_link(true, 3),
    loop2(N).
