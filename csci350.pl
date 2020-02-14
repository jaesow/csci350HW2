/** Write a predicate sum-up-numbers-simple(L, N). L is a list, which may
contain as elements numbers and non-numbers. The predicate is true if N is the sum of the
numbers not in nested lists in L. If there are no such numbers, the result is zero.
**/

sum-up-numbers-simple([], 0).  %default case, list is empty
sum-up-numbers-simple([H|T], N) :- 
    number(H),
    sum-up-numbers-simple(T, Rem),
    N is H + Rem.
