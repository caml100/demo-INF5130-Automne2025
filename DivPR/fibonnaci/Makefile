OPTION = -Wall
Rep1 = executableImperatif
Rep2 = executableFonctionnel

.IGNORE: fonctionnel fib

all: clean imperatif fonctionnel

imperatif: naif memo dynamique diviser_pour_regner
	mkdir ${Rep1}
	mv fibNaif ${Rep1} && mv fibMemo ${Rep1} && mv fibDynamique ${Rep1} && mv fibDPR ${Rep1}

naif: ./imperatif/fibNaif.cpp
	g++ ${OPTION} -o fibNaif ./imperatif/fibNaif.cpp

memo: ./imperatif/fibMemo.cpp
	g++ ${OPTION} -o fibMemo ./imperatif/fibMemo.cpp

dynamique: ./imperatif/fibDynamique.cpp
	g++ ${OPTION} -o fibDynamique ./imperatif/fibDynamique.cpp

diviser_pour_regner: ./imperatif/fibDPR.cpp
	g++ ${OPTION} -o fibDPR ./imperatif/fibDPR.cpp

fonctionnel: fib
	mkdir ${Rep2}
	mv fibNaive ${Rep2} && mv fibDPR ${Rep2} && mv fibTerm ${Rep2}


fib: ./fonctionnel/fibNaiveOc.ml ./fonctionnel/fibDPR.ml ./fonctionnel/fibTerm.ml
	ocamlopt -o fibNaive ./fonctionnel/fibNaiveOc.ml
	ocamlopt -o fibDPR ./fonctionnel/fibDPR.ml
	ocamlopt -o fibTerm ./fonctionnel/fibTerm.ml
	rm ./fonctionnel/*.cmi ./fonctionnel/*.cmx ./fonctionnel/*.o

clean:
	rm -rf fibNaive fibDPR fibTerm
	rm -rf ${Rep1}
	rm -rf ${Rep2}
