(* Une façon de représenté les nombres binaires et de
 * représenter les 1 et un 0 comme une suite dépendante de l'un à l'autre.
 * Par exemple, le nombre 6 en binaire donne 110 peut être représenté de la manière suivante :
 * Zero ( Un ( Un ( Fin ))). La valeur la plus gauche représente le bit le moins significatif 
 * et la valeur la plus à droite représente le bit le plus significatif (excluant le Fin).
 *
 *)

type binary =
  | Fin
  | Zero of binary
  | One of binary

(* [of_list] lst Fonction servant à renverser la séquence obtenu à la fin de toutes les
 * autre fonctions qui l'utilisent.
 *
 *)
let of_list lst =
  List.fold_left (fun acc a -> if a = 0 then Zero acc else One acc) Fin lst

let create num =
  if num = 0 then Zero (Fin) else 
    let rec create num acc =
      match num with
      | 0 -> acc
      | x when x mod 2 = 0 -> create (num lsr 1) (0 :: acc) (* nombre lsr 1 = nombre / 2 *)
      | _ -> create (num lsr 1) (1 :: acc)
    in create num [] |> of_list

let add_bin num1 num2 =
  let rec add num1 num2 retenue acc =
    match num1,num2,retenue with
    | Zero (a), Fin, false -> add a Fin false (0 :: acc)
    | Fin, Zero (a), false -> add Fin a false (0 :: acc)
    | Zero (a), Fin, true -> add a Fin false (1 :: acc)
    | Fin, Zero (a), true -> add Fin a false (1 :: acc)
    | One (a), Fin,false  -> add a Fin false (1 :: acc) 
    | Fin, One (a), false -> add Fin a false (1 :: acc) 
    | One (a), Fin, true -> add a Fin true (0 :: acc) 
    | Fin, One (a), true -> add Fin a true (0 :: acc) 
    | Zero (a), Zero (b), false -> add a b false (0 :: acc) 
    | One (a), Zero (b), false
    | Zero (a), One (b), false 
    | Zero (a), Zero (b), true -> add a b false (1 :: acc) 
    | One (a), One (b), false
    | Zero (a), One (b), true
    | One (a), Zero (b), true -> add a b true (0 :: acc)
    | One (a), One (b), true -> add a b true (1 :: acc)
    | Fin, Fin, true -> 1 :: acc
    | _ -> acc
  in add num1 num2 false [] |> of_list


let mult_bin num1 num2 =
  let inject_zero shift = List.init shift (fun _ -> 0)
  in
  let rec iter num1 index_val acc = 
    match num1,index_val with
    | Fin, _ -> acc
    | One (rest), true -> iter rest index_val (1 :: acc)
    | Zero (rest), _ 
    | One (rest), false -> iter rest index_val (0 :: acc)    
  in    
  let rec mult num1 num2 acc shift =
    match num2 with
    | Fin -> acc
    | Zero (b) ->  mult num1 b ((inject_zero shift) |> iter num1 false |> of_list |> add_bin acc) (shift + 1)
    | One (b) -> mult num1 b ((inject_zero shift) |> iter num1 true |> of_list |> add_bin acc) (shift + 1)
  in
  mult num1 num2 (Zero (Fin)) 0



let print_bin bin = 
  let rec transform bin acc =
    match bin with
    | Fin -> acc
    | One (rest) -> transform rest (1 :: acc)
    | Zero (rest) -> transform rest (0 :: acc)
  in
  transform bin [] |> List.iter print_int;
  print_newline ()
