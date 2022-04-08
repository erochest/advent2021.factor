! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: io.encodings.utf8 io.files kernel math math.parser sequences vectors ;
IN: advent2021

: read01 ( path -- seq )   utf8 file-lines [ string>number ] map ;

