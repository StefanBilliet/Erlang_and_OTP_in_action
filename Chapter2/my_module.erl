%% This is a simple Erlang module

-module(my_module).

-export([pie/0, print/1]).

pie()->
	3.14.

print(Term) ->
	io:format("The value of Term is: ~p.~n", [Term]).