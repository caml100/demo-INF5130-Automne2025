let utilisation = "dune exec fastFourrier taille [-imp] [-dft] [-bench iter]"



let random reveal =
  Random.self_init reveal;
  let neg_real = Random.bool reveal
  and
    neg_imag = Random.bool reveal
  in
  match neg_real, neg_imag with
  | true, true -> FastFourrier.ComplexMaison.create (Random.float 10000.) (Random.float 10000.)
  | false, true -> FastFourrier.ComplexMaison.create (-.Random.float 10000.) (Random.float 10000.)
  | true, false -> FastFourrier.ComplexMaison.create (Random.float 10000.) (-.Random.float 10000.)
  | false, false -> FastFourrier.ComplexMaison.create (-.Random.float 10000.) (-.(Random.float 10000.))


let rec log2 n acc =
  match n with
  | a when a < 2 -> acc
  | _ -> log2 (n lsr 1) (acc + 1)


let init_lst n =
  let power_n = log2 n 0
  and
    pred_n = log2 (n - 1) 0
  in
  let length = if power_n <> pred_n then n else 1 lsl (power_n + 1)
  in
  List.init length (fun _ -> random () )


let init n =
  let power_n = log2 n 0
  and
    pred_n = log2 (n - 1) 0
  in
  let length = if power_n <> pred_n then n else 1 lsl (power_n + 1)
  in
  Array.init length (fun _ -> random () )


let iterate_lst f (list : FastFourrier.ComplexMaison.t list) = 
  f list

let iterate_array f (array : FastFourrier.ComplexMaison.t array) =
  f array


let bench number_bench f iterable =
  for _ = 0 to 2 do
    ignore (f iterable);
  done;
  let acc = ref 0.0
  in
  for _ = 1 to number_bench do
    let t0 = Unix.gettimeofday ()
    in
    ignore (f iterable);
    let t1 = Unix.gettimeofday ()
    in
    acc := !acc +. (t1 -. t0)
  done;
  Printf.printf "Temps d'exécution moyen : %f sec\n" (!acc /. (float_of_int number_bench))





let () = 
  match Array.length Sys.argv with 
  | 2 -> iterate_lst FastFourrier.Fft.fft (int_of_string Sys.argv.(1) |> init_lst) |> List.iter FastFourrier.ComplexMaison.print
  | 3 when Sys.argv.(2) = "-dft" -> iterate_lst FastFourrier.Fft.dft (int_of_string Sys.argv.(1) |> init_lst) |> List.iter FastFourrier.ComplexMaison.print
  | 3 when Sys.argv.(2) = "-imp" -> iterate_array FastFourrier.Fft.fft_ (int_of_string Sys.argv.(1) |> init) |> Array.iter FastFourrier.ComplexMaison.print
  | 4 when Sys.argv.(2) = "-imp" && Sys.argv.(3) = "-dft" -> 
    iterate_array FastFourrier.Fft.dft_ (int_of_string Sys.argv.(1) |> init) |> Array.iter FastFourrier.ComplexMaison.print
  | 4 when Sys.argv.(2) = "-bench" -> (int_of_string Sys.argv.(1) |> init_lst) |> bench (int_of_string Sys.argv.(3)) FastFourrier.Fft.fft
  | 5 when Sys.argv.(2) = "-imp" && Sys.argv.(3) = "-bench" ->
    (int_of_string Sys.argv.(1) |> init) |> bench (int_of_string Sys.argv.(4)) FastFourrier.Fft.fft_
  | 5 when Sys.argv.(2) = "-dft" && Sys.argv.(3) = "-bench" ->
    (int_of_string Sys.argv.(1) |> init_lst) |> bench (int_of_string Sys.argv.(4)) FastFourrier.Fft.dft
  | 6 when Sys.argv.(2) = "-imp" && Sys.argv.(3) = "-dft" && Sys.argv.(4) = "-bench" ->
    (int_of_string Sys.argv.(1) |> init) |> bench (int_of_string Sys.argv.(5)) FastFourrier.Fft.dft_
  | _ -> print_endline utilisation
