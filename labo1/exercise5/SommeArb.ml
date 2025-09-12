module SetInt = Set.Make(Int)


let trouverSommeAbr lst x =
  let set = SetInt.empty
  in
  let rec trouverSommeAbr lst abr =
    match lst with
    | [] -> false
    | h :: _ when SetInt.mem h abr -> true
    | h :: xs -> trouverSommeAbr xs (SetInt.add (x - h) abr)
  in
  trouverSommeAbr lst set

