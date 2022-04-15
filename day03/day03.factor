! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays bit-arrays bit-vectors io io.encodings.utf8 io.files kernel locals math math.bitwise
math.order math.parser sequences ;
IN: advent2021.day03

: read-data ( path -- array ) utf8 file-lines [ bin> ] map ;
: left-bit ( seq -- n ) 0 [ max ] reduce next-power-of-2 -1 shift ;
: scan-mask ( seq mask -- seq ) [ mask? ] curry map ;
: next-mask ( mask -- mask' ) 1 shift ;
: count-bools ( seq -- true-count false-count ) [ ] partition [ length ] bi@ ;
:: 2swap ( a b c d -- c d a b ) c d a b ;
: accum-bits-epsilon ( inverse given ? -- inverse given )
    [ over push ] keep
    not [ over push ] curry dip 
    ;
: bit-vector>integer ( bit-vector -- n ) >bit-array bit-array>integer ;
:: gamma-epsilon ( seq -- gamma epsilon )
    0 <bit-vector> 0 <bit-vector>
    seq left-bit 1
    [ 2dup >= ] [
        seq over scan-mask count-bools <
        -rot next-mask
        [ accum-bits-epsilon ] 2dip
    ] while
    2drop
;

: day03a ( path -- checksum )
    read-data gamma-epsilon [ bit-vector>integer ] bi@ * ;