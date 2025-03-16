#!/bin/bash

assert() {
    expeted="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expeted" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expeted expected, but got $actual"
        exit 1
    fi
}

assert 0 0 
assert 42 42

echo OK