# ifstring [![Build Status](https://drone.io/github.com/wilmoore/ifstring.erl/status.png)](https://drone.io/github.com/wilmoore/ifstring.erl/latest)

[![Build Status](https://travis-ci.org/wilmoore/ifstring.erl.png?branch=master)](https://travis-ci.org/wilmoore/ifstring.erl)

  Erlang string predicates.

## Installation

    % expm spec ifstring 0.0.2 --format scm | sh

## API

  - [ifstring:is_numeric()](#is_numeric)
  - [ifstring:is_numeric_or()](#is_numeric_or)
  - [ifstring:not_numeric()](#not_numeric)

### is_numeric()

  Is input value a string containing only numeric values?

    % true
    ifstring:is_numeric("112").

    % ["112","10"]
    lists:filter(fun ifstring:is_numeric/1, ["112", "OK", "10", "14s"]).

### is_numeric_or()

  If input value is a numeric string (`is_numeric`), return as-is.

    % "112"
    ifstring:is_numeric_or("112", "").

  If input value is not a numeric string (`is_numeric`), return alternative value.

    % "0"
    ifstring:is_numeric_or("OK", "0").

  `is_numeric_or()` is curried so you can **also** pass a single argument resulting in a [fun](http://www.erlang.org/doc/programming_examples/funs.html).

    % ["0","0","15","100"]
    lists:map(ifstring:is_numeric_or("0"), ["a", "b", "15", "100"]).

### not_numeric()

  Is input value **NOT** a string containing only numeric values?

    % true
    ifstring:not_numeric("OK").

    % ["OK","14s"]
    lists:filter(fun ifstring:not_numeric/1, ["112", "OK", "10", "14s"]).

## License

  MIT

