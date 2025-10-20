let rec fib n =
  if n = 0
  then
    0
  else
  if n = 1
  then
    1
  else
    fib(n - 1) + fib(n - 2)


let () =
  match Array.length Sys.argv with
  | n when n <> 2 -> prerr_endline "./fibNaive nombre";
  | _ ->
    let a =
      int_of_string_opt (Sys.argv.(1))
    in
    match a with
    | None -> prerr_endline "./fibNaive nombre";
    | Some n -> print_int (fib n); print_newline ()

