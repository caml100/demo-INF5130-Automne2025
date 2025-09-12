module SetInt = Set.Make(Int)

let estSansDoublon tab =
  let set = SetInt.empty
  in
  let rec verifieTab tab set =
    match tab with
    | [] -> true
    | x :: _ when SetInt.mem x set -> false
    | x :: xs -> verifieTab xs (SetInt.add x set)
  in
  verifieTab tab set
