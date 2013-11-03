LIB=ifstring
SRC=$(wildcard *.erl)

compile: $(SRC)
	@erlc -pa . $(SRC)

clean:
	@$(RM) -r *.beam

test: clean compile
	@erl -pa . -eval "eunit:test($(LIB)_tests), init:stop()."
