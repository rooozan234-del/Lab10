% ARTI 401 - Session 10: Prolog Operators Part II
% Task 1: Area and perimeter of square, rectangle and triangle

% ---------- Area ----------
% Square: (side)^2
area(square(Side), Area) :-
    Side > 0,
    Area is Side * Side.

% Rectangle: width x height
area(rectangle(Width, Height), Area) :-
    Width > 0, Height > 0,
    Area is Width * Height.

% Triangle: 1/2 x base x vertical height
area(triangle(Base, Height), Area) :-
    Base > 0, Height > 0,
    Area is 0.5 * Base * Height.

% ---------- Perimeter ----------
% Square: 4 x side
perimeter(square(Side), P) :-
    Side > 0,
    P is 4 * Side.

% Rectangle: 2 x (width + height)
perimeter(rectangle(Width, Height), P) :-
    Width > 0, Height > 0,
    P is 2 * (Width + Height).

% Triangle: a + b + c
perimeter(triangle(A, B, C), P) :-
    A > 0, B > 0, C > 0,
    P is A + B + C.

% ---------- Print both results ----------
square(Side) :-
    area(square(Side), A),
    perimeter(square(Side), P),
    write('Square area = '), write(A), nl,
    write('Square perimeter = '), write(P), nl.

rectangle(W, H) :-
    area(rectangle(W, H), A),
    perimeter(rectangle(W, H), P),
    write('Rectangle area = '), write(A), nl,
    write('Rectangle perimeter = '), write(P), nl.

% Base, vertical height, then the three sides a, b, c
triangle(Base, Height, SA, SB, SC) :-
    area(triangle(Base, Height), A),
    perimeter(triangle(SA, SB, SC), P),
    write('Triangle area = '), write(A), nl,
    write('Triangle perimeter = '), write(P), nl.

% ---------- Example queries ----------
% ?- area(square(5), A).                 A = 25
% ?- perimeter(square(5), P).            P = 20
% ?- area(rectangle(4, 6), A).           A = 24
% ?- perimeter(rectangle(4, 6), P).      P = 20
% ?- area(triangle(6, 4), A).            A = 12.0
% ?- perimeter(triangle(3, 4, 5), P).    P = 12
% ?- square(5).
% ?- rectangle(4, 6).
% ?- triangle(6, 4, 5, 5, 6).
