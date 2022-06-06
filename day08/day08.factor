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
: split-items ( seq -- seq ) " " split ;
: parse-pattern-seq ( input -- output )
    split-items [ parse-pattern ] map ;
: trim-whitespace ( seq -- seq )
    [ " \t\n\r" member? ] trim ;
: split-fields ( seq -- seq ) "|" split ;
: parse-line ( line -- signal-output )
    split-fields
    [ trim-whitespace parse-pattern-seq ] map
    first2 <signal-output> ;
