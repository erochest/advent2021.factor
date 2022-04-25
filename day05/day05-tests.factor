! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: advent2021.day05 sequences tools.test ;
IN: advent2021.day05.tests

{ { T{ segment f T{ point f 0 9 } T{ point f 5 9 } }
    T{ segment f T{ point f 8 0 } T{ point f 0 8 } }
    T{ segment f T{ point f 9 4 } T{ point f 3 4 } }
    T{ segment f T{ point f 2 2 } T{ point f 2 1 } }
    T{ segment f T{ point f 7 0 } T{ point f 7 4 } }
    T{ segment f T{ point f 6 4 } T{ point f 2 0 } }
    T{ segment f T{ point f 0 9 } T{ point f 2 9 } }
    T{ segment f T{ point f 3 4 } T{ point f 1 4 } }
    T{ segment f T{ point f 0 0 } T{ point f 8 8 } }
    T{ segment f T{ point f 5 5 } T{ point f 8 2 } } } }
[ "vocab:advent2021/day05/example.txt" read05 ] unit-test

{ T{ segment f T{ point f 0 9 } T{ point f 5 9 } } }
[ "0,9 -> 5,9\n" parse-line-segment ]
unit-test

{ T{ point f 0 9 } } [ "0,9" parse-split-point ] unit-test

{ t }
[ T{ segment f T{ point f 1 1 } T{ point f 1 3 } } on-straight? ]
unit-test
{ t }
[ T{ segment f T{ point f 9 7 } T{ point f 7 7 } } on-straight? ]
unit-test
{ f }
[ T{ segment f T{ point f 0 0 } T{ point f 8 8 } } on-straight? ]
unit-test

{ { T{ point f 1 1 } T{ point f 1 2 } T{ point f 1 3 } } }
[ T{ segment f T{ point f 1 1 } T{ point f 1 3 } }
  expand-straight-lines ] unit-test
{ { T{ point f 9 7 } T{ point f 8 7 } T{ point f 7 7 } } }
[ T{ segment f T{ point f 9 7 } T{ point f 7 7 } }
  expand-straight-lines ] unit-test
{ { } }
[ T{ segment f T{ point f 0 0 } T{ point f 8 8 } }
  expand-straight-lines ] unit-test

{ 4 } [ 0  9 <point> 3 9 <point> <segment> length ] unit-test
{ 4 } [ 3  9 <point> 0 9 <point> <segment> length ] unit-test
{ 4 } [ 3  6 <point> 3 9 <point> <segment> length ] unit-test
{ 5 } [ 3 10 <point> 3 6 <point> <segment> length ] unit-test
{ 0 } [ 4 11 <point> 3 6 <point> <segment> length ] unit-test

{ T{ point f 1  9 } } [ 1 0  9 <point> 3 9 <point> <segment> nth ] unit-test
{ T{ point f 2  9 } } [ 2 0  9 <point> 3 9 <point> <segment> nth ] unit-test
{ T{ point f 3 10 } } [ 0 3 10 <point> 3 6 <point> <segment> nth ] unit-test
{ T{ point f 3  6 } } [ 4 3 10 <point> 3 6 <point> <segment> nth ] unit-test

[ 4 11 <point> 1 0 9 <point> 3 9 <point> <segment> set-nth ] must-fail

{ { T{ point f 1 1 } T{ point f 1 2 } T{ point f 1 3 } } }
[ 1 1 <point> 1 3 <point> <segment> expanded>> ] unit-test

{ { T{ point f 9 7 } T{ point f 8 7 } T{ point f 7 7 } } }
[ 9 7 <point> 7 7 <point> <segment> expanded>> ] unit-test
