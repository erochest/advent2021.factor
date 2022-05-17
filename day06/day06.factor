! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.

USING: arrays io.encodings.utf8 io.files kernel math
math.parser math.ranges prettyprint sequences splitting
vectors ;
IN: advent2021.day06

: fish-day ( fish -- new-fish-seq )
    [ 6 8 V{ } 2sequence ] [ 1 - 1vector ] if-zero ; inline
: school-day ( school -- new-school )
    [ fish-day ] map concat ;
: school-generations ( start-school days -- school )
    [1,b] [ drop school-day ] each ;
: checksum ( school -- n ) length ;
: read-file-contents ( path -- seq ) utf8 file-contents ;
: split-fields ( seq -- seq )
    ",\n\r" split [ empty? not ] filter ;
: seq>numbers ( seq -- seq ) [ string>number ] map ;
: read-numbers ( path -- seq )
    read-file-contents split-fields seq>numbers ;
: day06a ( path -- n )
    read-numbers 80 school-generations checksum ;
