! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test advent2021 arrays math.ranges sequences ;
IN: advent2021.tests

{ { 199 200 208 210 200 207 240 269 260 263 } }
[ "vocab:advent2021/day01.example.txt" read01 ] unit-test

{ { { 1 2 } { 2 3 } { 3 4 } { 4 5 } { 5 6 } } }
[ 6 [1,b] >pairs [ >array ] map ] unit-test

{ { t f f t } }
[ { { 4 5 } { 5 4 } { 9 8 } { 9 10 } } [ ascending? ] map ] unit-test

{ 7 } [ "vocab:advent2021/day01.example.txt" day01 ] unit-test
{ 1709 } [ "vocab:advent2021/day01.data.txt" day01 ] unit-test
