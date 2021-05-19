-module(toggle).
-behaviour(gen_server).
-mode(compile).

-export([start_link/1, stop/0]).
-export([value/0, activate/0]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link(StartState) ->
    gen_server:start_link({local, toggle}, toggle, [StartState], []).

value() ->
    gen_server:call(toggle, value).

activate() ->
    gen_server:cast(toggle, activate).

stop() ->
    gen_server:call(toggle, stop).

init([StartState]) ->
    {ok, StartState}.

handle_call(value, _From, State) ->
    {reply, State, State}.

handle_cast(activate, State) ->
    {noreply, not State}.
