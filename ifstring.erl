-module(ifstring).
-export([is_numeric/1, not_numeric/1, is_numeric_or/1, is_numeric_or/2]).

%%
%% Is input value a string containing only numeric values?
%%

-spec is_numeric(any()) -> boolean().
is_numeric(S) when is_list(S) -> case re:run(S, "^[0-9]+$") of {match, _} -> true; nomatch -> false end;
is_numeric(_)                 -> false.

%%
%% If input value is a numeric string (is_numeric), return as-is.
%% If input value is not a numeric string (is_numeric), return alternative value.
%%
%% curried
%%

-spec is_numeric_or(any()) -> fun((any()) -> any()).
is_numeric_or(Alt) ->
  fun(S) -> is_numeric_or(Alt, S) end.

-spec is_numeric_or(any(), any()) -> any().
is_numeric_or(Alt, S) -> case is_numeric(S) of
  true  -> S;
  false -> Alt
end.

%%
%% Is input value NOT a string containing only numeric values?
%%

-spec not_numeric(any()) -> boolean().
not_numeric(S) -> not is_numeric(S).

