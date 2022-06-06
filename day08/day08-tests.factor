! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: advent2021.day08 sequences tools.test ;
IN: advent2021.day08.tests

! a  1
! b  2
! c  4
! d  8
! e 16
! f 32
! g 64
{ T{
    signal-output
    f
    {
        0b1111111 0b0111110 0b1101101 0b0101111 0b0001011
        0b0111111 0b1111110 0b0110011 0b1011111 0b0000011
    }
    { 0b0111110 0b0101111 0b0111110 0b0101111 }
} }
[
    "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
    parse-line
] unit-test

{ {
    0b1110111 0b0100100 0b1011101 0b1101101 0b0101110
    0b1101011 0b1111011 0b0100101 0b1111111 0b1101111
} }
[
    {
        "beagcf" "cf" "eadgc" "adgcf" "bdcf"
        "bgdaf" "fgdaeb" "fca" "gdabfce" "adgcbf"
    }
    [ parse-pattern ] map
] unit-test

