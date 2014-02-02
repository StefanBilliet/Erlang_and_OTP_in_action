%% This is a simple Erlang module

-module(my_module).

-export([pie/0, print/1, either_or_both/2]).

pie()->
	3.14.

print(Term) ->
	io:format("The value of Term is: ~p.~n", [Term]).

either_or_both(true,B) when is_boolean(B) -> true;
either_or_both(A,true) when is_boolean(A) -> true;
either_or_both(false,false) -> false.