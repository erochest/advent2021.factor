! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test advent2021 accessors arrays kernel math.ranges sequences ;
IN: advent2021.tests

{ { 199 200 208 210 200 207 240 269 260 263 } }
[ "vocab:advent2021/day01.example.txt" read01 ] unit-test

{ { { 1 2 } { 2 3 } { 3 4 } { 4 5 } { 5 6 } } }
[ 6 [1,b] >pairs [ >array ] map ] unit-test

{ { t f f t } }
[ { { 4 5 } { 5 4 } { 9 8 } { 9 10 } } [ ascending? ] map ] unit-test

{ 7 } [ "vocab:advent2021/day01.example.txt" day01a ] unit-test
{ 1709 } [ "vocab:advent2021/day01.data.txt" day01a ] unit-test

{ 5 } [ "vocab:advent2021/day01.example.txt" day01b ] unit-test

{ 5 0 } [ <position> 5 forward dump-position ] unit-test
{ 0 8 } [ <position> 8 down dump-position ] unit-test
{ 0 -3 } [ <position> 3 up dump-position ] unit-test

{ 5 0 } [ <position> 5 "forward" parse-direction curry call dump-position ] unit-test
{ 0 8 } [ <position> 8 "down" parse-direction curry call dump-position ] unit-test
{ 0 -3 } [ <position> 3 "up" parse-direction curry call dump-position ] unit-test

{ 5 0 } [ <position> "forward 5" parse-sub-command call dump-position ] unit-test
{ 0 8 } [ <position> "down 8" parse-sub-command call dump-position ] unit-test
{ 0 -3 } [ <position> "up 3" parse-sub-command call dump-position ] unit-test

{ 5 5 }
[
    <position>
    { "forward 5" "down 8" "up 3" } [ parse-sub-command ] map
    exec-commands dump-position
]
unit-test

{ 150 } [ "vocab:advent2021/day02.example.txt" day02a ] unit-test
{ 1727835 } [ "vocab:advent2021/day02.data.txt" day02a ] unit-test

{ { 3 4 5 } } [ 3 4 5 submarine boa submarine->array ] unit-test

{ { 0 0 3 } } [ <submarine> 3 down-sub submarine->array ] unit-test
{ { 0 0 -4 } } [ <submarine> 4 up-sub submarine->array ] unit-test
{ { 4 12 3 } } [ 0 0 3 submarine boa 4 forward-sub submarine->array ] unit-test

! product
{ 0 } [ { 0 1 2 3 } product ] unit-test
{ 6 } [ { 1 2 3 } product ] unit-test

{ 900 } [ "vocab:advent2021/day02.example.txt" day02b ] unit-test
{ 1544000595 } [ "vocab:advent2021/day02.data.txt" day02b ] unit-test