#!/bin/bash

# Shim that runs rebar3 and the escript.
pushd src/method-call-erlang && rebar3 escriptize && _build/default/bin/method-call && popd
