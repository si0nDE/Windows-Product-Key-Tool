cls

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Windows Product Key Tool v1.3.4                                               ║"
    Write-Host "║                                                                               ║"
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

### Root-Verzeichnis ermitteln, zum öffnen des Programmcodes ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
 
$installpath = Get-ScriptDirectory

### Administrationsrechte anfordern ###
function adminrechte {
    Start-Sleep -Milliseconds 1000
    Write-Host "        ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "        ║ Administrationsrechte werden angefordert...                                   ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Start-Sleep -Milliseconds 1500
    Start-Process powershell -verb runas -ArgumentList "-file $installpath\code.ps1"
}

### Start ###
startbildschirm
adminrechte