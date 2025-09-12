module TabHashInt = Hashtbl.Make(Int)

let trouverSommeHash lst x =
  let set = TabHashInt.create (List.length lst)
  in
  let rec trouverSommeHash lst =
    match lst with
    | [] -> false
    | h :: _ when TabHashInt.mem set h -> true
    | h :: xs -> TabHashInt.add set (x - h) x; trouverSommeHash xs
  in
  trouverSommeHash lst
