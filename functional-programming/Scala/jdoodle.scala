// turns out this is already functional, no changes nessacary!
//I just changed the testcases to match this project
object JDoodle {

    def encrypt(text: String, shift: Int): String = {
        text.map { // For each character in the text
            case char if char.isLetter && char.isLower =>
                val shiftedChar = ('a' + (char - 'a' + shift) % 26).toChar // Encrypt lowercase letters
                shiftedChar
            case char if char.isLetter && char.isUpper =>
                val shiftedChar = ('A' + (char - 'A' + shift) % 26).toChar // Encrypt uppercase letters
                shiftedChar
            case char => char // Preserve non-alphabetic characters
        }
        .mkString // Convert the encrypted characters back to a string
    }
    
    def decrypt(text: String, shift: Int): String = {
        text.map { // For each character in the text
            case char if char.isLetter && char.isLower =>
                val shiftedChar = ('a' + (char - 'a' - shift + 26) % 26).toChar // Decrypt lowercase letters
                shiftedChar
            case char if char.isLetter && char.isUpper =>
                val shiftedChar = ('A' + (char - 'A' - shift + 26) % 26).toChar // Decrypt uppercase letters
                shiftedChar
            case char => char // Preserve non-alphabetic characters
        }
        .mkString // Convert the decrypted characters back to a string
    }
    
    def solve(str: String, rotCount: Int = 25): List[String] = {
        (1 to rotCount).map(rot => decrypt(str, rot)).toList
    }
    
    def main(args: Array[String]): Unit = {
        
        println("Original: Pack my box with five dozen liquor jugs... then try to explain it to the TSA.")
        val encrypted = encrypt("Pack my box with five dozen liquor jugs... then try to explain it to the TSA.", 46)
        println(s"Encrypted: $encrypted")
        val decrypted = decrypt("Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM.", 12)
        println(s"Decrypted: $decrypted")
        val cracked = solve("Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM.", 25)
        println("Solved:")
        for ((crack, index) <-cracked.zipWithIndex){ //this is really cool, gets the index with the item as a pair
            println(s"rot: ${index + 1}: $crack")
        }
  }
}