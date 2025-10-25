let init size = 
  Array.init_matrix size size (fun _ _ -> Random.int 10000)


let get_chunk a portion_x portion_y length =
  Array.init_matrix length length (fun x y -> a.(portion_x + x).(portion_y + y))
 

let add a b =
  let len_a = Array.length a
  in
  let c = Array.init_matrix len_a len_a (fun _ _-> 0)
  in
  for i = 0 to (len_a - 1) do
    for j = 0 to (len_a - 1) do
      c.(i).(j) <- a.(i).(j) + b.(i).(j)
    done;
  done;  
  c

let sub a b = 
  let len_a = Array.length a
  in
  let c = Array.init_matrix len_a len_a (fun _ _-> 0)
  in
  for i = 0 to (len_a - 1) do
    for j = 0 to (len_a - 1) do
      c.(i).(j) <- a.(i).(j) - b.(i).(j)
    done;
  done;  
  c


let mult a b =
  let len_a = Array.length a
  in
  let c = Array.init_matrix len_a len_a (fun _ _ -> 0)
  in
  for i = 0 to (len_a - 1) do
    for j = 0 to (len_a -1) do
      for k = 0 to (len_a - 1) do
        c.(i).(j) <- c.(i).(j) + a.(i).(k) * b.(k).(j)
      done;
    done;
  done;
  c


let ( %+ ) = add
let ( %* ) = mult
let ( %- ) = sub


let rec strassen a b = 
  let len_a = Array.length a
  in
  match len_a with
  | v when v <= 2 -> a %* b
  | _ ->
    let div = len_a lsr 1
    in
    let m1 = strassen (get_chunk a 0 0 div %+ get_chunk a div div div) (get_chunk b 0 0 div %+ get_chunk b div div div)
    and
      m2 = strassen (get_chunk a div 0 div %+ get_chunk a div div div) (get_chunk b 0 0 div)
    and
      m3 = strassen (get_chunk a 0 0 div) (get_chunk b 0 div div %- get_chunk b div div div)
    and
      m4 = strassen (get_chunk a div div div) (get_chunk b div 0 div %- get_chunk b 0 0 div) 
    and
      m5 = strassen (get_chunk a 0 0 div %+ get_chunk a 0 div div) (get_chunk b div div div)
    and
      m6 = strassen (get_chunk a div 0 div %- get_chunk a 0 0 div) (get_chunk b 0 0 div %+ get_chunk b 0 div div)
    and
      m7 = strassen (get_chunk a 0 div div %- get_chunk a div div div) (get_chunk b div 0 div %+ get_chunk b div div div)
    in
    let c1 = m1 %+ m4 %- m5 %+ m7
    and
      c2 = m3 %+ m5
    and
      c3 = m2 %+ m4
    and
      c4 = m1 %- m2 %+ m3 %+ m6
    in
    try 
    Array.init_matrix len_a len_a
      (fun x y -> 
         match x,y with
         | a,b when a < div && b < div -> c1.(x).(y)
         | a,b when a < div && b >= div -> c2.(x).(y - div)
         | a,b when a >= div && b < div -> c3.(x - div).(y)
         | _,_ -> c4.(x - div).(y - div)
      )
    with
    | _ -> failwith "Erreur dans la matrice finale \n"


let print_array a =
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

let rec log2 n acc =
  match n with
  | a when a < 2 -> acc
  | _ -> log2 (n lsr 1) (acc + 1)

let forme_mat length = 
  let puissance_courante = log2 length 0
  and
    puissance_anterieure = log2 (length - 1) 0
  in
  if puissance_courante <> puissance_anterieure then 
    init length
  else
    init (1 lsl (puissance_courante + 1))

let () =
  match Array.length Sys.argv with
  | a when a <> 3 -> Printf.eprintf "./strasse_big taille_a taille_b\n"
  | _ ->
    let a = int_of_string_opt Sys.argv.(1)
    and
      b = int_of_string_opt Sys.argv.(2)
    in
    match a,b with
    | Some (taille1), Some (taille2) when taille1 = taille2 ->
      let a = forme_mat taille1
      and
        b = forme_mat taille2
      in
      let _ = strassen a b
      in
      ()
    | _ -> Printf.eprintf "Les tailles doivent être des nombres\n"


