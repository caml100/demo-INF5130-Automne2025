let multiplication  mat1 mat2 =
  let a11 = List.hd mat1 |> List.hd
  and
    a12 = List.hd mat1 |> List.tl |> List.hd
  and
    a21 = List.tl mat1 |> List.hd |> List.hd
  and
    a22 = List.tl mat1 |> List.hd |> List.tl |> List.hd
  and
    b11 = List.hd mat2 |> List.hd
  and
    b12 = List.hd mat2 |> List.tl |> List.hd 
  and
    b21 = List.tl mat2 |> List.hd |> List.hd 
  and
    b22 = List.tl mat2 |> List.hd |> List.tl |> List.hd
  in
  [ [a11 * b11 + a12 * b21; a11 * b12 + a12 * b22] ; [a21 * b11 + a22 * b21; a21 * b12 + a22 * b22] ]


let ( %* ) = multiplication

let rec expo mat n =
  match n with
  | a when a <= 1 -> mat
  | b when b mod 2 = 0 -> expo (mat %* mat) (n lsr 1)
  | _ ->  mat %* (expo (mat %* mat) (n lsr 1))

let fib n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> expo [[1;1];[1;0]] (n - 1) |> List.hd |> List.hd


let () =
  match Array.length Sys.argv with
  | n when n <> 2 -> prerr_endline "./fibDPR nombre";
  | _ -> 
  let n =
    int_of_string_opt (Sys.argv.(1))
  in
  match n with
  | None -> prerr_endline "./fibDPR nombre";
  | Some a -> Printf.printf "%d\n" (fib a)

