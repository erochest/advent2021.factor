! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays assocs advent2021.io bit-arrays
fry hashtables kernel locals math math.bits math.bitwise
math.functions math.parser namespaces sequences sorting
splitting vectors ;
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

:: index-n ( n hashtable -- )
    n bit-count :> bits
    bits hashtable at [
        n swap push
    ] [
        n 1vector
        bits hashtable set-at
    ] if* ;

!  aaaa
! b    c
! b    c
!  dddd
! e    f
! e    f
!  gggg
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
    [ bit-count over at length 1 = ] count
    nip ;
: day08a ( path -- n )
    read-patterns
    [ output-values>> count-unique-patterns ] map
    sum ;

: zero? ( n -- ? ) bit-count 6 = ;
: one? ( n -- ? ) bit-count 2 = ;
: two? ( n -- ? ) bit-count 5 = ;
: three? ( n -- ? ) bit-count 5 = ;
: four? ( n -- ? ) bit-count 4 = ;
: five? ( n -- ? ) bit-count 5 = ;
: six? ( n -- ? ) bit-count 6 = ;
: seven? ( n -- ? ) bit-count 3 = ;
: eight? ( n -- ? ) bit-count 7 = ;
: nine? ( n -- ? ) bit-count 6 = ;

: mask-one ( inputs scratch -- scratch )
    <enumerated> [
        [ second over ] keep
        first 1 = [
            [ mask ] curry map
        ] [
            [ unmask ] curry map
        ] if
    ] map
    nip ;
: mask-seven ( inputs scratch -- scratch )
    <enumerated> [
        [ second over ] keep
        first 7 = [
            [ mask ] curry map
        ] [
            [ unmask ] curry map
        ] if
    ] map
    nip ;

SYMBOL: pattern-order
{ 1 7 4 2 3 5 0 6 9 8 } pattern-order set-global

: patterns-for-bit-count ( count -- seq )
    signal-pattern-index get-global at ;
: signal-patterns-indexed ( -- seq )
    signal-patterns get-global <enumerated> ;
: find-bit-count-match ( n -- seq )
    signal-patterns-indexed swap
    bit-count patterns-for-bit-count
    '[ second _ member? ] filter
    [ first ] map ;

: build-scratchpad ( -- seq )
    10 0 <array>
    [ drop 7 0b1111111 <array> ] map ;
: set-segments ( elt ns scratchpad -- ) drop 2drop ;

: solve-output ( pattern -- n )
    dup input-patterns>>
    [ bit-count ] sort-with
    [
        drop
        ! integer>bit-array <enumerated> [ second ] filter [ first ] map
        ! dup length signal-pattern-index get-global at
        ! dup length = 1 [
            ! pick swap first
            ! integer>bit-array <enumerated> [ second ] filter [ first ] map

        ! ] [

        ! ] if
    ] each
    ;

: day08b ( path -- n )
    read-patterns
    [ solve-output ] map
    sum ;
