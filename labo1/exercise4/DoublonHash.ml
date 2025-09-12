module HashSetInt = Hashtbl.Make(Int)



let estSansDoublon tab =
  let n = Array.length tab - 1
  in
  let set = HashSetInt.create (n + 1)
  in
  try
    for i = 0 to n do
      if HashSetInt.mem set tab.(i) then 
        raise Exit
      else
        HashSetInt.add set tab.(i) i
    done;
    true
  with
  | Exit -> false
