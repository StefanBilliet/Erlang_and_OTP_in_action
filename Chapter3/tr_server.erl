%%%-------------------------------------------------------------------
%%% @author Martin & Eric <erlware-dev@googlegroups.com>
%%%  [http://www.erlware.org]
%%% @copyright 2008-2010 Erlware
%%% @doc RPC over TCP server. This module defines a server process that
%%%      listens for incoming TCP connections and allows the user to
%%%      execute RPC commands via that TCP stream.
%%% @end
%%%-------------------------------------------------------------------

-module(tr_server).

-behaviour (gen_server).

-export([start_link/0, start_link/1, get_count/0, stop/0]).
-export ([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(DEFAULT_PORT, 1055).

-record (state, {port, lsock, request_count = 0}).

%%%-------------------------------------------------------------------
%%% API
%%%-------------------------------------------------------------------

start_link() ->
	start_link(?DEFAULT_PORT).

start_link(Port) ->
	gen_server:start_link({local, SERVER}, ?MODULE, [Port], []).

get_count() ->
	gen_server:call(?SERVER, get_count);

stop() ->
	gen_server:cast(?SERVER, stop);