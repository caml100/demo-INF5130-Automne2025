let monnaie s p =
  let rec monnaie' s p acc =
    match p with
    | [] when s = 0 -> Ok acc
    | [] -> Error "Échange impossible"
    | hd :: tl -> 
      let x = s / hd
      in
      monnaie' (s mod hd) tl ((hd, x) :: acc)
  in
  monnaie' s (List.rev p) []

