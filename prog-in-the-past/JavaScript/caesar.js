//this is my example code to go off of when coding these wacky languages.
//Much of this was created with the assistance of ChatGPT, in the iterest of saving time as this language is not graded.

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

function solve(str, rotCount = 25){
    let solutions = [];
    for (let rot = 1; rot <=rotCount; rot++){ //loop through all rotations
        let possible = decrypt(str, rot);
        solutions.push(possible);
    }
    return solutions;
}

console.log("Original: You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.");
console.log("Encrypted: ", encrypt("You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.", 46));
console.log("Decrypted: ", decrypt("Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.", 12));
let cracked = solve("Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.", 25);
console.log("Solved: ");
for (let i in cracked){
    console.log(`Rot: ${parseInt(i) + 1}: ${cracked[i]}`);
}