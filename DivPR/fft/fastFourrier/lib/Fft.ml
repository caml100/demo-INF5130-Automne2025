let pie = acos (-1.0)


let dft_ a = 
  ComplexMaison.(
  let length = Array.length a
  in
  let y = Array.init length (fun _ -> empty)
  in
  let sum k = 
    let acc = ref empty
    in
    for i = 0 to (length - 1) do
      acc := !acc %+ (a.(i) %* (euler (-2. *. pie *. (float_of_int i) *. k /. (float_of_int length) )))
    done;
    !acc
  in
  for i = 0 to (length - 1) do
    y.(i) <- sum (float_of_int i);
  done;
  y
)


let dft a = 
  ComplexMaison.(
    let length = List.length a
    in
    let rec sum lst k index acc =
      match lst with
      | [] -> acc
      | x :: xs -> sum xs k (index + 1) (acc %+ (x %* (euler (-2. *. pie *. (float_of_int index) *. k /. (float_of_int length) ) ) ) )
    in
    let rec dft_naive lst index acc =
      match lst with
      | [] -> acc
      | _ :: xs -> dft_naive xs (index + 1) (sum a (float_of_int index) 0 empty :: acc)
    in dft_naive a 0 [] |> List.rev
)



let rec fft_ a = 
  ComplexMaison.(
    let n = Array.length a
    in
    match n with
    | 1 -> a
    | _ ->
      let half = n lsr 1
      and
        w_n = euler ((-2.) *. pie /. (float_of_int n))
      and
        w = ref (create 1.0 0.0)
      in
      let pairs = Array.init half (fun _ -> empty)
      and
        impairs = Array.init half (fun _ -> empty)
      and
        dec = ref 0
      in
      for i = 0 to (n - 1) do
        match i mod 2 with
        | 0 -> pairs.(!dec) <- a.(i)
        | _ -> impairs.(!dec) <- a.(i); dec := !dec + 1
      done;
      let y_pairs = fft_ pairs
      and
        y_impairs = fft_ impairs
      and
        result = Array.init n (fun _ -> empty)
      in
      for i = 0 to (half - 1) do
        result.(i) <- y_pairs.(i) %+ (!w %* y_impairs.(i));
        result.(i + half) <- y_pairs.(i) %- (!w %* y_impairs.(i));
        w := !w %* w_n;
      done;
      result
  )


let rec scinde_pair_impair lst index acc =
    match lst with
    | [] -> (List.rev (fst acc), List.rev (snd acc))
    | x :: xs when index mod 2 = 0 -> scinde_pair_impair xs (index + 1) (x :: fst acc, snd acc)
    | x :: xs -> scinde_pair_impair xs (index + 1) (fst acc, x :: snd acc)


let rec recombiner pairs impairs w w_n acc =
  ComplexMaison.(
    match pairs, impairs with
    | x :: xs, y :: ys -> 
      let part_1 = x %+ (w %* y)
      and
        part_2 = x %- (w %* y)
      in
      recombiner xs ys (w %* w_n) w_n (part_1 :: fst acc, part_2 :: snd acc)
    | _, _ -> (List.rev (fst acc), List.rev (snd acc))
  )



let fft a = 
  let rec fft' a n = 
    ComplexMaison.(
    if n = 1 then
      a
    else
      let half = n lsr 1             
      and             
        w_n = euler ((-2.) *. pie /. (float_of_int n))
      and
        w = create 1.0 0.0
      and
        chunks = scinde_pair_impair a 0 ([],[])
      in
      let y_pairs = fft' (fst chunks) half
      and
        y_impairs = fft' (snd chunks) half
      in
      let half_result = recombiner y_pairs y_impairs w w_n ([],[])
      in
      fst half_result @ (snd half_result)
  )
  in fft' a (List.length a)


