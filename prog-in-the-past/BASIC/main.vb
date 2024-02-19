' 
' Welcome to GDB Online.
' GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
' C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
' Code, Compile, Run and Debug online from anywhere in world.
' 
' I won't lie, ChatGPT came in clutch with all my syntax questions for VB
Imports System.Collections.Generic

Public Class CaesarCipher
    
    ' Encryption function
    Public Shared Function Encrypt(ByVal input As String, ByVal shift As Integer) As String
        Dim result As String = ""

        For Each c As Char In input
            If Char.IsLetter(c) Then
                Dim offset As Integer = Asc(Char.ToUpper(c)) - Asc("A")
                Dim newIndex As Integer = (offset + shift) Mod 26
                Dim newChar As Char = Chr(Asc("A") + newIndex)
                result &= If(Char.IsLower(c), Char.ToLower(newChar), newChar)
            Else
                result &= c
            End If
        Next

        Return result
    End Function

    ' Decryption function
    Public Shared Function Decrypt(ByVal input As String, ByVal shift As Integer) As String
        Dim result As String = ""

        For Each c As Char In input
            If Char.IsLetter(c) Then
                Dim offset As Integer = Asc(Char.ToUpper(c)) - Asc("A")
                Dim newIndex As Integer = (offset - shift) Mod 26
                If newIndex < 0 Then newIndex += 26 ' Handle negative indexes
                Dim newChar As Char = Chr(Asc("A") + newIndex)
                result &= If(Char.IsLower(c), Char.ToLower(newChar), newChar)
            Else
                result &= c
            End If
        Next

        Return result
    End Function    
    
    ' Solve Function
    Public Shared Function Solve(ByVal input As String) As List(Of String)
        Dim solutions As New List(Of String)

        For rot As Integer = 1 To 25
            Dim possible As String = Decrypt(input, rot)
            solutions.Add(possible)
        Next

        Return solutions
    End Function

    Public Shared Sub Main()
        Dim encryptedText As String = Encrypt("You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.", 46)
        Dim decryptedText As String = decrypt("Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.", 12)
        Dim cracked As List(Of String) = Solve("Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq.")
        
        Console.WriteLine("Original: " & "You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice.")
        Console.WriteLine("Encrypted: " & encryptedText)
        Console.WriteLine("Decrypted: " & decryptedText)
        Console.WriteLine("Solved: ")
        Dim rot As Integer = 1
        For Each solution As String in cracked
            Console.WriteLine("Rot: " & rot & ": " & solution)
            rot += 1
        Next
    End Sub
End Class