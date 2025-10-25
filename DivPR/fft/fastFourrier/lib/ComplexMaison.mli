type t

(*[empty] retounre seulement la valeur 0 
 *[empty] = 0 + 0i
 *
 *)
val empty : t


(*[create real imaginary] crée un nombre complexe
 * à partie de [real] pour la partie réelle
 * et [imaginary] pour la partie imaginaire.
 *
 *)
val create : float -> float -> t


(*[get_real complex_number] retourne la partie
 * réelle de [complex_number]
 *
 *)
val get_real : t -> float


(*[get_imag complex_number] retourne la partie
 * imaginaire de [complex_number]
 *
 *)
val get_imag : t -> float


(*[add c1 c2] donne la sommation
 * des nombre complexes [c1] et [c2]
 *)
val add : t -> t -> t


(*[sub c1 c2] donne la différence
 * des nombres complexes [c1] et [c2]
 *
 *)
val sub : t -> t -> t


(*[mult c1 c2] donne le produit
 * des nombres complexes [c1] et [c2] 
 *)
val mult : t -> t -> t


(* Alias for add*)
val (%+) : t -> t -> t


(* Alias for sub *)
val (%-) : t -> t -> t


(* Alias for mult *)
val (%*) : t -> t -> t


(*[euler real] calcul e^{i[real]}
 *
 * Note : e^{i[real]} = sin([real]) + i cos([real])
 *)
val euler : float -> t


(*[print complex_number] affiche [complex_number]
 *)
val print : t -> unit
