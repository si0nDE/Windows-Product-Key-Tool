    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

Clear-Host

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Windows Product Key Tool v2.2.1                                               ║"
    Write-Host "║                                                                               ║"
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

### Menü ###
function menue {
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Hauptmenü                                                                 ║"
        Write-Host "   ╠═════════════                                                              ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ║ [ 1 ] Product Key eingeben                                                ║"
        Write-Host "   ║ [ 2 ] Product Key aktivieren                                              ║"
        Write-Host "   ║ [ 3 ] Aktuell installierte Edition abfragen                               ║"
        Write-Host "   ║ [ 4 ] Windows-Edition aktualisieren                                       ║"
        Write-Host "   ║ [ 5 ] Lizenzinformationen abrufen                                         ║"
        Write-Host "   ╠═══════════════════════════════════════════════════════════════════════════╣"
        Write-Host "   ║ [ 0 ] Windows neustarten                                                  ║"
        Write-Host "   ║ [ X ] Programm beenden                                                    ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
}

### Menüauswahl ###
function menueauswahl {
    do {
        Clear-Host
        startbildschirm
        menue
            Write-Host ""
            $input = Read-Host "Bitte wählen Sie"

            switch ($input) {
                '1' {productkey_eingeben}
                '2' {productkey_aktivieren}
                '3' {installierte_edition}
                '4' {upd-srvedit}
                '5' {lizenzinfo_abrufen}
                '0' {neustarten}
                'x' {Exit-Script}
            } pause }
        until ($input -eq 'x')
}

### Product Key installieren ###
function productkey_eingeben {
        Clear-Host
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Product Key eingeben                                                      ║"
            Write-Host "   ╠════════════════════════                                                   ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ║ Bitte geben Sie den gewünschten Product Key im folgenden Format ein:      ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ║     XXXXX-XXXXX-XXXXX-XXXXX-XXXXX                                         ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            $ProductKey = Read-Host "Product Key"

            Clear-Host
                startbildschirm
                    Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
                    Write-Host "   ║ Product Key wird installiert...                                           ║"
                    Write-Host "   ║                                                                           ║"
                    Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
                    Start-Sleep -Milliseconds 1500
                    slmgr.vbs -ipk $ProductKey
                    Start-Sleep -Milliseconds 3000
                    menueauswahl
}

function productkey_aktivieren {
    Clear-Host
        $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        $princ = New-Object System.Security.Principal.WindowsPrincipal($identity)
        if(!$princ.IsInRole( `
            [System.Security.Principal.WindowsBuiltInRole]::Administrator))
            {
                $powershell = [System.Diagnostics.Process]::GetCurrentProcess()
                $psi = New-Object System.Diagnostics.ProcessStartInfo $powerShell.Path
                $script = $productkey_aktivierenFULLPATH
                $prm = $script
                    foreach($a in $args) {
                        $prm += ' ' + $a
                    }
                $psi.Arguments = $prm
                $psi.Verb = "runas"
                [System.Diagnostics.Process]::Start($psi) | Out-Null
                return;
            }
    ### Falls Adminrechte nicht erfordert werden können, ###
    ### soll das Script trotzdem ausgeführt werden.      ###
    & $productkey_aktivierenFULLPATH
}

### Lizenzinformationen abrufen - Menü ###
function lizenzinfo_abrufen {
        do {
        Clear-Host
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Lizenzinformationen abrufen                                               ║"
            Write-Host "   ╠═══════════════════════════════                                            ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?         ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ║ [ 1 ] einfache Informationen       ║ [ 2 ] erweiterte Informationen       ║"
            Write-Host "   ║                                    ║                                      ║"
            Write-Host "   ╠════════════════════════════════════╩══════════════════════════════════════╣"
            Write-Host "   ║ [ X ] Zurück zum Hauptmenü                                                ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""

            $input = Read-Host "Bitte wählen Sie"

            switch ($input) {
                '1' {lizenzinfo_einfach}
                '2' {lizenzinfo_erweitert}
                'x' {menueauswahl} # Zurück ins Hauptmenü #
            } pause }
        until ($input -eq 'x')
}

### einfache Lizenzinformationen abrufen ###
function lizenzinfo_einfach {
    Clear-Host
    startbildschirm
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Lizenzinformationen abrufen                                               ║"
        Write-Host "   ╠═══════════════════════════════                                            ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?         ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
        Write-Host "      ╔════════════════════════════════════════════════════════════════════════╗"
        Write-Host "      ║ Einfache Lizenzinformationen werden abgerufen...                       ║"
        Write-Host "      ║                                                                        ║"
        Write-Host "      ╚════════════════════════════════════════════════════════════════════════╝"
        slmgr.vbs -dli
        Write-Host ""
        Start-Sleep -Milliseconds 3000
        menueauswahl
}

### erweiterte Lizenzinformationen abrufen ###
function lizenzinfo_erweitert {
    Clear-Host
    startbildschirm
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Lizenzinformationen abrufen                                               ║"
        Write-Host "   ╠═══════════════════════════════                                            ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?         ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
        Write-Host "      ╔════════════════════════════════════════════════════════════════════════╗"
        Write-Host "      ║ Erweiterte Lizenzinformationen werden abgerufen...                     ║"
        Write-Host "      ║                                                                        ║"
        Write-Host "      ╚════════════════════════════════════════════════════════════════════════╝"
        slmgr.vbs -dlv
        Write-Host ""
        Start-Sleep -Milliseconds 3000
        menueauswahl
}

### Aktuell installierte Edition abfragen ###
function installierte_edition {
    Clear-Host
    startbildschirm
    $Edition = ''
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Installierte Edition abfragen                                             ║"
        Write-Host "   ╠═════════════════════════════════                                          ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ║ Edition wird abgefragt...                                                 ║"
        Write-Host "   ║                                                                           ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
        $Edition = DISM /online /Get-CurrentEdition
            Clear-Host
            startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Installierte Edition abfragen                                             ║"
            Write-Host "   ╠═════════════════════════════════                                          ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ║ Wir haben folgende Rückmeldung erhalten:                                  ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            $Edition[8]
            Write-Host ""
            Write-Host ""
}

### Windows Server-Editionen aktualisieren ###
function upd-srvedit {
    Clear-Host
        $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        $princ = New-Object System.Security.Principal.WindowsPrincipal($identity)
        if(!$princ.IsInRole( `
            [System.Security.Principal.WindowsBuiltInRole]::Administrator))
            {
                $powershell = [System.Diagnostics.Process]::GetCurrentProcess()
                $psi = New-Object System.Diagnostics.ProcessStartInfo $powerShell.Path
                $script = $upd_srveditFULLPATH
                $prm = $script
                    foreach($a in $args) {
                        $prm += ' ' + $a
                    }
                $psi.Arguments = $prm
                $psi.Verb = "runas"
                [System.Diagnostics.Process]::Start($psi) | Out-Null
                return;
            }
    ### Falls Adminrechte nicht erfordert werden können, ###
    ### soll das Script trotzdem ausgeführt werden.      ###
    & $upd_srveditFULLPATH
}

### Root-Verzeichnis ermitteln, zum öffnen des Programmcodes ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}

$installpath = Get-ScriptDirectory

### Pfade zu den Scripts ###
$scriptpath = "\tool_server.ps1"
$restart_scriptpath = "\script_neustart.ps1"
$upd_srveditPATH = "\script_upd-srvedit.ps1"
$productkey_aktivierenPATH = "\script_productkeyactivation.ps1"

### Volle Scriptpfade generieren ###
$fullscriptpath = $installpath + $scriptpath
$restart_fullscriptpath = $installpath + $restart_scriptpath
$upd_srveditFULLPATH = $installpath + $upd_srveditPATH
$productkey_aktivierenFULLPATH = $installpath + $productkey_aktivierenPATH

### Zurück zum Windows Server Installtool ###
function Exit-Script {
    if (Test-Path $fullscriptpath) {
        Clear-Host
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Windows Server Installtool                                                ║"
            Write-Host "   ╠═══════════════════════════════                                            ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ║ Das Programm wird gewechselt...                                           ║"
            Write-Host "   ║                                                                           ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════╝"
            Start-Sleep -Milliseconds 1500
            $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
            $princ = New-Object System.Security.Principal.WindowsPrincipal($identity)
            if(!$princ.IsInRole( `
                [System.Security.Principal.WindowsBuiltInRole]::Administrator))
                {
                    $powershell = [System.Diagnostics.Process]::GetCurrentProcess()
                    $psi = New-Object System.Diagnostics.ProcessStartInfo $powerShell.Path
                    $script = $fullscriptpath
                    $prm = $script
                        foreach($a in $args) {
                            $prm += ' ' + $a
                        }
                    $psi.Arguments = $prm
                    $psi.Verb = "runas"
                    [System.Diagnostics.Process]::Start($psi) | Out-Null
                    return;
                }
        ### Falls Adminrechte nicht erfordert werden können, ###
        ### soll das Script trotzdem ausgeführt werden.      ###
        & $fullscriptpath
    } else {
        [Environment]::Exit(1)
    }
}

### Windows neustarten ###
function neustarten {
    Clear-Host
        $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        $princ = New-Object System.Security.Principal.WindowsPrincipal($identity)
        if(!$princ.IsInRole( `
            [System.Security.Principal.WindowsBuiltInRole]::Administrator))
            {
                $powershell = [System.Diagnostics.Process]::GetCurrentProcess()
                $psi = New-Object System.Diagnostics.ProcessStartInfo $powerShell.Path
                $script = $restart_fullscriptpath
                $prm = $script
                    foreach($a in $args) {
                        $prm += ' ' + $a
                    }
                $psi.Arguments = $prm
                $psi.Verb = "runas"
                [System.Diagnostics.Process]::Start($psi) | Out-Null
                return;
            }
    ### Falls Adminrechte nicht erfordert werden können, ###
    ### soll das Script trotzdem ausgeführt werden.      ###
    & $restart_fullscriptpath
}

### Start ###
menueauswahl