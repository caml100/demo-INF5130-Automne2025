let fib n =
  let rec fib n acc1 acc2 =
    if n = 0
    then
      acc2
    else
      fib (n - 1) acc2 (acc1 + acc2)
  in fib n 1 0

let () =
  match Array.length Sys.argv with
  | n when n <> 2 -> prerr_endline "./fibTerm nombre"
  | _ -> 
  let a =
    int_of_string_opt (Sys.argv.(1))
  in 
  match a with
  | None -> prerr_endline "./fibTerm nombre"
  | Some n -> print_int (fib n); print_newline ()

