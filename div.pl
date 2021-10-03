div(A, B, DivResult, DivRest) :-
    B \== 0,
    (
        (
            A == 0,
            DivResult is 0,
            DivRest is 0
        );
        (
            get_sign(A, B, Sign),
            A2 is abs(A),
            B2 is abs(B),
            (
                can_divide(A2, B2),
                rec_div(A2, B2, 0, DivResult, DivRest, Sign)
            );
            (
                DivResult is 0,
                DivRest is A
            )
        )
    ).

get_sign(A, B, Sign) :- 
    (
        (
            (
                A >= 0, 
                B >= 0
            );
            (
                A < 0,
                B < 0
            )
        ),
        Sign is 1
    );
    Sign is -1.

can_divide(Dividend, Divisor) :- Dividend >= Divisor.

rec_div(A, B, Accum, DivResult, DivRest, Sign) :-
    Rest is (A - B),
    (
        (
            can_divide(Rest, B),
            succ(Accum, NewAccum),
            rec_div(Rest, B, NewAccum, DivResult, DivRest, Sign)
        );
        (
            succ(Accum, NewAccum),
            DivResult is Sign*NewAccum,
            DivRest is Rest
        )
    ).