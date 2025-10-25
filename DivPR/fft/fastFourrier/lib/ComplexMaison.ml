type t =
  {
    real : float;
    imag : float;
  }

let empty = 
  {
    real = 0.;
    imag = 0.;
  }

let create n1 n2 = 
  {
    real = n1;
    imag = n2;
  }


let get_real number =
  number.real


let get_imag number = 
  number.imag


let add c1 c2 =
  {
    real = c1.real +. c2.real;
    imag = c1.imag +. c2.imag;
  }


let sub c1 c2 =
  {
    real = c1.real -. c2.real;
    imag = c1.imag -. c2.imag;
  }

let mult c1 c2 = 
  let part1 = c1.real *. c2.real
  and
    part2 = c1.real *. c2.imag
  and
    part3 = c1.imag *. c2.real
  and
    part4 = -.(c1.imag *. c2.imag)
  in
  {
    real = part1 +. part4;
    imag = part2 +. part3;
  }

let (%+) c1 c2 = add c1 c2

let (%-) c1 c2 = sub c1 c2

let (%*) c1 c2 = mult c1 c2


let euler number = 
  {
    real = cos number;
    imag = sin number
  }


let print c1 =
  Printf.printf "%f" c1.real;
  match c1.imag with
  | b when b < 0. -> Printf.printf " - %f" (abs_float c1.imag); print_endline "i" 
  | b when b > 0. -> Printf.printf " + %f" c1.imag; print_endline "i"
  | _ -> print_newline ()




