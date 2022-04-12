! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays io.encodings.utf8 io.files kernel math.parser
sequences ;
IN: advent2021.day03

: read-data ( path -- array ) utf8 file-lines [ bin> ] map ;