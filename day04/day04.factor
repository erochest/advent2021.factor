! Copyright (C) 2022 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays io io.encodings.utf8 io.files kernel locals math math.parser
prettyprint sequences sequences.generalizations splitting combinators.short-circuit ;
IN: advent2021.day04

:: inc-nth ( n seq -- ) n seq nth 1 + n seq set-nth ;
: cursor-next-row ( pair -- ) 0 over inc-nth -1 1 rot set-nth ;
: cursor-next-col ( pair -- ) 1 swap inc-nth ;

! a play-board-seq indexes each item with an array of completion zones.
:: board>play-board ( board-seq -- play-board-seq )
    30 f <array> :> play-board-seq
    -1 -1 2array board-seq [
        [ dup cursor-next-row ] dip
        [
            [ dup cursor-next-col dup clone ] dip
            play-board-seq set-nth
        ] each
    ] each
    drop
    play-board-seq
    ;

TUPLE: bingo-board board play hits ;
: <bingo-board> ( board -- bingo-board )
    dup board>play-board
    5 0 <array> 5 0 <array> 2array
    bingo-board boa ;

: winning? ( board -- ? )
    hits>>
    { [ first [ 5 = ] any? ] [ second [ 5 = ] any? ] }
    1|| ;

: mark-square ( board move -- pair )
    ! "mark-square" print .s nl
    [ play>> ] dip
    [ swap nth ] 2keep
    f swap rot set-nth
    ;
: incr-col-hit ( hits col -- )
    ! "incr-col-hit" print .s nl
    [ first ] dip 
    [ over nth ] keep
    [ 1 + ] dip
    rot set-nth ;
: incr-row-hit ( hits col -- )
    ! "incr-row-hit" print .s nl
    [ second ] dip
    [ over nth ] keep
    [ 1 + ] dip
    rot set-nth ;
: make-move ( board move -- )
    ! "make-move" print .s nl
    dupd mark-square
    [ hits>> ] dip
    [ first ] [ second ] bi
    overd incr-row-hit
    incr-col-hit 
    ;

TUPLE: bingo-game boards moves-left last-move winning ;
: <bingo-game> ( boards moves-left -- bingo-game )
    [ [ <bingo-board> ] map ] dip f f bingo-game boa ;

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

: update-moves ( game -- move )
    ! "update-moves" print .s nl
    dup moves-left>> unclip
    [ >>moves-left ] dip
    [ >>last-move ] keep
    nip ;
! :: mark-hits ( move game -- )
!     ! "mark-hits" print .s nl
!     game hits>> :> hits
!     game play-boards>> [ move swap nth ] map :> pairs
!     pairs length 1 -
!     [ dup 0 >= ] [
!         ! pair hits pair-0 ! index
!         [ pairs nth ] keep
!         [
!             hits over first incr-col-hit
!             hits swap second incr-row-hit
!         ] dip
!         ! "in while" print .s nl
!         1 -
!     ] while
!     drop
!     ;
! : mark-number ( move game -- )
!     ! "mark-number" print .s nl
!     f -rot
!     play-boards>> [
!         [ set-nth ] 3keep drop
!     ] each
!     2drop ;
:: make-game-move ( game -- )
    ! "make-game-move" print .s nl
    game update-moves :> move
    game boards>> [ move make-move ] each
    game boards>> [ winning? ] filter
    dup [ length zero? ] [ drop f ] [ first ] if
    game winning<<
    drop
    ;

: play-to-win ( bingo-game -- bingo-game )
    [ dup winning>> not ] [
        dup make-game-move
    ] while ;

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
