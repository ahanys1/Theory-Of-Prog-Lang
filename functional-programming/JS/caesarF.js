//this code is based off of my  JS code for the programming in the past assignment.

function encrypt(str, rot){
    return str.split('').map(char => { //essentially a for each loop
        if (char.match(/[a-z]/i)) { //now we more or less do the same thing as before
            let code = char.charCodeAt(0);
            if (code >= 65 && code <= 90) {
                return String.fromCharCode(((code - 65 + rot) % 26) + 65);
            } else if (code >= 97 && code <= 122) {
                return String.fromCharCode(((code - 97 + rot) % 26) + 97);
            }
        }
        return char; //return characters that don't need to be changed
    }).join(''); //rejoin it as a string at the end
}

//copy and paste above, reverse the direction
function decrypt(str, rot){
    return str.split('').map(char => { //essentially a for each loop
        if (char.match(/[a-z]/i)) { //now we more or less do the same thing as before
            let code = char.charCodeAt(0);
            if (code >= 65 && code <= 90) {
                return String.fromCharCode(((code - 65 - rot + 26) % 26) + 65);
            } else if (code >= 97 && code <= 122) {
                return String.fromCharCode(((code - 97 - rot + 26) % 26) + 97);
            }
        }
        return char; //return characters that don't need to be changed
    }).join(''); //rejoin it as a string at the end
}

function solve(str, rotCount = 25){
    return Array.from({length: rotCount}, (_, rot) => {
        return decrypt(str, rot + 1)
    });
}

//printouts
console.log("Original: Pack my box with five dozen liquor jugs... then try to explain it to the TSA."); //thanks ChatGPT for this one, that's pretty good
console.log("Encrypted: ", encrypt("Pack my box with five dozen liquor jugs... then try to explain it to the TSA.", 46));
console.log("Decrypted: " + decrypt("Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM.", 12));
let cracked = solve("Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM.", 25);
console.log("Solved: ");
for (let i in cracked){ //yes, there is a loop here. Since it'se used for printouts, I hope that's alright
    console.log(`Rot: ${parseInt(i) + 1}: ${cracked[i]}`);
}