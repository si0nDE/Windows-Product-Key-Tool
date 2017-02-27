cls

### Einstellungen
    $programmname    = "Windows Product Key Tool"
    $programmversion = "v1.2"

### Startbildschirm ###
    function startbildschirm {
        Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "║ $programmname $programmversion                                                 ║"
        Write-Host "║                                                                               ║"
        Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
    }

### Menü ###
    function menue {
        Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "   ║ Hauptmenü                                                                     ║"
        Write-Host "   ║                                                                               ║"
        Write-Host "   ║ [ 1 ] Testzeitraum um 60 Tage verlängern                                      ║"
        Write-Host "   ║ [ 2 ] Product Key eingeben                                                    ║"
        Write-Host "   ║ [ 3 ] Product Key aktivieren                                                  ║"
        Write-Host "   ║ [ 4 ] Lizenzinformationen abrufen                                             ║"
        Write-Host "   ╠═══════════════════════════════════════════════════════════════════════════════╣"
        Write-Host "   ║ [ X ] Programm beenden                                                        ║"
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
                '1' {
                    test_verlaengern
                }

                '2' {
                    productkey_eingeben
                }

                '3' {
                    productkey_aktivieren
                }

                '4' {
                    lizenzinfo_abrufen
                }

                'x' {
                    return
                }
            }
            pause
        }
        until ($input -eq 'x')
    }

function test_verlaengern {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Testzeitraum wird um 60 Tage verlängert...                                    ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            Start-Sleep -Milliseconds 1500
            slmgr.vbs -rearm
            Write-Host ""
        
}

function productkey_eingeben {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Bitte geben Sie den gewünschten Product Key im folgenden Format ein:          ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║     XXXXX-XXXXX-XXXXX-XXXXX-XXXXX                                             ║"
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
                    Write-Host ""
}

function productkey_aktivieren {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Product Key wird aktiviert...                                                 ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""
            Start-Sleep -Milliseconds 1500
            slmgr.vbs -ato
            Write-Host ""
}

function lizenzinfo_abrufen {
        do {
        cls
        startbildschirm
            Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
            Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?             ║"
            Write-Host "   ║                                                                               ║"
            Write-Host "   ║ [ 1 ] einfache Informationen         ║ [ 2 ] erweiterte Informationen         ║"
            Write-Host "   ╠═══════════════════════════════════════════════════════════════════════════════╣"
            Write-Host "   ║ [ X ] Zurück zum Hauptmenü                                                    ║"
            Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
            Write-Host ""

            $lizenzinput = Read-Host "Bitte wählen Sie"

            switch ($lizenzinput) {
                '1' {
                    lizenzinfo_einfach
                }

                '2' {
                    lizenzinfo_erweitert
                }

                'x' {
                    return
                }
            }
            pause
        }
        until ($lizenzinput -eq 'x')
}

function lizenzinfo_einfach {
    cls
    startbildschirm
    Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?             ║"
    Write-Host "   ║                                                                               ║"
    Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Write-Host "      ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "      ║ Einfache Lizenzinformationen werden abgerufen...                              ║"
    Write-Host "      ║                                                                               ║"
    Write-Host "      ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Start-Sleep -Milliseconds 1500
    slmgr.vbs -dli
    Write-Host ""
}


function lizenzinfo_erweitert {
    cls
    startbildschirm
    Write-Host "   ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "   ║ Möchten Sie einfache oder erweiterte Lizenzinformationen abrufen?             ║"
    Write-Host "   ║                                                                               ║"
    Write-Host "   ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Write-Host "      ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "      ║ Erweiterte Lizenzinformationen werden abgerufen...                            ║"
    Write-Host "      ║                                                                               ║"
    Write-Host "      ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Start-Sleep -Milliseconds 1500
    slmgr.vbs -dlv
    Write-Host ""
}

### Start ###
startbildschirm
menue
menueauswahl