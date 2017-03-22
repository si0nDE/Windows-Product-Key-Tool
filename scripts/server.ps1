cls

### Startbildschirm ###
    function startbildschirm {
        Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "║ Windows Product Key Tool                                                      ║"
        Write-Host "║                                                                               ║"
        Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
    }

### Menü ###
    function menue {
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Hauptmenü                                                                     ║"
        Write-Host "   ╠═════════════                                                                  ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ [ 1 ] Product Key eingeben                                                    ║"
        Write-Host "   ║ [ 2 ] Product Key aktivieren                                                  ║"
        Write-Host "   ║ [ 3 ] Aktuell installierte Edition abfragen                                   ║"
        Write-Host "   ║ [ 4 ] Windows Server-Editionen aktualisieren                                  ║"
        Write-Host "   ║ [ 5 ] Lizenzinformationen abrufen                                             ║"
        Write-Host "   ╠═══════════════════════════════════════════════════════════════════════════════╣"
        Write-Host "   ║ [ 0 ] WPK-Tool für PCs starten                                                ║"
        Write-Host "   ║ [ X ] Programm beenden                                                        ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
    }

### Menüauswahl ###
function menueauswahl {
    do {
        cls
        startbildschirm
        menue
            Write-Host ""
            $input = Read-Host "Bitte wählen Sie"

            switch ($input) {
                '0' {pctool}
                '1' {productkey_eingeben}
                '2' {productkey_aktivieren}
                '3' {installierte_edition}
                '4' {edition_aktualisieren}
                '5' {lizenzinfo_abrufen}
                'x' {exit}
            } pause }
        until ($input -eq 'x')
}

### Product Key installieren ###
function productkey_eingeben {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Product Key eingeben                                                          ║"
            Write-Host "   ╠════════════════════════                                                       ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Bitte geben Sie den gewünschten Product Key im folgenden Format ein:          ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║     XXXXX-XXXXX-XXXXX-XXXXX-XXXXX                                             ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            $ProductKey = Read-Host "Product Key"

            cls
                startbildschirm
                    Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
                    Write-Host "   ║ Product Key wird installiert...                                               ║"
                    Write-Host "   ║                                                                               ║"
                    Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
                    Start-Sleep -Milliseconds 1500
                    slmgr.vbs -ipk $ProductKey
                    Start-Sleep -Milliseconds 3000
                    menueauswahl
}

### Product Key aktivieren - Menü ###
function productkey_aktivieren {
        do {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Product Key aktivieren                                                        ║"
            Write-Host "   ╠══════════════════════════                                                     ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Möchten Sie Ihren Product Key online oder telefonisch aktivieren?             ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ [ 1 ] Online aktivieren              ║ [ 2 ] Telefonisch aktivieren           ║"
            Write-Host "   ║                                      ║                                        ║"
            Write-Host "   ╠══════════════════════════════════════╩════════════════════════════════════════╣"
            Write-Host "   ║ [ X ] Zurück zum Hauptmenü                                                    ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""

            $input = Read-Host "Bitte wählen Sie"

            switch ($input) {
                '1' {productkey_onlaktivieren}
                '2' {productkey_telaktivieren}
                'x' {menueauswahl} # Zurück ins Hauptmenü #
            } pause }
        until ($input -eq 'x')
}

### Product Key online aktivieren ###
function productkey_onlaktivieren {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Product Key online aktivieren                                                 ║"
            Write-Host "   ╠═════════════════════════════════                                              ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Product Key wird aktiviert...                                                 ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            Start-Sleep -Milliseconds 1500
            slmgr.vbs -ato
            Start-Sleep -Milliseconds 3000
            menueauswahl
}

### Product Key telefonisch aktivieren
function productkey_telaktivieren {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Product Key telefonisch aktivieren                                            ║"
            Write-Host "   ╠══════════════════════════════════════                                         ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Der Assistant zur telefonischen Aktivierung wird geladen...                   ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            Start-Sleep -Milliseconds 1500
            slui 4
            Start-Sleep -Milliseconds 3000
            menueauswahl
}

### Lizenzinformationen abrufen - Menü ###
function lizenzinfo_abrufen {
        do {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Lizenzinformationen abrufen                                                   ║"
            Write-Host "   ╠═══════════════════════════════                                                ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?             ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ [ 1 ] einfache Informationen         ║ [ 2 ] erweiterte Informationen         ║"
            Write-Host "   ║                                      ║                                        ║"
            Write-Host "   ╠══════════════════════════════════════╩════════════════════════════════════════╣"
            Write-Host "   ║ [ X ] Zurück zum Hauptmenü                                                    ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
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
    cls
    startbildschirm
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Lizenzinformationen abrufen                                                   ║"
        Write-Host "   ╠═══════════════════════════════                                                ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?             ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
        Write-Host "      ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "      ║ Einfache Lizenzinformationen werden abgerufen...                              ║"
        Write-Host "      ║                                                                               ║"
        Write-Host "      ╚═══════════════════════════════════════════════════════════════════════════════╝"
        slmgr.vbs -dli
        Write-Host ""
        Start-Sleep -Milliseconds 3000
        menueauswahl
}

### erweiterte Lizenzinformationen abrufen ###
function lizenzinfo_erweitert {
    cls
    startbildschirm
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Lizenzinformationen abrufen                                                   ║"
        Write-Host "   ╠═══════════════════════════════                                                ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?             ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
        Write-Host "      ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "      ║ Erweiterte Lizenzinformationen werden abgerufen...                            ║"
        Write-Host "      ║                                                                               ║"
        Write-Host "      ╚═══════════════════════════════════════════════════════════════════════════════╝"
        slmgr.vbs -dlv
        Write-Host ""
        Start-Sleep -Milliseconds 3000
        menueauswahl
}

### Aktuell installierte Edition abfragen ###
function installierte_edition {
    cls
    startbildschirm
    $Edition = ''
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Installierte Edition abfragen                                                 ║"
        Write-Host "   ╠═════════════════════════════════                                              ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ Edition wird abgefragt...                                                     ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
        $Edition = DISM /online /Get-CurrentEdition
            cls
            startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Installierte Edition abfragen                                                 ║"
            Write-Host "   ╠═════════════════════════════════                                              ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Wir haben folgende Rückmeldung erhalten:                                      ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            $Edition[8]
            Write-Host ""
            Write-Host ""
}

### Windows Server-Editionen aktualisieren ###
function edition_aktualisieren {
    cls
    startbildschirm
    $UpdateEdition = ''
    $WunschEdition = ''
    $ProductKey = ''
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Windows Server-Editionen aktualisieren                                        ║"
        Write-Host "   ╠══════════════════════════════════════════                                     ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ Mögliche Editionen zum aktualisieren werden abgefragt...                      ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
        $UpdateEdition = DISM /online /Get-TargetEditions
            cls
            startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Windows Server-Editionen aktualisieren                                        ║"
            Write-Host "   ╠══════════════════════════════════════════                                     ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ Wir haben folgende Rückmeldung erhalten:                                      ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            $UpdateEdition
            Write-Host ""
            Start-Sleep -Milliseconds 1500
            Write-Host "      ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "      ║ Windows Server-Editionen aktualisieren                                        ║"
            Write-Host "      ╠══════════════════════════════════════════                                     ║"
            Write-Host "      ║                                                                               ║"
            Write-Host "      ║ Welche Edition möchten Sie aktualisieren?                                     ║"
            Write-Host "      ║                                                                               ║"
            Write-Host "      ║ Geben Sie die gewünschte Edition genau so ein, wie sie oben angegeben wird.   ║"
            Write-Host "      ║                                                                               ║"
            Write-Host "      ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            $WunschEdition = Read-Host "      Gewünschte Edition"
            Start-Sleep -Milliseconds 1500
                cls
                startbildschirm
                Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
                Write-Host "   ║ Windows Server-Editionen aktualisieren                                        ║"
                Write-Host "   ╠══════════════════════════════════════════                                     ║"
                Write-Host "   ║                                                                               ║"
                Write-Host "   ║ Bitte geben Sie den gewünschten Product Key im folgenden Format ein:          ║"
                Write-Host "   ║                                                                               ║"
                Write-Host "   ║     XXXXX-XXXXX-XXXXX-XXXXX-XXXXX                                             ║"
                Write-Host "   ║                                                                               ║"
                Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
                Write-Host ""
                $ProductKey = Read-Host "Geben Sie den Product Key für $WunschEdition ein"
                Start-Sleep -Milliseconds 1500
                    cls
                    startbildschirm
                    Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
                    Write-Host "   ║ Windows Server-Editionen aktualisieren                                        ║"
                    Write-Host "   ╠══════════════════════════════════════════                                     ║"
                    Write-Host "   ║                                                                               ║"
                    Write-Host "   ║ Windows Edition wird aktualisiert...                                          ║"
                    Write-Host "   ║                                                                               ║"
                    Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
                    Write-Host ""
                    Write-Host "Windows-Edition: $WunschEdition"
                    Start-Sleep -Milliseconds 1500
                    Write-Host "Product Key:     $ProductKey"
                    Start-Sleep -Milliseconds 3000
                        cls
                        startbildschirm
                        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
                        Write-Host "   ║ Windows Server-Editionen aktualisieren                                        ║"
                        Write-Host "   ╠══════════════════════════════════════════                                     ║"
                        Write-Host "   ║                                                                               ║"
                        Write-Host "   ║ Windows Edition wird aktualisiert...                                          ║"
                        Write-Host "   ║                                                                               ║"
                        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
                        Write-Host ""
                        Start-Sleep -Milliseconds 1500
                        DISM /online /Set-Edition:$WunschEdition /ProductKey:$ProductKey /AcceptEULA
                        Write-Host ""
                        Write-Host ""
}

### Root-Verzeichnisp3 ermitteln, zum öffnen des Programmcodes ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
 
$installpath = Get-ScriptDirectory

### Zurück zum Tool für Windows-PCs ###
function pctool {
    cls
    startbildschirm
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ WPK-Tool für Windows Server                                                   ║"
        Write-Host "   ╠═══════════════════════════════                                                ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ Das Programm wird gewechselt...                                               ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
        Start-Sleep -Milliseconds 1500
        Start-Process powershell -verb runas -ArgumentList "-file $installpath\pc.ps1"
        exit
}

### Start ###
menueauswahl