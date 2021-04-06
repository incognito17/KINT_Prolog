word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(V1, V2, V3, H1, H2, H3) :- word(V1, _, V1_let2, _, V1_let4, _, V1_let6, _), word(V2, _, V2_let2, _, V2_let4, _, V2_let6, _), word(V3, _, V3_let2, _, V3_let4, _, V3_let6, _),
								   word(H1, _, H1_let2, _, H1_let4, _, H1_let6, _), word(H2, _, H2_let2, _, H2_let4, _, H2_let6, _), word(H3, _, H3_let2, _, H3_let4, _, H3_let6, _),
								   V1_let2 = H1_let2, V1_let4 = H2_let2, V1_let6 = H3_let2, V2_let2 = H1_let4, V2_let4 = H2_let4, V2_let6 = H3_let4,
								   V3_let2 = H1_let6, V3_let4 = H2_let6, V3_let6 = H3_let6.
								   
								   
% ---> Solution from site: http://cs.union.edu/~striegnk/courses/esslli04prolog/practical.day2.php?s=day2.node7.sol1
% crosswd(V1,V2,V3,H1,H2,H3) :-
%                word(V1,_,A,_,B,_,C,_),
%                word(V2,_,D,_,E,_,F,_),
%                word(V3,_,G,_,H,_,I,_),
%                word(H1,_,A,_,D,_,G,_),
%                word(H2,_,B,_,E,_,H,_),
%                word(H3,_,C,_,F,_,I,_).