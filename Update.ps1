cls

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Windows Product Key Update-Tool                                               ║"
    Write-Host "║                                                                               ║"
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

### Root-Verzeichnis ermitteln, zum öffnen des Programmcodes ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
 
$installpath = Get-ScriptDirectory

### Funktion zum Entpacken einer ZIP-Datei ###
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

### Updateroutine ###
function Get-Update {
    $source = "https://github.com/si0nDE/Windows-Product-Key-Tool/archive/master.zip"

    Start-Sleep -Milliseconds 1000
    Write-Host "        ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "        ║ Update wird heruntergeladen...                                                ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Invoke-WebRequest -Uri $source -OutFile "C:\Users\s.fieber\Documents\GitHub\Windows-Product-Key-Tool\TEST\update.zip"
    Start-Sleep -Milliseconds 1500
    cls
    startbildschirm
    Write-Host "        ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "        ║ Update wird entpackt...                                                       ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Unzip "$installpath\update.zip" "$installpath"
    Start-Sleep -Milliseconds 1500
    cls
    startbildschirm
    Write-Host "        ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "        ║ Aufräumen...                                                                  ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Remove-Item "$installpath\update.zip"
    Remove-Item "$installpath\Windows-Product-Key-Tool-master\Update.ps1"
    Start-Sleep -Milliseconds 4000
    Move-Item "$installpath\Windows-Product-Key-Tool-master\scripts\*" "$installpath\scripts\" -Force
    Remove-Item "$installpath\Windows-Product-Key-Tool-master\scripts\"
    Move-Item "$installpath\Windows-Product-Key-Tool-master\*" "$installpath" -Force
    Remove-Item "$installpath\Windows-Product-Key-Tool-master\"
    Start-Sleep -Milliseconds 1000
    cls
    startbildschirm
    Write-Host "        ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "        ║ Update fertiggestellt!                                                        ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ║     Programm wird beendet...                                                  ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Start-Sleep -Milliseconds 5000
    exit
}

### Start ###
startbildschirm
Get-Update