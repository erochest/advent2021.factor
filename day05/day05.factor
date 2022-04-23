! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays combinators io.encodings.utf8 io.files kernel
math.parser math.ranges sequences splitting ;
IN: advent2021.day05

: strip-nl ( line -- line ) 10 swap remove ;
: pick-ends ( seq -- first last ) [ first ] [ last ] bi ;
: parse-split-point ( pair -- point )
    "," split [ string>number ] map ;
: parse-points ( x y -- x' y' ) [ parse-split-point ] bi@ ;
: parse-line-segment ( line -- segment )
    strip-nl " " split pick-ends parse-points 2array ;
: read05 ( path -- lines ) utf8 file-lines [
        parse-line-segment
    ] map ;

: split-segment ( segment -- from to ) [ first ] [ second ] bi ;
: xs ( from to -- x1 x2 ) [ first ] [ first ] bi* ;
: ys ( from to -- y1 y2 ) [ second ] [ second ] bi* ;
: xs-same? ( from to -- ? ) xs = ;
: ys-same? ( from to -- ? ) ys = ;
: expand-ys ( from to -- y-range x ) 2dup ys [a,b] -rot xs drop ;
: expand-xs ( from to -- x-range y ) 2dup xs [a,b] -rot ys drop ;
: pair-x ( y-range x -- seq ) [ swap 2array ] curry map ;
: pair-y ( x-range y -- seq ) [ 2array ] curry map ;
: on-straight? ( segment -- ? )
    split-segment [ xs-same? ] 2keep ys-same? or ;
: expand-straight-lines ( segment -- seq )
    split-segment {
        { [ 2dup xs-same? ] [ expand-ys pair-x ] }
        { [ 2dup ys-same? ] [ expand-xs pair-y ] }
        [ 2drop { } clone ]
    } cond
    ;
