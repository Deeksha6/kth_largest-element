%kth largest element - kth_largest(L,K,E) - kth largest element of list L is E
%using merge_sort

if(P,Q,R) :- P,!,Q.
if(P,Q,R) :- R.

nat(0).
nat(s(X)) :- nat(X).

append([],Y,Y).
append([H|T],Y,[H|Z]) :- append(T,Y,Z).

divide(L,L1,L2) :- length(L,N),M is div(N,2),length(L1,M),Y is N-M,length(L2,Y),append(L1,L2,L).

list([]).
list([_|T]):-list(T).

merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(L,S) :-list(L), divide(L,L1,L2),merge_sort(L1,S1),merge_sort(L2,S2),merge(S1,S2,S).
merge([],L,L).
merge(L,[],L).
merge([X|T1],[Y|T2],[X|T]) :- X=<Y,merge(T1,[Y|T2],T).
merge([X|T1],[Y|T2],[Y|T]) :- X>Y,merge([X|T1],T2,T).

reverse([],[]).
reverse([H|T],R) :- reverse(T,Z),append(Z,[H],R).

partition(_,[],[],[]).
partition(P,[H|T],Ls,[H|Bs]) :- P<H,partition(P,T,Ls,Bs).
partition(P,[H|T],[H|Ls],Bs) :- P>=H, partition(P,T,Ls,Bs).

element_pos([E|_],E,0).
element_pos([_|T],E,P) :- element_pos(T,E,P1),P is P1+1.

break(T,_,Med,Rmed) :- length(T,N),N < 5,merge_sort(T,T1),get_med(T1,Med,Rmed).
break([H1,H2,H3,H4,H5|T],Q,Med,Rmed) :- Q>=0,  merge_sort([H1,H2,H3,H4,H5],[_,_,S3,_,_]),append(Med,[S3],Med1),Q1 is Q-1,break(T,Q1,Med1,Rmed).

get_med([],Med,Med).
get_med([T],Med,Rmed) :- append(Med,[T],Rmed).
get_med([H,_],Med,Rmed) :- append(Med,[H],Rmed).
get_med([_,H2,_],Med,Rmed) :- append(Med,[H2],Rmed).
get_med([_,H2,_,_],Med,Rmed) :- append(Med,[H2],Rmed).
get_med([_,_,H3,_,_],Med,Rmed) :- append(Med,[H3],Rmed).

med_of_meds(Rmed,M) :- length(Rmed,N),Q is div(N,5), break(Rmed,Q,[],M).

kth_largest([H],_,H).
kth_largest([H|T],K,E) :- length([H|T],N),Q is div(N,5),break([H|T],Q,[],Rmed),med_of_meds(Rmed,M),V is M,merge_sort([H|T],L),reverse(L,R),
element_pos(R,V,Pos),partition(V,[H|T],Ls,Bs),if(K=<Pos,K1 is K,K1 is K-Pos),if(K=<Pos,kth_largest(Bs,K1,E),kth_largest(Ls,K1,E)).