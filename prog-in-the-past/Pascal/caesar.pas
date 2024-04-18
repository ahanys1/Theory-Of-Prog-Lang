program Caesar;

type
    TStringArray = array of string; // thank you to chatGPT for providing this fix. I was originally trying just array of string, but putting this at the top and changing below made it work

// Function to encrypt a string using Caesar cipher
function Encrypt(inputStr: string; shift: integer): string;
var
    i: integer;
begin
    // Loop through each character in the input string
    for i := 1 to Length(inputStr) do
    begin
        // Check if the character is a letter
        if (inputStr[i] in ['A'..'Z']) then
        begin
            // Encrypt uppercase letters
            inputStr[i] := Chr(((Ord(inputStr[i]) - Ord('A') + shift) mod 26) + Ord('A'));
        end
        else if (inputStr[i] in ['a'..'z']) then
        begin
            // Encrypt lowercase letters
            inputStr[i] := Chr(((Ord(inputStr[i]) - Ord('a') + shift) mod 26) + Ord('a'));
        end;
    end;
    Encrypt := inputStr;
end;

function Decrypt(inputStr: string; shift: integer): string;
var
    i: integer;
begin
    // Loop through each character in the input string
    for i := 1 to Length(inputStr) do
    begin
        // Check if the character is a letter
        if (inputStr[i] in ['A'..'Z']) then
        begin
            // Decrypt uppercase letters
            inputStr[i] := Chr(((Ord(inputStr[i]) - Ord('A') - shift + 26) mod 26) + Ord('A'));
        end
        else if (inputStr[i] in ['a'..'z']) then
        begin
            // Decrypt lowercase letters
            inputStr[i] := Chr(((Ord(inputStr[i]) - Ord('a') - shift + 26) mod 26) + Ord('a'));
        end;
    end;
    Decrypt := inputStr;
end;

function Solve(inputStr: string; rotCount: integer): TStringArray; //tried to do default value, but it's too complex in pascal. I would have to overload the function
var
    rot: integer;
    solutions: array of string;
begin
    SetLength(solutions, rotCount); // Initialize array to hold solutions for all rotations

    // Loop through all rotations
    for rot := 1 to rotCount do
    begin
        // Decrypt with current rotation and store the result
        solutions[rot - 1] := Decrypt(inputStr, rot);
    end;

    // Return the array of solutions
    Solve := solutions;
end;

var
    cracked: TStringArray;
    i: integer;
begin //printouts
    writeln('Original: You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.');
    writeln('Encrypted: ', Encrypt('You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.', 46));
    writeln('Decrypted: ', Decrypt('Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.', 12));
    cracked := Solve('Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.', 26);
    writeln('Solved: ');
    for i := 0 to High(cracked) do
    begin
        writeln('rot: ', i+1,': ', cracked[i]);
    end;
end.
