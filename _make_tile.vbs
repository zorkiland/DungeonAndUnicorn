Set objFSO = CreateObject("Scripting.FileSystemObject")
Const ForReading = 1
Const ForWriting = 2

' Datei öffnen und Text einlesen und schließen
Set objFile = objFSO.OpenTextFile("txt.datatile.txt", ForReading)
strText = objFile.ReadAll
objFile.Close

' Änderungen am Inhalt
strNewText = Replace(strText, "!", """")
strNewText = Replace(strNewText, "[", "{")
strNewText = Replace(strNewText, "]", "}")

' Neue Datei erstellen mit neuen Inhalten füllen
set resultFile = objFSO.CreateTextFile("main_include.bas", true)
resultFile.WriteLine strNewText
resultFile.Close