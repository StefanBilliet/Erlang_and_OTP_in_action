%% This is a simple Erlang module

-module(my_module).

-define(PI, 3.14).

-export([pie/0, 
		 print/1, 
		 either_or_both/2,
		 area/1,
		 area_case/1,
		 sign/1,
		 customer_factory/3,
		 sum/1,
		 step_two/1,
		 step_two/2,
		 revert/1,
		 tailrevert/1,
		 tailrevert/2]).

-record(customer, {name="<anonymous>", address, phone}).

pie()->
	?PI.

print(Term) ->
	io:format("The value of Term is: ~p.~n", [Term]).

either_or_both(true,B) when is_boolean(B) -> true;
either_or_both(A,true) when is_boolean(A) -> true;
either_or_both(false,false) -> false.

area({circle, Radius}) ->
	Radius * Radius * math:pi();
area({square, Side}) ->
    Side * Side;
area({rectangle, Height, Width}) ->
	Height * Width.

area_case(Shape) ->
	case Shape of
		{circle, Radius} ->
			Radius * Radius * math:pi();
		{square, Side} ->
			Side * Side;
		{rectangle, Height, Width} ->
			Height * Width
	end.

sign(N) when is_number(N) ->
	if
		N > 0 -> positive;
		N < 0 -> negative;
		true -> zero
	end.

customer_factory(Name, Address, Phone) ->
	#customer{name = Name, address = Address, phone = Phone}.

sum(0) -> 0;
sum(N) -> sum(N-1) + N.

step_two(N, Total) when N =/= 0 -> step_two(N-1, Total + N);
step_two(0, Total) -> Total.
step_two(N) -> step_two(N, 0).

revert([]) -> [];
revert([X | TheRest]) -> revert(TheRest) ++ [X].

tailrevert(List) -> tailrevert(List, []).
tailrevert([X | TheRest], Acc) -> tailrevert(TheRest, [X|Acc]);
tailrevert([], Acc) -> Acc.
