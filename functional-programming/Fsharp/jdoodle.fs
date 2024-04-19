let encrypt (str : string) (rot : int) =
    str
    |> Seq.map (fun c ->
        match c with
        | c when c >= 'A' && c <= 'Z' -> char ((((int c - int 'A' + rot) % 26) + int 'A') : int)
        | c when c >= 'a' && c <= 'z' -> char ((((int c - int 'a' + rot) % 26) + int 'a') : int)
        | _ -> c)
    |> System.String.Concat

let decrypt (str : string) (rot : int) =
    str
    |> Seq.map (fun c ->
        match c with
        | c when c >= 'A' && c <= 'Z' -> char ((((int c - int 'A' - rot + 26) % 26) + int 'A') : int)
        | c when c >= 'a' && c <= 'z' -> char ((((int c - int 'a' - rot + 26) % 26) + int 'a') : int)
        | _ -> c)
    |> System.String.Concat

let solve (str : string) (rotCount : int) =
    [1..rotCount]
    |> List.map (fun rot -> decrypt str rot)

// Printouts
printfn "Original: Pack my box with five dozen liquor jugs... then try to explain it to the TSA."
printfn "Encrypted: %s" (encrypt "Pack my box with five dozen liquor jugs... then try to explain it to the TSA." 46)
printfn "Decrypted: %s" (decrypt "Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM." 12)
let cracked = solve "Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM." 25
printfn "Solved: "
cracked
|> List.iteri (fun i decrypted -> printfn "Rot: %d: %s" (i + 1) decrypted)


