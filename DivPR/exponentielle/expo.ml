(*[expo n x] Exponentiation naive 
 * Complexité en temps : O(x) 
 * Complexité en espace de la pile : O(x)
 *)
let rec expo n x =
  if x = 0 then
    1
  else
    n * expo n (x - 1)

(*[expo_terminale n x] Exponentiation naive en récursivité terminale
 * Complexité en temps : O(x) 
 * Complexité en espace de la pile : O(1)
 *)
let expo_terminale n x =
  let rec expo_terminale n x acc =
    if x = 0 then
      acc
    else
      expo_terminale n (x - 1) (acc * n)
  in expo_terminale n x 1


(*[expo_fast n x] Exponentiation se basant sur la méthode
 * diviser pour régner.
 * Complexité en temps : O(log x) 
 * Complexité en espace de la pile : O(log x)
 *)
let rec expo_fast n x =
  match x with
  | 0 -> 1
  | a when a mod 2 = 0 -> expo_fast (n * n) (x lsr 1)
  | _ -> n * expo_fast (n * n) (x lsr 1)


(*[expo_fast_terminale n x] Exponentiation se basant sur la méthode
 * diviser pour régner. Bonus : version récursive terminale.
 * Complexité en temps : O(log x) 
 * Complexité en espace de la pile : O(1)
 *)
let expo_fast_terminale n x =
  let rec expo_fast_terminale n x acc =
    match x with
    | 0 -> acc
    | a when a mod 2 = 0 -> expo_fast_terminale (n * n) (x lsr 1) acc
    | _ -> expo_fast_terminale (n * n) (x lsr 1) (acc * n)
  in expo_fast_terminale n x 1
