﻿cls

### Startbildschirm ###
    function startbildschirm {
        Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "║ Windows Product Key Tool                                                      ║"
        Write-Host "║                                                                               ║"
        Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
        Start-Sleep -Milliseconds 1000
        Write-Host "    ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "    ║ Administrationsrechte werden angefordert...                                   ║"
        Write-Host "    ║                                                                               ║"
        Write-Host "    ╚═══════════════════════════════════════════════════════════════════════════════╝"
    }

### Start ###
startbildschirm

### Pfad des Scripts ermitteln ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
 
$installpath = Get-ScriptDirectory
Start-Sleep -Milliseconds 1500

### Adminrechte anfordern ###
Start-Process powershell -verb runas -ArgumentList "-file $installpath\code.ps1"