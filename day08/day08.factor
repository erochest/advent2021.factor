! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.functions sequences splitting ;
IN: advent2021.day08

TUPLE: signal-output input-patterns output-values ;
C: <signal-output> signal-output

CONSTANT: item-offset 97
: parse-item ( item -- n ) item-offset - 2 swap ^ ;
: parse-pattern ( pattern-input -- n )
    [ parse-item ] map sum ;
: parse-pattern-seq ( input -- output )
    " " split [ parse-pattern ] map ;
: parse-line ( line -- signal-output )
    "|" split
    [ [ " \t\n\r" member? ] trim ] map
        [ first parse-pattern-seq ]
        [ second parse-pattern-seq ] bi
    <signal-output>
    ;
