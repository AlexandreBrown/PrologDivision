div(_, 0, nan, nan).

div(0, _, 0, 0).

div(A, A, 1, 0).

div(A, B, 0, A) :- A < B.

div(A, B, DivResult, DivRest) :-
    get_sign(A, B, Sign),
    A2 is abs(A),
    B2 is abs(B),
    rec_div(A2, B2, 0, DivResult, DivRest, Sign).

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

rec_div(A, B, Accum, DivResult, DivRest, Sign) :-
    A >= B,
    Quotient is A - B,
    succ(Accum, NewAccum),
    rec_div(Quotient, B, NewAccum, DivResult, DivRest, Sign).

rec_div(A, B, Accum, DivResult, DivRest, Sign) :-
    A < B,
    DivResult is Sign*Accum,
    DivRest is A.