! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors assocs advent2021.io hashtables kernel locals
math math.bits math.functions namespaces sequences splitting
vectors ;
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

: count-bits ( n -- count ) make-bits sift length ;
:: index-n ( n hashtable -- )
    n count-bits :> bits
    bits hashtable at [
        n swap push
    ] [
        n 1vector
        bits hashtable set-at
    ] if* ;

SYMBOL: signal-patterns
{
    0b1110111 0b0100100 0b1011101 0b1101101 0b0101110
    0b1101011 0b1111011 0b0100101 0b1111111 0b1101111
} signal-patterns set-global
SYMBOL: signal-pattern-index
H{ } clone
signal-patterns get-global [ over index-n ] each
signal-pattern-index set-global

: read-patterns ( path -- patterns )
    (file-lines) [ parse-line ] map ;
: count-unique-patterns ( pattern-seq -- x )
    signal-pattern-index get-global swap
    [ count-bits over at length 1 = ] count
    nip
    ;
: day08a ( path -- n )
    read-patterns
    [ output-values>> count-unique-patterns ] map
    sum
    ;
