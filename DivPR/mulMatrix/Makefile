all: clean exec_ocaml

.IGNORE: exec_ocaml

exec_ocaml: 
	ocamlopt -o multiplicationNaiveOCaml mulNaiv.ml
	ocamlopt  -o strassenOCaml strassen.ml
	rm -f *.cmi *.cmo *.cmx 

clean:
	rm -f strassenOCaml multiplicationNaiveOCaml *.o
