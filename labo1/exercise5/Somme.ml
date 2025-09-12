let trouverSomme lst x =
  let lst_trie = List.sort Int.compare lst
  in
  let rev = List.rev lst_trie 
  in
  let rec parcourir_lst lst inverse i j =
    match lst, inverse with
    | head :: _, y :: _ when i < j && head + y = x -> true    
    | head :: xs, y :: ys when i < j && head + y < x -> parcourir_lst xs inverse (i + 1) j
    | head :: xs, y :: ys when i < j && head + y > x -> parcourir_lst lst ys i (j - 1)
    | _, _ -> false
  in
  parcourir_lst lst_trie rev 0 (List.length lst_trie - 1)


let trouverSommeImp tab x =
  Array.sort Int.compare tab;
  let i = ref 0
  and
    j = ref (Array.length tab - 1)
  and
    trouve = ref false
  in
  while !i < !j && not (!trouve) do
    if tab.(!i) + tab.(!j) < x then
      i := !i + 1
    else if tab.(!i) + tab.(!j) > x then
      j := !j - 1
    else
      trouve := true
  done;
  !trouve
