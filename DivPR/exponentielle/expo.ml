(*[expo x n] Exponentiation naive 
 * Complexité en temps : O(n) 
 * Complexité en espace de la pile : O(n)
 *)
let rec expo x n =
  if n = 0 then
    1
  else
    x * expo x (n - 1)

(*[expo_terminale x n] Exponentiation naive en récursivité terminale
 * Complexité en temps : O(n) 
 * Complexité en espace de la pile : O(1)
 *)
let expo_terminale x n =
  let rec expo_terminale x n acc =
    if n = 0 then
      acc
    else
      expo_terminale x (n - 1) (acc * x)
  in expo_terminale x n 1


(*[expo_fast x n] Exponentiation se basant sur la méthode
 * diviser pour régner.
 * Complexité en temps : O(log n) 
 * Complexité en espace de la pile : O(log n)
 *)
let rec expo_fast x n =
  match n with
  | 0 -> 1
  | a when a mod 2 = 0 -> expo_fast (x * x) (n lsr 1)
  | _ -> x * expo_fast (x * x) (n lsr 1)


(*[expo_fast_terminale x n] Exponentiation se basant sur la méthode
 * diviser pour régner. Bonus : version récursive terminale.
 * Complexité en temps : O(log n) 
 * Complexité en espace de la pile : O(1)
 *)
let expo_fast_terminale x n =
  let rec expo_fast_terminale x n acc =
    match n with
    | 0 -> acc
    | a when a mod 2 = 0 -> expo_fast_terminale (x * x) (n lsr 1) acc
    | _ -> expo_fast_terminale (x * x) (n lsr 1) (acc * x)
  in expo_fast_terminale x n 1
