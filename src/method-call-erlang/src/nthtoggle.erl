-module(nthtoggle).
-behaviour(gen_server).
-mode(compile).

-export([start_link/2, stop/0]).
-export([value/0, activate/0]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link(StartState, CountMax) ->
    gen_server:start_link({local, nthtoggle}, nthtoggle, [StartState, CountMax], []).

value() ->
    gen_server:call(nthtoggle, value).

activate() ->
    gen_server:cast(nthtoggle, activate).

stop() ->
    gen_server:call(nthtoggle, stop).

init([StartState, CountMax]) ->
    {ok, {StartState, 0, CountMax}}.

handle_call(value, _From, {State, _, _} = FullState) ->
    {reply, State, FullState}.

handle_cast(activate, {State, Count, Max}) when Count + 1 >= Max ->
    {noreply, {not State, 0, Max}};
handle_cast(activate, {State, Count, Max}) ->
    {noreply, {State, Count + 1, Max}}.
