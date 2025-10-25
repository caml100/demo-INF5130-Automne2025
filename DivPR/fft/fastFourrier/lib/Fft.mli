
(*[dft_ tableau] Calcule la transformée de Fourier de [tableau] de façon naive.
 *
 *)
val dft_ : ComplexMaison.t array -> ComplexMaison.t array

(*[dft list] Calcule la transformée de Fourier de [list] de façon naive.
 * Note : Cette variante est exécutée dans le paradigme fonctionnel.
 *)
val dft : ComplexMaison.t list -> ComplexMaison.t list

(*[fft_ array] Calcule la transformée de Fourrier de [array] 
 * en utilisant l'algorithme Cooley Tukey.
 *
 *)
val fft_ : ComplexMaison.t array -> ComplexMaison.t array

(*[fft_ lst] Calcule la transformée de Fourrier de [lst] 
 * en utilisant l'algorithme Cooley Tukey.
 *
 * Note : Cette variante est exécutée dans le paradigme fonctionnel.
 *
 *)
val fft : ComplexMaison.t list -> ComplexMaison.t list
