Set objFSO = CreateObject("Scripting.FileSystemObject")
Const ForReading = 1
Const ForWriting = 2

' Datei öffnen und Text einlesen und schließen
Set objFile = objFSO.OpenTextFile("datatile.txt", ForReading)
strText = objFile.ReadAll
objFile.Close

' Änderungen am Inhalt
strNewText = Replace(strText, "!", """")
strNewText = Replace(strNewText, "[", "{")
strNewText = Replace(strNewText, "]", "}")

strNewText = Replace(strNewText, "A", "a")
strNewText = Replace(strNewText, "B", "b")
strNewText = Replace(strNewText, "C", "c")
strNewText = Replace(strNewText, "D", "d")
strNewText = Replace(strNewText, "E", "e")
strNewText = Replace(strNewText, "F", "f")
strNewText = Replace(strNewText, "G", "g")
strNewText = Replace(strNewText, "H", "h")
strNewText = Replace(strNewText, "I", "i")
strNewText = Replace(strNewText, "J", "j")
strNewText = Replace(strNewText, "K", "k")
strNewText = Replace(strNewText, "L", "l")
strNewText = Replace(strNewText, "M", "m")
strNewText = Replace(strNewText, "N", "n")
strNewText = Replace(strNewText, "O", "o")
strNewText = Replace(strNewText, "P", "p")
strNewText = Replace(strNewText, "Q", "q")
strNewText = Replace(strNewText, "R", "r")
strNewText = Replace(strNewText, "S", "s")
strNewText = Replace(strNewText, "T", "t")
strNewText = Replace(strNewText, "U", "u")
strNewText = Replace(strNewText, "V", "v")
strNewText = Replace(strNewText, "W", "w")
strNewText = Replace(strNewText, "X", "x")
strNewText = Replace(strNewText, "Y", "y")
strNewText = Replace(strNewText, "Z", "z")

' Neue Datei erstellen mit neuen Inhalten füllen
set resultFile = objFSO.CreateTextFile("main_tile.bas", true)
resultFile.WriteLine strNewText
resultFile.Close