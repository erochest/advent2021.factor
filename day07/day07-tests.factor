! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test advent2021.day07 ;
IN: advent2021.day07.tests

{ { 15 0 1 1 3 1 6 0 1 13 } }
[ { 16 1 2 0 4 2 7 1 2 14 } 1 distances-from ]
unit-test

{ 41 } [ { 16 1 2 0 4 2 7 1 2 14 }  1 fuel-from ] unit-test
{ 37 } [ { 16 1 2 0 4 2 7 1 2 14 }  2 fuel-from ] unit-test
{ 39 } [ { 16 1 2 0 4 2 7 1 2 14 }  3 fuel-from ] unit-test
{ 71 } [ { 16 1 2 0 4 2 7 1 2 14 } 10 fuel-from ] unit-test

{ { 10 9 8 7 10 } } [ { 4 1 1 4 5 } all-distances ] unit-test

{ 37 } [ { 16 1 2 0 4 2 7 1 2 14 } least-fuel ] unit-test

{ 37 }
[ "vocab:advent2021/day07/example.txt" day07a ]
unit-test
{ 356922 }
[ "vocab:advent2021/day07/data.txt" day07a ]
unit-test

{ 1 } [ 1 sigma ] unit-test
{ 3 } [ 2 sigma ] unit-test
{ 66 } [ 11 sigma ] unit-test

{ 66 } [ 16 5 crab-fuel ] unit-test
{ 10 } [  1 5 crab-fuel ] unit-test
{  6 } [  2 5 crab-fuel ] unit-test
{ 15 } [  0 5 crab-fuel ] unit-test

{ 168 }
[ "vocab:advent2021/day07/example.txt" day07b ]
unit-test
{ 100347031 }
[ "vocab:advent2021/day07/data.txt" day07b ]
unit-test
