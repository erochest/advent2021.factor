! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: grouping io.encodings.utf8 io.files kernel math math.parser sequences vectors ;
IN: advent2021

: read01 ( path -- seq )   utf8 file-lines [ string>number ] map ;

: >pairs ( seq -- seq' ) 2 clump ;

: ascending? ( pair -- ? ) [ first ] [ second ] bi < ;

: only-t ( seq -- seq ) [ ] filter ;

: day01 ( path -- increasing-count )
    read01 >pairs [ ascending? ] map only-t length ;

