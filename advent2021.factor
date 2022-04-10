! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays assocs grouping io.encodings.utf8 io.files kernel math math.parser
namespaces sequences splitting vectors ;
IN: advent2021

: read01 ( path -- seq )   utf8 file-lines [ string>number ] map ;
: >pairs ( seq -- seq' ) 2 clump ;
: ascending? ( pair -- ? ) [ first ] [ second ] bi < ;
: only-t ( seq -- seq ) [ ] filter ;
: count-t ( seq -- n ) only-t length ;
: day01a ( path -- increasing-count )
    read01 >pairs [ ascending? ] map count-t ;

: >windows ( seq -- seq ) 3 clump ;
: sum ( seq -- n ) [ 0 [ + ] reduce ] map ;
: day01b ( path -- increasing-window-count )
    read01 >windows sum >pairs [ ascending? ] map count-t ;

TUPLE: position distance depth ;

: <position> ( -- position ) 0 0 position boa ;

: forward ( position step -- position ) over distance>> + >>distance ;
: down ( position step -- position ) over depth>> + >>depth ;
: up ( position step -- position ) over depth>> swap - >>depth ;

SYMBOL: +direction-codes+
H{ { "forward" [ forward ] } { "down" [ down ] } { "up" [ up ] } } +direction-codes+ set-global
: parse-direction ( string -- callable ) +direction-codes+ get-global at ;
: parse-sub-command ( string -- closure )
    " " split [ second string>number ] [ first parse-direction ] bi curry ;
: exec-commands ( position command-seq -- position ) [ call( pos -- pos ) ] each ;
: dump-position ( position -- dist depth ) [ distance>> ] [ depth>> ] bi ;
: read02 ( path -- seq ) utf8 file-lines [ parse-sub-command ] map ;

: day02a ( path -- n ) read02 <position> swap exec-commands dump-position * ; 
