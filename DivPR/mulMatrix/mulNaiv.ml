let init_naive size = 
  Array.init_matrix size size (fun _ _ -> Random.int 10000)


let mult_naive a b = 
  let length = Array.length a
  in
  let arr = Array.init_matrix length length (fun _ _ -> 0)
  in
  for i = 0 to (length - 1) do
    for j = 0 to (length - 1) do
      for k = 0 to (length - 1) do
        arr.(i).(j) <- arr.(i).(j) + a.(i).(k) * b.(k).(j)
      done;
    done;
  done;
  arr

let print_array_naive a =
  let len_x = Array.length a
  and
    len_y = Array.length a.(0)
  in
  for i = 0 to (len_x - 1) do
    for j = 0 to (len_y - 1) do
      Printf.printf "%d\t" a.(i).(j)
    done;
    print_newline ()
  done

let () =
  match Array.length Sys.argv with
  | a when a <> 3 -> Printf.eprintf "./strasse_big taille_a taille_b\n"
  | _ ->
    let a = int_of_string_opt Sys.argv.(1)
    and
      b = int_of_string_opt Sys.argv.(2)
    in
    match a,b with
    | Some (taille1), Some (taille2) ->
      let a = init_naive taille1
      and
        b = init_naive taille2
      in
      let _ = mult_naive a b
      in
      ()
    | _ -> Printf.eprintf "Les tailles doivent être des nombres\n"
