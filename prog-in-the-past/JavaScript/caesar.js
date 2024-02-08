//this is my example code to go off of when coding these wacky languages.
//Much of this was created with the assistance of ChatGPT.

function encrypt(str, rot){
    let result = "";
    for (let i = 0; i < str.length; i++) {
        let char = str.charAt(i);
        if (char.match(/[a-z]/i)) {
            let code = str.charCodeAt(i);
            if (code >= 65 && code <= 90) {
                char = String.fromCharCode(((code - 65 + rot) % 26) + 65);
            } else if (code >= 97 && code <= 122) {
                char = String.fromCharCode(((code - 97 + rot) % 26) + 97);
            }
        }
        result += char;
    }
    return result;
}

function decrypt(str, rot){
    let result = "";
    for (let i = 0; i < str.length; i++) {
        let char = str.charAt(i);
        if (char.match(/[a-z]/i)) {
            let code = str.charCodeAt(i);
            if (code >= 65 && code <= 90) {
                char = String.fromCharCode(((code - 65 - rot + 26) % 26) + 65);
            } else if (code >= 97 && code <= 122) {
                char = String.fromCharCode(((code - 97 - rot + 26) % 26) + 97);
            }
        }
        result += char;
    }
    return result;
}

function solve(str){
    let solutions = [];
    for (let rot = 1; rot <25; rot++){ //loop through all rotations
        let possible = decrypt(str, rot);
        solutions.push(possible);
    }
    return solutions;
}

console.log(encrypt("You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.", 46));
console.log(decrypt("Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.", 12));
let cracked = solve("Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.");
for (let i in cracked){
    console.log(`Rot: ${parseInt(i) + 1}: ${cracked[i]}`);
}