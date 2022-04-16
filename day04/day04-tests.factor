! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors tools.test advent2021.day04 sequences ;
IN: advent2021.day04.tests

! !!!!!!!! parse-moves
{ { 7 4 9 5 11 } } [ "7,4,9,5,11" parse-moves ] unit-test

! !!!!!!!! parse-board

{ { { 22 13 17 11  0 }
    {  8  2 23  4 24 }
    { 21  9 14 16  7 }
    {  6 10  3 18  5 }
    {  1 12 20 15 19 } } }
[ { "22 13 17 11  0"
    " 8  2 23  4 24" 
    "21  9 14 16  7" 
    " 6 10  3 18  5" 
    " 1 12 20 15 19" } parse-board ] unit-test

! !!!!!! read04a

{ { 7 4 9 5 11 17 23 2 0 14 21 24 10 16 13 6 15 25 12 22 18 20 8 19 3 26 1
 } }
[ "vocab:advent2021/day04/example.txt" read04a moves-left>> ] unit-test

{ { { 22 13 17 11  0 }
    {  8  2 23  4 24 }
    { 21  9 14 16  7 }
    {  6 10  3 18  5 }
    {  1 12 20 15 19 } } }
[ "vocab:advent2021/day04/example.txt" read04a boards>> first ] unit-test
{ { {  3 15  0  2 22 }
    {  9 18 13 17  5 }
    { 19  8  7 25 23 }
    { 20 11 10 24  4 }
    { 14 21 16 12  6 } } }
[ "vocab:advent2021/day04/example.txt" read04a boards>> second ] unit-test
{ { { 14 21 17 24  4 }
    { 10 16 15  9 19 }
    { 18  8 23 26 20 }
    { 22 11 13  6  5 }
    {  2  0 12  3  7 } } }
[ "vocab:advent2021/day04/example.txt" read04a boards>> third ] unit-test

! !!!!!! play-to-win

! !!!!!! get-winning-board

! !!!!!! get-last-called

! !!!!!! score-board

! !!!!!! get-unmarked-numbers

! !!!! day04a
{ 4512 } [ "vocab:advent2021/day04/example.txt" day04a ] unit-test
{ 49686 } [ "vocab:advent2021/day04/data.txt" day04a ] unit-test
