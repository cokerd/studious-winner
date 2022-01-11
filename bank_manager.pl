/* BANK MANAGER EXPERT SYSTEM */
/* ========================== */

/* INFERENCE ENGINE */

/* Main program rule */

go:- put(12),write('** BANK MANAGER **'),nl,nl,
ask_questions(0,Total),
decide(Total).

/* Rule to ask the questions */

ask_questions(10,0).

ask_questions(Q,Total):-
NextQ is Q + 1,
write_question(NextQ),
write('Answer here: '),
read(Answer),nl,
data(NextQ,Answer,Points),
ask_questions(NextQ,SmallTotal),
Total is SmallTotal + Points.

ask_questions(Q,Total):-write('Please try again!'),nl,
ask_questions(Q,Total).

/* INTERFACE */

/* Rule to write out a question */

write_question(Q):-text(Q,Text),write(Text),nl,fail.
write_question(_):-nl.

/* KNOWLEDGE BASE */

/* Facts to make loan decision */

decide(Total):- Total > 35,
write('You get your loan.'),nl.
decide(Total):- Total < 25,
write('Sorry, no loan.'),nl.
decide(_):-write('You might get a loan.'),nl.

/* Text for questions */

text(1,'1. Are you single, married, widowed, divorced,').
text(1,' or seperated? (Awnser s, m, w, d or p.)').

text(2,'2. What is your age?').

text(3,'3. Would you describe the area where you live as').
text(3,' run-down inner city, average or high class?').
text(3,' (Awnser r, a or h.)').

text(4,'4. How many years (to the nearest year) have you').
text(4,' been at your present address? (Awnser 0.5 if').
text(4,' six months or less.)').

text(5,'5. Is you present address occupied as owner (o),').
text(5,' tenant (t), unfurnished or council tenant (u),').
text(5,' with parents or relatives (r), free with job').
text(5,' (f), or lodger (I) ?').

text(6,'6. Is your job office worker (o), skilled manual'). 
text(6,' (s), part-time (pt), unemployed (u),').
text(6,' supervisor (s), manager or director (md),').
text(6,' professional (p), or self-employed (se) ?').

text(7,'7. Can you supply employers name and address?').
text(7,' (y/n)').

text(8,'8. Credit cards: none (n), Access (a), Visa (v),').
text(8,' Access and Visa (av), Amex (x), Diners (d).').

text(9,'9. How many loans do you have oustanding? ').

text(10,'10. Have you had previous credit with this bank?').
text(10,' (Answer n for none, one for one successful').
text(10,' loan, two for two or more successful loans,').
text(10,' or term for a loan that was terminated.)').

/* Data facts for the awnsers given */

data(1,s,2).
data(1,m,5).
data(1,w,3).
data(1,d,1).
data(1,p,1).

data(2,X,1):-X < 25.
data(2,X,5):-X > 24, X < 30.
data(2,X,3):-X > 29, X < 50.
data(2,X,5):-X > 49, X < 60.
data(2,X,3):-X > 59.

data(3,r,2).
data(3,a,5).
data(3,h,9).

data(4,0.5,1).
data(4,Ans,3):-Ans > 0, Ans < 4.
data(4,Ans,4):-Ans > 3, Ans < 8.
data(4,Ans,6):-Ans > 7, Ans < 13.
data(4,Ans,7):-Ans > 12.

data(5,o,9).
data(5,t,4).
data(5,u,7).
data(5,r,1).
data(5,f,3).
data(5,l,2).

data(6,o,3).
data(6,s,3).
data(6,pt,2).
data(6,u,1).
data(6,s,4).
data(6,md,7).
data(6,p,9). 
data(6,se,3).

data(7,y,4).
data(7,n,0).

data(8,n,1).
data(8,a,4).
data(8,v,4).
data(8,x,5).
data(8,d,5).

data(9,0,4).
data(9,1,6).
data(9,2,2).
data(9,Ans,1):-Ans > 2.

data(10,n,4).
data(10,one,7).
data(10,two,10).
data(10,term,-20).

/* END */



  



