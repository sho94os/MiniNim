a.out: nim.tab.o lex.yy.o
	cc -g nim.tab.o lex.yy.o -lfl -lm

nim.tab.o: nim.tab.h nim.tab.c
	cc -g -c nim.tab.c

lex.yy.o: nim.tab.h lex.yy.c
	cc -g -c lex.yy.c

lex.yy.c: nim.l
	flex nim.l

nim.tab.h: nim.y
	bison -d nim.y -v

clean:
	rm nim.tab.c nim.tab.o lex.yy.o a.out nim.tab.h lex.yy.c