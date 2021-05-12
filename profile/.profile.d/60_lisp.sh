#!/bin/sh

_implementations="
    sbcl
    ccl
    clasp
    clisp
    ecl
    abcl
"

for _implementation in ${_implementations}; do
	# shellcheck disable=SC2139
	if command -v "$_implementation" >/dev/null 2>&1; then
		if command -v rlwrap >/dev/null 2>&1; then
			alias lisp="rlwrap $_implementation"
		else
			alias lisp="$_implementation"
		fi

		break
	fi
done

unset _implementation _implementations
