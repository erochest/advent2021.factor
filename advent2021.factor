! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays assocs grouping io.encodings.utf8 io.files kernel math math.parser
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

SYMBOL: +direction-codes+
H{ { "forward" 0 } { "down" 1 } { "up" 2 } } +direction-codes+ set-global
: parse-direction ( string -- n ) +direction-codes+ get-global at ;
: parse-sub-command ( string -- pair )
    " " split [ first parse-direction ] [ second string>number ] bi 2array ;
: read02 ( path -- seq ) utf8 file-lines [ parse-sub-command ] map ;
