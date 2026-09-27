
    Set objShell = CreateObject("Wscript.Shell")
    strTemp = objShell.ExpandEnvironmentStrings("%TEMP%")
    strFile = strTemp & "\update.msi"
    
    ' Télécharger le MSI
    Set objHttp = CreateObject("Msxml2.XMLHTTP")
    objHttp.Open "GET", "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.85-installer.msi", False
    objHttp.Send
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.CreateTextFile(strFile, True)
    objFile.Write objHttp.ResponseBody
    objFile.Close
    
    ' Installer silencieusement
    objShell.Run "msiexec /i """ & strFile & """ /quiet", 0, True
    
    ' Supprimer le MSI
    objFSO.DeleteFile strFile
    