! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: advent2021.io arrays kernel math math.ranges sequences ;
IN: advent2021.day07

: distances-from ( seq pos -- seq ) [ - abs ] curry map ;
: fuel-from ( seq pos -- fuel ) distances-from sum ;
: domain ( seq -- seq ) [ infimum ] [ supremum ] bi [a,b] ;
: all-distances ( seq -- dist-fuel-seq )
    dup domain [
        dupd fuel-from
    ] map
    nip ;
: least-fuel ( seq -- fuel ) all-distances infimum ;
: day07a ( path -- n ) read>numbers least-fuel ;

: sigma ( n -- n ) [1,b] sum ;
: crab-fuel ( from to -- fuel ) - abs sigma ;
: crab-fuel-from ( seq pos -- fuel )
    [ crab-fuel ] curry map sum ;
: all-crab-fuels ( seq -- crab-fuel-seq )
    dup domain [
        dupd crab-fuel-from
    ] map nip ;
: least-crab-fuel ( seq -- fuel ) all-crab-fuels infimum ;
: day07b ( path -- n ) read>numbers least-crab-fuel ;
