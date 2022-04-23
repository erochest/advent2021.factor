! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays combinators io.encodings.utf8 io.files
kernel math math.parser math.ranges sequences splitting ;
IN: advent2021.day05

TUPLE: point
    { x integer read-only }
    { y integer read-only } ;
C: <point> point

TUPLE: segment
    { from point read-only }
    { to point read-only } ;
C: <segment> segment
! TODO: sequence protocol

: strip-nl ( line -- line ) 10 swap remove ;
: pick-ends ( seq -- first last ) [ first ] [ last ] bi ;
: 2array>point ( 2array -- point ) pick-ends <point> ;
: parse-split-point ( pair -- point )
    "," split [ string>number ] map 2array>point ;
: parse-points ( x y -- x' y' ) [ parse-split-point ] bi@ ;
: parse-line-segment ( line -- segment )
    strip-nl " " split pick-ends parse-points <segment> ;
: read05 ( path -- lines ) utf8 file-lines [
        parse-line-segment
    ] map ;

: split-segment ( segment -- from to ) [ from>> ] [ to>> ] bi ;
: xs ( from to -- x1 x2 ) [ x>> ] [ x>> ] bi* ;
: ys ( from to -- y1 y2 ) [ y>> ] [ y>> ] bi* ;
: xs-same? ( from to -- ? ) xs = ;
: ys-same? ( from to -- ? ) ys = ;
: expand-ys ( from to -- y-range x ) 2dup ys [a,b] -rot xs drop ;
: expand-xs ( from to -- x-range y ) 2dup xs [a,b] -rot ys drop ;
: pair-x ( y-range x -- seq ) [ swap <point> ] curry map ;
: pair-y ( x-range y -- seq ) [ <point> ] curry map ;
: on-straight? ( segment -- ? )
    split-segment [ xs-same? ] 2keep ys-same? or ;
: expand-straight-lines ( segment -- seq )
    split-segment {
        { [ 2dup xs-same? ] [ expand-ys pair-x ] }
        { [ 2dup ys-same? ] [ expand-xs pair-y ] }
        [ 2drop { } clone ]
    } cond
    ;
