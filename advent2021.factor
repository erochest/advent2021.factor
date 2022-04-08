! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: grouping io.encodings.utf8 io.files kernel math math.parser sequences vectors ;
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

