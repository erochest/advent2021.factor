! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays io.encodings.utf8 io.files kernel math.parser
sequences splitting ;
IN: advent2021.day05

: parse-split-point ( pair -- point )
    "," split [ string>number ] map ;
: parse-line-segment ( line -- segment )
    10 swap remove
    " " split
    [ first ] [ last ] bi
    [ parse-split-point ] bi@
    2array ;
: read05 ( path -- lines ) utf8 file-lines ;

