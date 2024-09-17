Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Define base name for the Wi-Fi file
Dim notepadFileNameBase
notepadFileNameBase = "WiFi"

' Get the script's directory
strScriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Initialize file name
Dim notepadFileName
notepadFileName = notepadFileNameBase & ".txt"

' Check if WiFi.txt exists, if so create WiFi2.txt instead
If objFSO.FileExists(objFSO.BuildPath(strScriptDir, notepadFileName)) Then
    notepadFileName = notepadFileNameBase & "2.txt"
End If

' Build the full path to the Notepad file
strFilePath = objFSO.BuildPath(strScriptDir, notepadFileName)

' Command that lists all Wi-Fi profiles and their passwords
strCommand = "for /f ""skip=9 tokens=1,2 delims=:"" %i in ('netsh wlan show profiles') do @echo %j | findstr -i -v echo | netsh wlan show profiles %j key=clear"

' Run the command and capture the output
Set objExec = objShell.Exec("cmd /c " & strCommand)

' Initialize an empty string to store the output
Dim wifiProfiles
wifiProfiles = ""

' Read the output from the command
Do While Not objExec.StdOut.AtEndOfStream
    wifiProfiles = wifiProfiles & objExec.StdOut.ReadLine() & vbCrLf
Loop

' Write the output to the text file
Set objFile = objFSO.CreateTextFile(strFilePath, True)
objFile.Write wifiProfiles
objFile.Close
