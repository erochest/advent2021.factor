! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: io.encodings.utf8 io.files kernel math math.parser
sequences splitting ;
IN: advent2021.day04

: boards>play-boards ( board-seq -- play-board-seq ) ;

TUPLE: bingo-game boards moves-left play-boards last-move winning ;
: <bingo-game> ( boards moves-left -- bingo-game )
    over boards>play-boards f f bingo-game boa ;

: parse-moves ( string -- number-seq ) "," split [ string>number ] map ;
: parse-board ( string-seq -- bingo-board )
    [ " " split [ length 0 > ] filter [ string>number ] map ] map ;

: read04a ( path -- bingo-game )
    utf8 file-lines
    [ length zero? ] split-when
    unclip
       [ [ parse-board ] map ]
       [ first parse-moves ] bi*
    <bingo-game> ;
: play-to-win ( bingo-game -- bingo-game ) ;
: get-winning-board ( bingo-game -- bingo-board ) ;
: get-last-called ( bingo-game -- n ) ;
: score-board ( bingo-board last-number -- score ) drop ;
: get-unmarked-numbers ( bingo-board -- seq ) ;

: day04a ( path -- checksum )
    read04a
    play-to-win
       [ get-winning-board ]
       [ get-last-called ] bi
    score-board
    ;
