! Copyright (C) 2022 Eric Rochester.
! See http://factorcode.org/license.txt for BSD license.
USING: advent2021.day08 sequences tools.test ;
IN: advent2021.day08.tests

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

{ 7 } [ 127 count-bits ] unit-test
{ 2 } [  36 count-bits ] unit-test

{ 10 }
[ "vocab:advent2021/day08/example.txt" read-patterns length ]
unit-test
{ T{
    signal-output
    f
    {
        0b0010010 0b1111111 0b1111110 0b1111101 0b1010110
        0b1111100 0b1111011 0b0111110 0b0101111 0b0011010
    }
    { 0b1111111 0b0111110 0b1111110 0b1010110 }
} }
[ "vocab:advent2021/day08/example.txt" read-patterns first ]
unit-test

{ 2 }
[ { 0b1111111 0b0111110 0b1111110 0b1010110 } count-unique-patterns ]
unit-test
{ 26 } [ "vocab:advent2021/day08/example.txt" day08a ] unit-test
{ 512 } [ "vocab:advent2021/day08/data.txt" day08a ] unit-test
