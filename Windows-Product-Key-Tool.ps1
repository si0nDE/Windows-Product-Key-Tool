    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

Clear-Host

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Windows Product Key Tool v2.2.1s                                              ║"
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
# SIG # Begin signature block
# MIIRXQYJKoZIhvcNAQcCoIIRTjCCEUoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUnIoGkfSjr+BS/AnRJTJfT4XL
# g0Sggg28MIIGuTCCBKGgAwIBAgIRAJmjgAomVTtlq9xuhKaz6jkwDQYJKoZIhvcN
# AQEMBQAwgYAxCzAJBgNVBAYTAlBMMSIwIAYDVQQKExlVbml6ZXRvIFRlY2hub2xv
# Z2llcyBTLkEuMScwJQYDVQQLEx5DZXJ0dW0gQ2VydGlmaWNhdGlvbiBBdXRob3Jp
# dHkxJDAiBgNVBAMTG0NlcnR1bSBUcnVzdGVkIE5ldHdvcmsgQ0EgMjAeFw0yMTA1
# MTkwNTMyMThaFw0zNjA1MTgwNTMyMThaMFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQK
# ExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0NlcnR1bSBDb2Rl
# IFNpZ25pbmcgMjAyMSBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIB
# AJ0jzwQwIzvBRiznM3M+Y116dbq+XE26vest+L7k5n5TeJkgH4Cyk74IL9uP61ol
# RsxsU/WBAElTMNQI/HsE0uCJ3VPLO1UufnY0qDHG7yCnJOvoSNbIbMpT+Cci75sc
# Cx7UsKK1fcJo4TXetu4du2vEXa09Tx/bndCBfp47zJNsamzUyD7J1rcNxOw5g6FJ
# g0ImIv7nCeNn3B6gZG28WAwe0mDqLrvU49chyKIc7gvCjan3GH+2eP4mYJASflBT
# Q3HOs6JGdriSMVoD1lzBJobtYDF4L/GhlLEXWgrVQ9m0pW37KuwYqpY42grp/kSY
# E4BUQrbLgBMNKRvfhQPskDfZ/5GbTCyvlqPN+0OEDmYGKlVkOMenDO/xtMrMINRJ
# S5SY+jWCi8PRHAVxO0xdx8m2bWL4/ZQ1dp0/JhUpHEpABMc3eKax8GI1F03mSJVV
# 6o/nmmKqDE6TK34eTAgDiBuZJzeEPyR7rq30yOVw2DvetlmWssewAhX+cnSaaBKM
# Ej9O2GgYkPJ16Q5Da1APYO6n/6wpCm1qUOW6Ln1J6tVImDyAB5Xs3+JriasaiJ7P
# 5KpXeiVV/HIsW3ej85A6cGaOEpQA2gotiUqZSkoQUjQ9+hPxDVb/Lqz0tMjp6RuL
# SKARsVQgETwoNQZ8jCeKwSQHDkpwFndfCceZ/OfCUqjxAgMBAAGjggFVMIIBUTAP
# BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTddF1MANt7n6B0yrFu9zzAMsBwzTAf
# BgNVHSMEGDAWgBS2oVQ5AsOgP46KvPrU+Bym0ToO/TAOBgNVHQ8BAf8EBAMCAQYw
# EwYDVR0lBAwwCgYIKwYBBQUHAwMwMAYDVR0fBCkwJzAloCOgIYYfaHR0cDovL2Ny
# bC5jZXJ0dW0ucGwvY3RuY2EyLmNybDBsBggrBgEFBQcBAQRgMF4wKAYIKwYBBQUH
# MAGGHGh0dHA6Ly9zdWJjYS5vY3NwLWNlcnR1bS5jb20wMgYIKwYBBQUHMAKGJmh0
# dHA6Ly9yZXBvc2l0b3J5LmNlcnR1bS5wbC9jdG5jYTIuY2VyMDkGA1UdIAQyMDAw
# LgYEVR0gADAmMCQGCCsGAQUFBwIBFhhodHRwOi8vd3d3LmNlcnR1bS5wbC9DUFMw
# DQYJKoZIhvcNAQEMBQADggIBAHWIWA/lj1AomlOfEOxD/PQ7bcmahmJ9l0Q4SZC+
# j/v09CD2csX8Yl7pmJQETIMEcy0VErSZePdC/eAvSxhd7488x/Cat4ke+AUZZDtf
# Cd8yHZgikGuS8mePCHyAiU2VSXgoQ1MrkMuqxg8S1FALDtHqnizYS1bIMOv8znyJ
# jZQESp9RT+6NH024/IqTRsRwSLrYkbFq4VjNn/KV3Xd8dpmyQiirZdrONoPSlCRx
# CIi54vQcqKiFLpeBm5S0IoDtLoIe21kSw5tAnWPazS6sgN2oXvFpcVVpMcq0C4x/
# CLSNe0XckmmGsl9z4UUguAJtf+5gE8GVsEg/ge3jHGTYaZ/MyfujE8hOmKBAUkVa
# 7NMxRSB1EdPFpNIpEn/pSHuSL+kWN/2xQBJaDFPr1AX0qLgkXmcEi6PFnaw5T17U
# dIInA58rTu3mefNuzUtse4AgYmxEmJDodf8NbVcU6VdjWtz0e58WFZT7tST6EWQm
# x/OoHPelE77lojq7lpsjhDCzhhp4kfsfszxf9g2hoCtltXhCX6NqsqwTT7xe8LgM
# kH4hVy8L1h2pqGLT2aNCx7h/F95/QvsTeGGjY7dssMzq/rSshFQKLZ8lPb8hFTmi
# GDJNyHga5hZ59IGynk08mHhBFM/0MLeBzlAQq1utNjQprztZ5vv/NJy8ua9AGbwk
# MWkOMIIG+zCCBOOgAwIBAgIQK+f7Uy5kD1jz1bwdP/CqHjANBgkqhkiG9w0BAQsF
# ADBWMQswCQYDVQQGEwJQTDEhMB8GA1UEChMYQXNzZWNvIERhdGEgU3lzdGVtcyBT
# LkEuMSQwIgYDVQQDExtDZXJ0dW0gQ29kZSBTaWduaW5nIDIwMjEgQ0EwHhcNMjEw
# ODA0MTAyOTMyWhcNMjIwODA0MTAyOTMyWjCBoDELMAkGA1UEBhMCREUxDzANBgNV
# BAgMBkJheWVybjEWMBQGA1UEBwwNR3VlbnRlcnNsZWJlbjEhMB8GA1UECgwYU2lt
# b24gRmllYmVyIElULVNlcnZpY2VzMSEwHwYDVQQDDBhTaW1vbiBGaWViZXIgSVQt
# U2VydmljZXMxIjAgBgkqhkiG9w0BCQEWE2luZm9Ac2ltb25maWViZXIuaXQwggIi
# MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDm+xOZMZ4kHCyDIUYBA8szgRqt
# HWixxhwkF/eA7Jn2bMvbqCraMaLCAawWrPS+5z+Fj0tRt7hShS015AtGIDRC3PLr
# XHZbpgAWMxNr2F8VKCtYckK0wCJgUjSIFa0BkyUMBdlX5Qb1WKGTDdpdLXRqmPB1
# 4RxkHO6hb6IzSIq9GYoIETi+bk5JKoIgQjOT6FiLTfS84U2Ji+g79iPVGL9YXezQ
# iXByxRnimQQwgjfV12dIos84eT15lWZ1fX/MqH4ueDLeAWfUNW32otNfcXDjksf7
# iZphw16HeFrI2HTrcos0qFuM7zVwpnt7aEV0NIq0fOmvgbHfq36pRHRugseUXTi9
# Osbg7AIQK09JKO6Fcrf3EVGeiJXlvfI/zmZ2YpejCCbo+mta3lZOCkvnsIPkGVek
# RqquOYmqjPrAqt0aSsL/eKkEot/oZjnxfv0KbkH/WSJSTALFHfQnyK1luwtLFv4F
# +hJ9RLEA17EjhFBqi6HsQpncK+x6OW986M6jWUnH1r4xmkmersruOatodyCARaFt
# 20syCwwIgiWVAwiin3iRhtu122DyG/THxAuGhDqW4akLQ7MVYyRy+ecpv0/qsMPQ
# HYnX37sniVKcTD8I3fwQsoCsde12ybPMqxOW0O5pGlWumD2FUzhiuoeUWvKIcuNX
# PVrrCnOMkArwm2I6mQIDAQABo4IBeDCCAXQwDAYDVR0TAQH/BAIwADA9BgNVHR8E
# NjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0ucGwvY2NzY2Ey
# MDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0dHA6Ly9jY3Nj
# YTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAChilodHRwOi8vcmVwb3Np
# dG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAWgBTddF1MANt7
# n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUIzrD/5N54VPjxHO768m1ymTqLV0wSwYD
# VR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQwJzAlBggrBgEFBQcCARYZ
# aHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUEDDAKBggrBgEFBQcDAzAO
# BgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAI/KUDeMk8Idqgld5ZcB
# QWK739RntT3JqhWk7dsRYT0XLQHGRrQylhtiAh4ZhaTilsk5VDSjH2jRBgGj6XcU
# /q5WMDVn2UG3jdTVgDa7PWmHC2H3t6OC+b1MF/94wFT3uJrMdv7iCWrH4EDqh4lv
# BHUlzw/NuhFm8xvHyqqYmkvXYb9OZuoZ6JdlXWha0cvDf43aTimhE253u4KIbfGA
# mGyip7T28FLB2Jufw7hFVFMfxKCw+0oMeA8livvv3C56w+BaHh5uLY2qUmIK13CC
# 44NwM0Yv5Zd6VJsJL1XY54GI14UjyM0RsbEzVCGYMVra4GQhp8VFVOKdWTxNqQuX
# 97F+M0VJ5GO+SCQr/SHDUen1lp1+0Qq3hDN6YeyKu0BjWrYYv1+MzCWgdI5pcMgg
# F+A63Hg3YeJHRWzHCLvrEpwsL9m+Q6fas5PXexfCKTYY9IhQskGbJ85t8psvOJsl
# fVU3FOgTKrpwgFoGHdTeSoJcw6phf8fWYKoKzv7s1yzo1hMnmE5u2ku4hXeDSVV8
# 1moKrA3Gm3Icbib72Ph15zUP56SWdEoaVNhuHxd4jNxF2dpwr7gkh9i85BDaKXhA
# ZQ5f4imYzCyGXNysWseNdNuUXEWxqcIoa5VBXGjjU3XM43Oh6GvdMU/uq8wg7UaM
# oNhpHDcLf+7hygjhADo/sfB9MYIDCzCCAwcCAQEwajBWMQswCQYDVQQGEwJQTDEh
# MB8GA1UEChMYQXNzZWNvIERhdGEgU3lzdGVtcyBTLkEuMSQwIgYDVQQDExtDZXJ0
# dW0gQ29kZSBTaWduaW5nIDIwMjEgQ0ECECvn+1MuZA9Y89W8HT/wqh4wCQYFKw4D
# AhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZI
# hvcNAQkEMRYEFAdRA/YcMbVYAP7Nml4+wkFLyhyBMA0GCSqGSIb3DQEBAQUABIIC
# AE9Mpmq9uMHuOv3YW3W8HAr2T8/xcZUzqnG8AEa+ha/jISxXYqv+CdLSmvuWVvw6
# c+BuFDWnRQe6sMRExOtY/lDHSTDkOLi6IWwPVZFn459YDTWtSFUSN0jxZaDbr1Ov
# 4Db8lnAnegrJPmjUe5DerssrImvcQabGBwA9u8/Ye+JItZ+yk+ms8VIXkAVCuwkK
# UHU9qs2k0MnoXky+3f30SuoTZ3SPPGYTBMG1kN7o+WV2DfJgFfJjglidbbcNcdVk
# 5GexbeKVK/0xx/AFfnXP8mfd6mQjkgTuUKI4k+zmZQPnYjDuNiWL5oq7FWsCi2F/
# uUgg9b94nK5+NiGHi6jtYffL/4aGiPlCVw7MQkFHCxnOwNkDNBTgJDnVzpEPxz+9
# n6PqKZP8JoubL7pPAwIL72z/sJ+rOXShQzBzVFOQ80mzO7+JTKH/RASLXVBzKa/2
# KzqdyXAK4a3AjMsotOj4fTO3mai9AebBBtsmU2czYJin0TTd0GWlH4A0Xri14v+U
# Jn26DGkDntUnhVWgS8LleddaY73IbIFAefTBP5Pwya4OmA8QR1ddx6oWzX0yK+kF
# kdTrkDS2b+aTjDn9jAz7EYImP4rDSNfuVOcvRKpwxASSIG597elVlieb7hmxnUUJ
# kw25ttIrgqI+76LVgneRuqkCSvLaGamJIzoxhiFWISFz
# SIG # End signature block
