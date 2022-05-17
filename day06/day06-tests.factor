! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: advent2021.day06 sorting tools.test ;
IN: advent2021.day06.tests

{ V{ 2 } } [ 3 fish-day ] unit-test
{ V{ 1 } } [ 2 fish-day ] unit-test
{ V{ 0 } } [ 1 fish-day ] unit-test
{ V{ 6 8 } } [ 0 fish-day ] unit-test

{ { 0 1 2 2 3 } } [ V{ 3 4 3 1 2 } school-day natural-sort ]
unit-test
{ { 0 1 1 2 6 8 } } [ V{ 2 3 2 0 1 } school-day natural-sort ]
unit-test

{ { 0 0 0 1 1 1 1 1 2 2 2 3 3 4 4 5 6 6 6 6 6 7 8 8 8 8 } }
[ V{ 3 4 3 1 2 } 18 school-generations natural-sort ] unit-test

{ 5934 } [ V{ 3 4 3 1 2 } 80 school-generations checksum ]
unit-test

{ { 3 4 3 1 2 } }
[ "vocab:advent2021/day06/example.txt" read-numbers ] unit-test

{ 5934 } [ "vocab:advent2021/day06/example.txt" day06a ]
unit-test
{ 389726 } [ "vocab:advent2021/day06/data.txt" day06a ]
unit-test
