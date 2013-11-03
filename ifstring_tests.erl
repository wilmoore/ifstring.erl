-module(ifstring_tests).
-import(ifstring, [is_numeric/1]).
-include_lib("eunit/include/eunit.hrl").

is_numeric__123_is_true_test() -> ?assert(ifstring:is_numeric("123")).

is_numeric_or__123_is_123_test() -> DefaultString = "DefaultString",
  ?assertEqual("123", ifstring:is_numeric_or(DefaultString, "123")).

not_numeric__123_is_false_test() ->
  ?assertNot(ifstring:not_numeric("123")).

is_numeric__empty_string_is_false_test() ->
  ?assertNot(ifstring:is_numeric("")).

not_numeric__empty_string_is_true_test() ->
  ?assert(ifstring:not_numeric("")).

is_numeric__abc_is_false_test() ->
  ?assertNot(ifstring:is_numeric("abc")).

is_numeric_or__abc_is_default_test() -> DefaultString = "",
  ?assertEqual(DefaultString, ifstring:is_numeric_or(DefaultString, "abc")).

not_numeric__abc_is_true_test() ->
  ?assert(ifstring:not_numeric("abc")).

is_numeric__He110_is_false_test() ->
  ?assertNot(ifstring:is_numeric("He110")).

not_numeric__He110_is_true_test() ->
  ?assert(ifstring:not_numeric("He110")).

is_numeric_or__single_arg_returns_fun_test() ->
  ?assert(is_function(ifstring:is_numeric_or(""))).

is_numeric_or__partial_application_test() ->
  Original = ["a", "b", "15", "100"],
  Expected = ["0", "0", "15", "100"],

  ?assertEqual(Expected, lists:map(ifstring:is_numeric_or("0"), Original)).

