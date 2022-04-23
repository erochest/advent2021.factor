! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test advent2021.day05 ;
IN: advent2021.day05.tests

{ { { { 0 9 } { 5 9 } } { { 8 0 } { 0 8 } } { { 9 4 } { 3 4 } }
    { { 2 2 } { 2 1 } } { { 7 0 } { 7 4 } } { { 6 4 } { 2 0 } }
    { { 0 9 } { 2 9 } } { { 3 4 } { 1 4 } } { { 0 0 } { 8 8 } }
    { { 5 5 } { 8 2 } } } }
[ "vocab:advent2021/day05/example.txt" read05 ] unit-test

{ { { 0 9 } { 5 9 } } } [ "0,9 -> 5,9\n" parse-line-segment ]
unit-test

{ { 0 9 } } [ "0,9" parse-split-point ] unit-test
