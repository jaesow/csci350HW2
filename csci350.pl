/** Write a predicate sum-up-numbers-simple(L, N). L is a list, which may
contain as elements numbers and non-numbers. The predicate is true if N is the sum of the
numbers not in nested lists in L. If there are no such numbers, the result is zero.
**/

sum-up-numbers-simple([], 0).  %default case, list is empty
sum-up-numbers-simple([H|T], N) :- 
    number(H),
    sum-up-numbers-simple(T, Rem),
    N is H + Rem.
sum-up-numbers-simple([_|T], N) :-
    sum-up-numbers-simple(T, N).  
    
/** Write a predicate sum-up-numbers-general(L, N). L is a list, which may
contain as elements numbers and non-numbers. The predicate is true if N is the sum of all the
numbers (including those in nested lists) in L. If there are no such numbers, the result is zero.**/

sum-up-numbers-general([], 0). %check if head is list
sum-up-numbers-general([H|T], N) :-
    is_list(H),
    sum-up-numbers-general(T, Rem),
    sum-up-numbers-general(H, HeadSum),
    N is Rem + HeadSum.
sum-up-numbers-general([H|T], N) :- %check if number
    number(H),
    sum-up-numbers-general(T, Remainder),
    N is Remainder + H. 
sum-up-numbers-general([_|T], N) :- %if not list or number
    sum-up-numbers-general(T, N). 

/** Write a predicate min-above-min(L1, L2, N). L1 and L2 are both simple lists,
which do not contain nested lists. Both lists may have non-numeric elements. The predicate is
true if N is the minimum of the numbers in L1 that are larger than the smallest number in L2.
If there is no number in L2, all the numbers in L1 should be used to calculate the minimum. If
there is no number in L1 larger than the smallest number in L2, the predicate is false. **/

min-above-min([A], [], A) :-
    number(A).
    
min-above-min(L1, L2, N) :- %if list 2 is empty return the min of list one
    length(L2, 0),
    min-val(L1, N).
min-above-min([H|T], L2, H) :-   
    number(H),
     min-val(L2, MinL),
     MinL < H,
    bigger-num(T, MinL, H, H).
min-above-min([_|T], L2, Ans) :-
    min-above-min(T, L2, Ans).
    
    /**Write a predicate common-unique-elements(L1,L2,N). L1 and L2 are both
general lists, which may contain nested lists. The predicate is true if N is a simple list (i.e. a list 
without sub-lists) of the items that appear in both L1 and L2 (including the sub-lists within).
The elements in the result list must be unique. **/

common-unique-elements([], _, []).
common-unique-elements([H|T], L2, [H|Tail]) :- 
    not(is-member(H, T)),
    is-member(H, L2),
    common-unique-elements(T, L2, Tail).
    
 common-unique-elements([H|T], L2, ConcatList) :- 
    is_list(H),
    common-unique-elements(H, L2, Nested),
    common-unique-elements(T, L2, Tail),
    append(Nested, Tail, ConcatList). 
    
 common-unique-elements([_|T], L2, Tail) :-
    common-unique-elements(T, L2, Tail).
    
