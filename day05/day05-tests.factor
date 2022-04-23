! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test advent2021.day05 ;
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
