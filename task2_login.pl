% ARTI 401 - Session 10: Prolog Operators Part II
% Task 2: Login page with a maximum of 3 attempts

% ---------- Dataset: user(Username, Password) ----------
user(razan, 'razan123').
user(sara,  'sara2026').
user(ahmed, 'pass1').
user(admin, 'admin').

% ---------- Start ----------
% The user gets 1 attempt + 2 more attempts = 3 in total
login :-
    login(3).

% No attempts left
login(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

% Ask for the username and password
login(Attempts) :-
    Attempts > 0,
    write('Username: '), read(Username),
    write('Password: '), read(Password),
    check(Username, Password, Attempts).

% Correct username and password
check(Username, Password, _) :-
    user(Username, Password), !,
    write('Login Successful'), nl.

% Wrong username or password: decrease attempts and try again
check(_, _, Attempts) :-
    write('Login Unsuccessful'), nl,
    Left is Attempts - 1,
    (   Left > 0
    ->  write('You have '), write(Left), write(' attempt(s) left.'), nl
    ;   true
    ),
    login(Left).

% ---------- How to run ----------
% ?- login.
% Type every answer followed by a full stop, for example:
% Username: razan.
% Password: 'razan123'.
