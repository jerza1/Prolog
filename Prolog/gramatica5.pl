child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).
descend(X,Y):- child(X,Y).
descend(X,Y):- child(X,Z),
	descend(Z,Y).

% 11 ?- findall(Child,descend(Mother,Child),List).
% List = [charlotte, caroline, laura, rose, caroline, laura, rose, laura,
% rose|...].

% bagof(C,descend(M,C),L).
%M = caroline,
%L = [laura, rose] ;
%M = charlotte,
%L = [caroline, laura, rose] ;
%M = laura,
%L = [rose] ;
%M = martha,
%L = [charlotte, caroline, laura, rose].

% bagof(C,M^descend(M,C),L).
 % (^) no importa quien en M
% L = [charlotte, caroline, laura, rose, caroline, laura, rose, laura,
% rose|...].

%14 ?- setof(C,M^descend(M,C),L).
%L = [caroline, charlotte, laura, rose].
