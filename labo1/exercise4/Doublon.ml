let rec estSansDoublon tab =
  match tab with
  | [] -> true
  | [_] -> true
  | x :: y :: xs when x = y -> false
  | _ :: _ :: xs -> estSansDoublon xs


let estSansDoublonImperatif tab = 
  let n = Array.length tab - 1
  in
  Array.sort (Int.compare) tab;
  try 
    for i = 0 to n do
      if i <> n && tab.(i) = tab.(i + 1) then 
        raise Exit
    done;
    true
  with
  | Exit -> false
