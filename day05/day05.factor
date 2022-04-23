! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays io.encodings.utf8 io.files kernel math.parser
sequences splitting ;
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

