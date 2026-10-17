@echo off
setlocal enabledelayedexpansion
title Windows Toolkit Gabungan

:: Auto-elevation ke Administrator
NET FILE >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo Meminta Hak Akses Administrator...
    powershell Start-Process "%~f0" -Verb RunAs
    exit /b
)

:MAIN_MENU
cls
echo ===================================================
echo            WINDOWS TOOLKIT GABUNGAN
echo ===================================================
echo.
echo  [1] Pengaturan DNS (IPv4, IPv6, DoH)
echo  [2] Matikan Windows Update ^& Bersihkan Cache Update
echo  [3] Aktifkan Kembali Windows Update
echo  [4] Bersihkan File Sampah Umum (Temp, Prefetch, dll.)
echo.
echo  --- Utilitas Sistem ---
echo  [5] Restart Windows Explorer
echo  [6] Tutup Paksa Aplikasi "Not Responding"
echo  [7] Bangun Ulang Cache Ikon ^& Thumbnail
echo  [8] Bersihkan Riwayat Clipboard
echo.
echo  --- Pahlawan IT ---
echo  [9] Reset Print Spooler (Perbaiki Printer Macet)
echo  [10] Unhide File Flashdisk (Pawang Virus Shortcut)
echo  [11] Force Sync Jam Windows (Fix Error SSL)
echo  [12] Bersihkan Cache Microsoft Office (Atasi Lag)
echo  [13] Bersihkan Cache Google Chrome (Tanpa Logout)
echo  [14] Refresh IP ^& Routing Jaringan
echo  [15] Restart Layanan Database PostgreSQL
echo  [16] Hapus Paksa File / Folder Membandel
echo.
echo  --- Pemeliharaan ^& Diagnosis ---
echo  [17] Perbaiki File Sistem Corrupt (SFC ^& DISM)
echo  [18] Buka Folder Startup Windows
echo  [19] Reset Windows Search ^& Indexing
echo  [20] Cek Spesifikasi Hardware ^& Sistem
echo  [21] Speedtest Internet (Server Google)
echo  [22] Toggle File Tersembunyi ^& Ekstensi
echo  [23] Kunci / Buka USB Storage
echo  [24] Lihat Password Wi-Fi Tersimpan
echo  [25] Bebaskan Port Macet (Kill PID)
echo  [26] Buat Folder GodMode di Desktop
echo.
echo  --- Pahlawan IT Lapangan ---
echo  [27] Restart Semua Adaptor Jaringan
echo  [28] Backup Semua Driver Sistem
echo  [29] Cek Status Lisensi Windows
echo  [30] Menu Pintas Admin
echo  [31] Set Power Scheme Never Sleep
echo.
echo  --- Spesialis Servis PC ---
echo  [32] Cek Kesehatan SSD / HDD (S.M.A.R.T)
echo  [33] Matikan Sementara Windows Defender
echo  [34] Bersihkan Semua Event Log
echo  [35] Aktifkan Akun Administrator Bawaan
echo  [36] Buat System Restore Point
echo  [37] Core Isolation - Memory Integrity
echo  [38] Toggle Fast Startup (Perbaiki Bug Shutdown)
echo  [39] Ekstrak Product Key Windows dari BIOS
echo  [40] Laporan Kesehatan Baterai (Khusus Laptop)
echo  [41] Bersihkan Cache Microsoft Edge
echo  [42] Hapus Cache Delivery Optimization (Hemat Disk)
echo  [43] Cek Uptime Sistem ^& Umur Windows
echo  [44] Ubah Jaringan ke Private (Fix Share Folder)
echo  [45] Reset Microsoft Store ^& Apps Bawaan
echo  [46] Cek Driver Bermasalah (Error Code)
echo.
echo  [0] Keluar
echo ===================================================
set "main_opt="
set /p main_opt="Pilih opsi lalu tekan Enter: "

if "%main_opt%"=="1" goto DNS_MENU
if "%main_opt%"=="2" goto RUN_DISABLE_UPDATE
if "%main_opt%"=="3" goto RUN_ENABLE_UPDATE
if "%main_opt%"=="4" goto RUN_CLEAN_WINDOWS
if "%main_opt%"=="5" goto RUN_RESTART_EXPLORER
if "%main_opt%"=="6" goto RUN_KILL_NOT_RESPONDING
if "%main_opt%"=="7" goto RUN_REBUILD_CACHE
if "%main_opt%"=="8" goto RUN_CLEAR_CLIPBOARD
if "%main_opt%"=="9" goto RUN_RESET_SPOOLER
if "%main_opt%"=="10" goto RUN_UNHIDE_FLASHDISK
if "%main_opt%"=="11" goto RUN_SYNC_TIME
if "%main_opt%"=="12" goto RUN_CLEAN_OFFICE_CACHE
if "%main_opt%"=="13" goto RUN_CLEAN_CHROME
if "%main_opt%"=="14" goto RUN_REFRESH_NETWORK
if "%main_opt%"=="15" goto RUN_RESTART_DB
if "%main_opt%"=="16" goto RUN_FORCE_DELETE
if "%main_opt%"=="17" goto RUN_REPAIR_SYSTEM
if "%main_opt%"=="18" goto RUN_OPEN_STARTUP
if "%main_opt%"=="19" goto RUN_RESET_SEARCH
if "%main_opt%"=="20" goto RUN_PC_INFO
if "%main_opt%"=="21" goto RUN_SPEEDTEST_ADAPTERS
if "%main_opt%"=="22" goto RUN_TOGGLE_EXPLORER_VIEW
if "%main_opt%"=="23" goto RUN_TOGGLE_USB_STORAGE
if "%main_opt%"=="24" goto RUN_WIFI_PASSWORDS
if "%main_opt%"=="25" goto RUN_KILL_PORT
if "%main_opt%"=="26" goto RUN_CREATE_GODMODE
if "%main_opt%"=="27" goto RUN_RESTART_ALL_ADAPTERS
if "%main_opt%"=="28" goto RUN_BACKUP_DRIVERS
if "%main_opt%"=="29" goto RUN_WINDOWS_LICENSE
if "%main_opt%"=="30" goto RUN_ADMIN_SHORTCUTS
if "%main_opt%"=="31" goto RUN_NEVER_SLEEP
if "%main_opt%"=="32" goto RUN_CHECK_DISK_HEALTH
if "%main_opt%"=="33" goto RUN_DISABLE_DEFENDER_TEMP
if "%main_opt%"=="34" goto RUN_CLEAR_EVENT_LOGS
if "%main_opt%"=="35" goto RUN_ENABLE_ADMIN_ACCOUNT
if "%main_opt%"=="36" goto RUN_CREATE_RESTORE_POINT
if "%main_opt%"=="37" goto CORE_ISOLATION_MENU
if "%main_opt%"=="38" goto RUN_TOGGLE_FAST_STARTUP
if "%main_opt%"=="39" goto RUN_GET_PRODUCT_KEY
if "%main_opt%"=="40" goto RUN_BATTERY_REPORT
if "%main_opt%"=="41" goto RUN_CLEAN_EDGE
if "%main_opt%"=="42" goto RUN_CLEAN_DO_CACHE
if "%main_opt%"=="43" goto RUN_CHECK_UPTIME
if "%main_opt%"=="44" goto RUN_SET_NETWORK_PRIVATE
if "%main_opt%"=="45" goto RUN_RESET_STORE
if "%main_opt%"=="46" goto RUN_CHECK_BAD_DRIVERS
if "%main_opt%"=="0" exit
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 1: PENGATURAN DNS (dari Setting_DNS.bat)
:: ==================================================================

:DNS_MENU
cls
if defined SELECTED_ALL (
    set "ADAPTER_MODE=Semua adaptor aktif"
) else if not defined SELECTED_IFACE (
    set "ADAPTER_MODE=Otomatis"
) else (
    set "ADAPTER_MODE=Manual: !SELECTED_IFACE!"
)
echo =================================================================================
echo                      PENGATURAN DNS WINDOWS
echo                      Mode Adaptor: !ADAPTER_MODE!
echo =================================================================================
echo  --- DNS STANDAR ---                 --- DNS DOH UMUM ---
echo  [1]  AdGuard                         [14] AdGuard Personal
echo  [2]  Cloudflare                       [15] AdGuard PC Rumah
echo  [3]  Quad9                            [16] AdGuard Hunting PC
echo  [4]  Google Public DNS                [17] AdGuard DNS Poco
echo  [5]  Control D                        [18] Cloudflare DoH
echo  [6]  Mullvad                          [19] Quad9 DoH
echo  [7]  OpenDNS                           [20] Google DoH
echo  [8]  CleanBrowsing                    [21] NextDNS DoH
echo  [9]  dns0.eu                          [22] Mullvad DoH AdBlock
echo  [10] NextDNS                          [23] Mullvad DoH Standard
echo  [11] AhaDNS                           [24] Control D DoH
echo  [12] OpenDNS FamilyShield             [25] Control D DoH Family
echo  [13] Comodo                           [26] OpenDNS DoH
echo                                      [27] OpenDNS Family DoH
echo                                      [28] CleanBrowsing Security DoH
echo                                      [29] CleanBrowsing Adult DoH
echo                                      [30] RethinkDNS DoH
echo                                      [31] DNS0.eu Zero DoH
echo                                      [32] DNS0.eu Kids DoH
echo.
echo  --- DNS TAMBAHAN ---                 --- DOH TAMBAHAN ---
echo  [41] Nawala Trust+Positif             [54] AdGuard DoH
echo  [42] AdGuard Indonesia                [55] Control D DoH
echo  [43] DNSku CleanDNS                   [56] RethinkDNS DoH
echo  [44] NextDNS Jakarta                  [57] BlahDNS DoH
echo  [45] Control D Jakarta                [58] Cloudflare Security DoH
echo  [46] Alternate DNS                   [59] DNS.SB DoH
echo  [47] RethinkDNS                       [60] DNSForge DoH
echo  [48] BlahDNS Asia
echo  [49] AhaDNS Blitz
echo  [50] Cloudflare Malware
echo  [51] Cloudflare Full Protection
echo  [52] DNS.SB
echo  [53] DNSForge.de
echo.
echo  --- KONTROL ---
echo  [33] Cek DNS Aktif          [34] Cek IP Publik
echo  [36] Tes Ping Koneksi       [37] Hapus Semua DoH/DoT
echo  [39] Pilih Adaptor           [40] Cloudflare DoT
echo  [R] Reset DNS DHCP           [F] Flush DNS Cache      [0] Menu Utama
echo =================================================================================
set "opt="
set /p "opt=Pilih opsi: "
if defined SELECTED_ALL if not "%opt%"=="33" if not "%opt%"=="34" if not "%opt%"=="36" if not "%opt%"=="37" if not "%opt%"=="39" if not "%opt%"=="40" if not "%opt%"=="R" if not "%opt%"=="F" if not "%opt%"=="0" goto ALL_INTERFACE_DISPATCH
if "%opt%"=="1" call :SET_DNS_PROFILE "AdGuard" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff"
if "%opt%"=="2" call :SET_DNS_PROFILE "Cloudflare" "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001"
if "%opt%"=="3" call :SET_DNS_PROFILE "Quad9" "9.9.9.9" "149.112.112.112" "2620:fe::fe" "2620:fe::9"
if "%opt%"=="4" call :SET_DNS_PROFILE "Google" "8.8.8.8" "8.8.4.4" "2001:4860:4860::8888" "2001:4860:4860::8844"
if "%opt%"=="5" call :SET_DNS_PROFILE "Control D" "76.76.2.0" "76.76.10.0" "2606:1a40::" "2606:1a40:1::"
if "%opt%"=="6" call :SET_DNS_PROFILE "Mullvad" "194.242.2.3" "194.242.2.4" "2a07:e880::3" "2a07:e880::4"
if "%opt%"=="7" call :SET_DNS_PROFILE "OpenDNS" "208.67.222.222" "208.67.220.220" "2620:119:35::35" "2620:119:53::53"
if "%opt%"=="8" call :SET_DNS_PROFILE "CleanBrowsing" "185.228.168.9" "185.228.169.9" "2a0d:2a00:1::2" "2a0d:2a00:2::2"
if "%opt%"=="9" call :SET_DNS_PROFILE "dns0.eu" "193.110.81.0" "185.253.5.0" "2a0f:6b80::" "2a0f:6b80:1::"
if "%opt%"=="10" call :SET_DNS_PROFILE "NextDNS" "45.90.28.234" "45.90.30.234" "2a07:a8c0::" "2a07:a8c1::"
if "%opt%"=="11" call :SET_DNS_PROFILE "AhaDNS" "5.2.78.36" "45.132.74.167" "" ""
if "%opt%"=="12" call :SET_DNS_PROFILE "OpenDNS FamilyShield" "208.67.222.123" "208.67.220.123" "2620:119:35::123" "2620:119:53::123"
if "%opt%"=="13" call :SET_DNS_PROFILE "Comodo" "8.26.56.26" "8.20.247.20" "" ""
if "%opt%"=="14" call :SET_DOH_PROFILE "AdGuard Personal" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://8faa9ffc.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="15" call :SET_DOH_PROFILE "AdGuard Rumah" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://64c71a5e.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="16" call :SET_DOH_PROFILE "AdGuard Hunting" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://bae7b182.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="17" call :SET_DOH_PROFILE "AdGuard Poco" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://791115cd.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="18" call :SET_DOH_PROFILE "Cloudflare DoH" "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001" "https://cloudflare-dns.com/dns-query" "1.1.1.1"
if "%opt%"=="19" call :SET_DOH_PROFILE "Quad9 DoH" "9.9.9.9" "149.112.112.112" "2620:fe::fe" "2620:fe::9" "https://dns.quad9.net/dns-query" "9.9.9.9"
if "%opt%"=="20" call :SET_DOH_PROFILE "Google DoH" "8.8.8.8" "8.8.4.4" "2001:4860:4860::8888" "2001:4860:4860::8844" "https://dns.google/dns-query" "8.8.8.8"
if "%opt%"=="21" call :SET_DOH_PROFILE "NextDNS DoH" "45.90.28.234" "45.90.30.234" "2a07:a8c0::" "2a07:a8c1::" "https://dns.nextdns.io" "45.90.28.234"
if "%opt%"=="22" call :SET_DOH_PROFILE "Mullvad AdBlock" "194.242.2.3" "194.242.2.4" "2a07:e880::3" "2a07:e880::4" "https://adblock.dns.mullvad.net/dns-query" "194.242.2.3"
if "%opt%"=="23" call :SET_DOH_PROFILE "Mullvad Standard" "194.242.2.3" "194.242.2.4" "2a07:e880::3" "2a07:e880::4" "https://dns.mullvad.net/dns-query" "194.242.2.3"
if "%opt%"=="24" call :SET_DOH_PROFILE "Control D DoH" "76.76.2.0" "76.76.10.0" "2606:1a40::" "2606:1a40:1::" "https://freedns.controld.com/p2" "76.76.2.0"
if "%opt%"=="25" call :SET_DOH_PROFILE "Control D Family" "76.76.2.0" "76.76.10.0" "2606:1a40::" "2606:1a40:1::" "https://freedns.controld.com/family" "76.76.2.0"
if "%opt%"=="26" call :SET_DOH_PROFILE "OpenDNS DoH" "208.67.222.222" "208.67.220.220" "2620:119:35::35" "2620:119:53::53" "https://doh.opendns.com/dns-query" "208.67.222.222"
if "%opt%"=="27" call :SET_DOH_PROFILE "OpenDNS Family DoH" "208.67.222.123" "208.67.220.123" "2620:119:35::123" "2620:119:53::123" "https://doh.familyshield.opendns.com/dns-query" "208.67.222.123"
if "%opt%"=="28" call :SET_DOH_PROFILE "CleanBrowsing Security" "185.228.168.9" "185.228.169.9" "2a0d:2a00:1::2" "2a0d:2a00:2::2" "https://doh.cleanbrowsing.org/doh/security-filter/" "185.228.168.9"
if "%opt%"=="29" call :SET_DOH_PROFILE "CleanBrowsing Adult" "185.228.168.10" "185.228.169.11" "2a0d:2a00:1::1" "2a0d:2a00:2::1" "https://doh.cleanbrowsing.org/doh/adult-filter/" "185.228.168.10"
if "%opt%"=="30" call :SET_DOH_PROFILE "RethinkDNS" "116.202.176.26" "" "" "" "https://max.rethinkdns.com/dns-query" "116.202.176.26"
if "%opt%"=="31" call :SET_DOH_PROFILE "DNS0.eu Zero" "193.110.81.0" "185.253.5.0" "2a0f:6b80::" "2a0f:6b80:1::" "https://zero.dns0.eu" "193.110.81.0"
if "%opt%"=="32" call :SET_DOH_PROFILE "DNS0.eu Kids" "193.110.81.1" "185.253.5.1" "2a0f:6b80:0:0:0:0:0:1" "2a0f:6b80:1:0:0:0:0:1" "https://kids.dns0.eu" "193.110.81.1"
if "%opt%"=="33" goto CHECK_CURRENT_DNS
if "%opt%"=="34" goto CHECK_PUBLIC_IP
if "%opt%"=="36" goto PING_TEST_DNS
if "%opt%"=="37" goto CLEAR_DOH_SETTINGS
if "%opt%"=="39" goto SELECT_INTERFACE
if "%opt%"=="40" goto SET_DOT_CLOUDFLARE
if "%opt%"=="41" call :SET_DNS_PROFILE "Nawala Trust+Positif" "180.131.144.144" "180.131.145.145" "" ""
if "%opt%"=="42" call :SET_DNS_PROFILE "AdGuard Indonesia" "94.140.14.14" "94.140.15.15" "" ""
if "%opt%"=="43" call :SET_DNS_PROFILE "DNSku CleanDNS" "103.87.68.10" "103.87.69.10" "" ""
if "%opt%"=="44" call :SET_DNS_PROFILE "NextDNS Jakarta" "45.90.28.0" "45.90.30.0" "" ""
if "%opt%"=="45" call :SET_DNS_PROFILE "Control D Jakarta" "76.76.2.2" "76.76.10.2" "" ""
if "%opt%"=="46" call :SET_DNS_PROFILE "Alternate DNS" "76.76.19.19" "76.66.2.2" "" ""
if "%opt%"=="47" call :SET_DNS_PROFILE "RethinkDNS" "108.137.89.8" "108.137.89.9" "" ""
if "%opt%"=="48" call :SET_DNS_PROFILE "BlahDNS Asia" "139.99.117.202" "45.32.215.89" "" ""
if "%opt%"=="49" call :SET_DNS_PROFILE "AhaDNS Blitz" "5.2.75.148" "45.153.229.182" "" ""
if "%opt%"=="50" call :SET_DNS_PROFILE "Cloudflare Malware" "1.1.1.2" "1.0.0.2" "" ""
if "%opt%"=="51" call :SET_DNS_PROFILE "Cloudflare Full Protection" "1.1.1.3" "1.0.0.3" "" ""
if "%opt%"=="52" call :SET_DNS_PROFILE "DNS.SB" "185.222.222.222" "185.228.168.168" "" ""
if "%opt%"=="53" call :SET_DNS_PROFILE "DNSForge.de" "176.9.93.198" "176.9.1.117" "" ""
if "%opt%"=="54" call :SET_DOH_PROFILE "AdGuard DoH" "94.140.14.14" "94.140.15.15" "" "" "https://dns.adguard-dns.com/dns-query" "94.140.14.14"
if "%opt%"=="55" call :SET_DOH_PROFILE "Control D DoH" "76.76.2.2" "76.76.10.2" "" "" "https://freedns.controld.com/p2" "76.76.2.2"
if "%opt%"=="56" call :SET_DOH_PROFILE "RethinkDNS DoH" "108.137.89.8" "108.137.89.9" "" "" "https://max.rethinkdns.com/1:IAAgACAA" "108.137.89.8"
if "%opt%"=="57" call :SET_DOH_PROFILE "BlahDNS DoH" "139.99.117.202" "45.32.215.89" "" "" "https://doh-sg.blahdns.com/dns-query" "139.99.117.202"
if "%opt%"=="58" call :SET_DOH_PROFILE "Cloudflare Security DoH" "1.1.1.2" "1.0.0.2" "" "" "https://security.cloudflare-dns.com/dns-query" "1.1.1.2"
if "%opt%"=="59" call :SET_DOH_PROFILE "DNS.SB DoH" "185.222.222.222" "185.228.168.168" "" "" "https://doh.dns.sb/dns-query" "185.222.222.222"
if "%opt%"=="60" call :SET_DOH_PROFILE "DNSForge DoH" "176.9.93.198" "176.9.1.117" "" "" "https://dnsforge.de/dns-query" "176.9.93.198"
if /i "%opt%"=="R" goto RESET_DNS
if /i "%opt%"=="F" goto FLUSH_DNS
if "%opt%"=="0" goto MAIN_MENU
goto DNS_MENU

:ALL_INTERFACE_DISPATCH
if "%opt%"=="0" goto MAIN_MENU
if /i "%opt%"=="R" goto RESET_DNS_ALL
if /i "%opt%"=="F" goto FLUSH_DNS
if "%opt%"=="1" call :SET_DNS_PROFILE "AdGuard" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff"
if "%opt%"=="2" call :SET_DNS_PROFILE "Cloudflare" "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001"
if "%opt%"=="3" call :SET_DNS_PROFILE "Quad9" "9.9.9.9" "149.112.112.112" "2620:fe::fe" "2620:fe::9"
if "%opt%"=="4" call :SET_DNS_PROFILE "Google" "8.8.8.8" "8.8.4.4" "2001:4860:4860::8888" "2001:4860:4860::8844"
if "%opt%"=="5" call :SET_DNS_PROFILE "Control D" "76.76.2.0" "76.76.10.0" "2606:1a40::" "2606:1a40:1::"
if "%opt%"=="6" call :SET_DNS_PROFILE "Mullvad" "194.242.2.3" "194.242.2.4" "2a07:e880::3" "2a07:e880::4"
if "%opt%"=="7" call :SET_DNS_PROFILE "OpenDNS" "208.67.222.222" "208.67.220.220" "2620:119:35::35" "2620:119:53::53"
if "%opt%"=="8" call :SET_DNS_PROFILE "CleanBrowsing" "185.228.168.9" "185.228.169.9" "2a0d:2a00:1::2" "2a0d:2a00:2::2"
if "%opt%"=="9" call :SET_DNS_PROFILE "dns0.eu" "193.110.81.0" "185.253.5.0" "2a0f:6b80::" "2a0f:6b80:1::"
if "%opt%"=="10" call :SET_DNS_PROFILE "NextDNS" "45.90.28.234" "45.90.30.234" "2a07:a8c0::" "2a07:a8c1::"
if "%opt%"=="11" call :SET_DNS_PROFILE "AhaDNS" "5.2.78.36" "45.132.74.167" "" ""
if "%opt%"=="12" call :SET_DNS_PROFILE "OpenDNS FamilyShield" "208.67.222.123" "208.67.220.123" "2620:119:35::123" "2620:119:53::123"
if "%opt%"=="13" call :SET_DNS_PROFILE "Comodo" "8.26.56.26" "8.20.247.20" "" ""
if "%opt%"=="14" call :SET_DOH_PROFILE "AdGuard Personal" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://8faa9ffc.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="15" call :SET_DOH_PROFILE "AdGuard Rumah" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://64c71a5e.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="16" call :SET_DOH_PROFILE "AdGuard Hunting" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://bae7b182.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="17" call :SET_DOH_PROFILE "AdGuard Poco" "94.140.14.49" "94.140.14.59" "2a10:50c0:0:0:0:0:ded:ff" "2a10:50c0:0:0:0:0:dad:ff" "https://791115cd.d.adguard-dns.com/dns-query" "94.140.14.49"
if "%opt%"=="18" call :SET_DOH_PROFILE "Cloudflare DoH" "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001" "https://cloudflare-dns.com/dns-query" "1.1.1.1"
if "%opt%"=="19" call :SET_DOH_PROFILE "Quad9 DoH" "9.9.9.9" "149.112.112.112" "2620:fe::fe" "2620:fe::9" "https://dns.quad9.net/dns-query" "9.9.9.9"
if "%opt%"=="20" call :SET_DOH_PROFILE "Google DoH" "8.8.8.8" "8.8.4.4" "2001:4860:4860::8888" "2001:4860:4860::8844" "https://dns.google/dns-query" "8.8.8.8"
if "%opt%"=="21" call :SET_DOH_PROFILE "NextDNS DoH" "45.90.28.234" "45.90.30.234" "2a07:a8c0::" "2a07:a8c1::" "https://dns.nextdns.io" "45.90.28.234"
if "%opt%"=="22" call :SET_DOH_PROFILE "Mullvad AdBlock" "194.242.2.3" "194.242.2.4" "2a07:e880::3" "2a07:e880::4" "https://adblock.dns.mullvad.net/dns-query" "194.242.2.3"
if "%opt%"=="23" call :SET_DOH_PROFILE "Mullvad Standard" "194.242.2.3" "194.242.2.4" "2a07:e880::3" "2a07:e880::4" "https://dns.mullvad.net/dns-query" "194.242.2.3"
if "%opt%"=="24" call :SET_DOH_PROFILE "Control D DoH" "76.76.2.0" "76.76.10.0" "2606:1a40::" "2606:1a40:1::" "https://freedns.controld.com/p2" "76.76.2.0"
if "%opt%"=="25" call :SET_DOH_PROFILE "Control D Family" "76.76.2.0" "76.76.10.0" "2606:1a40::" "2606:1a40:1::" "https://freedns.controld.com/family" "76.76.2.0"
if "%opt%"=="26" call :SET_DOH_PROFILE "OpenDNS DoH" "208.67.222.222" "208.67.220.220" "2620:119:35::35" "2620:119:53::53" "https://doh.opendns.com/dns-query" "208.67.222.222"
if "%opt%"=="27" call :SET_DOH_PROFILE "OpenDNS Family DoH" "208.67.222.123" "208.67.220.123" "2620:119:35::123" "2620:119:53::123" "https://doh.familyshield.opendns.com/dns-query" "208.67.222.123"
if "%opt%"=="28" call :SET_DOH_PROFILE "CleanBrowsing Security" "185.228.168.9" "185.228.169.9" "2a0d:2a00:1::2" "2a0d:2a00:2::2" "https://doh.cleanbrowsing.org/doh/security-filter/" "185.228.168.9"
if "%opt%"=="29" call :SET_DOH_PROFILE "CleanBrowsing Adult" "185.228.168.10" "185.228.169.11" "2a0d:2a00:1::1" "2a0d:2a00:2::1" "https://doh.cleanbrowsing.org/doh/adult-filter/" "185.228.168.10"
if "%opt%"=="30" call :SET_DOH_PROFILE "RethinkDNS" "116.202.176.26" "" "" "" "https://max.rethinkdns.com/dns-query" "116.202.176.26"
if "%opt%"=="31" call :SET_DOH_PROFILE "DNS0.eu Zero" "193.110.81.0" "185.253.5.0" "2a0f:6b80::" "2a0f:6b80:1::" "https://zero.dns0.eu" "193.110.81.0"
if "%opt%"=="32" call :SET_DOH_PROFILE "DNS0.eu Kids" "193.110.81.1" "185.253.5.1" "2a0f:6b80:0:0:0:0:0:1" "2a0f:6b80:1:0:0:0:0:1" "https://kids.dns0.eu" "193.110.81.1"
if "%opt%"=="41" call :SET_DNS_PROFILE "Nawala Trust+Positif" "180.131.144.144" "180.131.145.145" "" ""
if "%opt%"=="42" call :SET_DNS_PROFILE "AdGuard Indonesia" "94.140.14.14" "94.140.15.15" "" ""
if "%opt%"=="43" call :SET_DNS_PROFILE "DNSku CleanDNS" "103.87.68.10" "103.87.69.10" "" ""
if "%opt%"=="44" call :SET_DNS_PROFILE "NextDNS Jakarta" "45.90.28.0" "45.90.30.0" "" ""
if "%opt%"=="45" call :SET_DNS_PROFILE "Control D Jakarta" "76.76.2.2" "76.76.10.2" "" ""
if "%opt%"=="46" call :SET_DNS_PROFILE "Alternate DNS" "76.76.19.19" "76.66.2.2" "" ""
if "%opt%"=="47" call :SET_DNS_PROFILE "RethinkDNS" "108.137.89.8" "108.137.89.9" "" ""
if "%opt%"=="48" call :SET_DNS_PROFILE "BlahDNS Asia" "139.99.117.202" "45.32.215.89" "" ""
if "%opt%"=="49" call :SET_DNS_PROFILE "AhaDNS Blitz" "5.2.75.148" "45.153.229.182" "" ""
if "%opt%"=="50" call :SET_DNS_PROFILE "Cloudflare Malware" "1.1.1.2" "1.0.0.2" "" ""
if "%opt%"=="51" call :SET_DNS_PROFILE "Cloudflare Full Protection" "1.1.1.3" "1.0.0.3" "" ""
if "%opt%"=="52" call :SET_DNS_PROFILE "DNS.SB" "185.222.222.222" "185.228.168.168" "" ""
if "%opt%"=="53" call :SET_DNS_PROFILE "DNSForge.de" "176.9.93.198" "176.9.1.117" "" ""
if "%opt%"=="54" call :SET_DOH_PROFILE "AdGuard DoH" "94.140.14.14" "94.140.15.15" "" "" "https://dns.adguard-dns.com/dns-query" "94.140.14.14"
if "%opt%"=="55" call :SET_DOH_PROFILE "Control D DoH" "76.76.2.2" "76.76.10.2" "" "" "https://freedns.controld.com/p2" "76.76.2.2"
if "%opt%"=="56" call :SET_DOH_PROFILE "RethinkDNS DoH" "108.137.89.8" "108.137.89.9" "" "" "https://max.rethinkdns.com/1:IAAgACAA" "108.137.89.8"
if "%opt%"=="57" call :SET_DOH_PROFILE "BlahDNS DoH" "139.99.117.202" "45.32.215.89" "" "" "https://doh-sg.blahdns.com/dns-query" "139.99.117.202"
if "%opt%"=="58" call :SET_DOH_PROFILE "Cloudflare Security DoH" "1.1.1.2" "1.0.0.2" "" "" "https://security.cloudflare-dns.com/dns-query" "1.1.1.2"
if "%opt%"=="59" call :SET_DOH_PROFILE "DNS.SB DoH" "185.222.222.222" "185.228.168.168" "" "" "https://doh.dns.sb/dns-query" "185.222.222.222"
if "%opt%"=="60" call :SET_DOH_PROFILE "DNSForge DoH" "176.9.93.198" "176.9.1.117" "" "" "https://dnsforge.de/dns-query" "176.9.93.198"
if "%opt%"=="40" goto SET_DOT_CLOUDFLARE
goto DNS_MENU

:SET_DNS_PROFILE
call :GET_INTERFACE
if not defined IFACE (
    echo.
    echo [ERROR] Tidak ada interface jaringan aktif.
    pause
    goto :eof
)
if /i "!IFACE!"=="__ALL__" (
    echo.
    echo Mengatur DNS %~1 ke semua adaptor aktif...
    for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do call :APPLY_DNS_INTERFACE "%%d" "%~2" "%~3" "%~4" "%~5"
    ipconfig /flushdns >nul
    echo Selesai! DNS %~1 berhasil diterapkan ke semua adaptor aktif.
    pause
    goto DNS_MENU
)
echo.
echo Mengatur DNS %~1 ke adaptor: !IFACE!...
netsh interface ipv4 set dns name="!IFACE!" static %~2 primary >nul 2>&1
if errorlevel 1 goto DNS_PROFILE_ERROR
if not "%~3"=="" (
    netsh interface ipv4 add dns name="!IFACE!" %~3 index=2 >nul 2>&1
    if errorlevel 1 goto DNS_PROFILE_ERROR
)
if not "%~4"=="" (
    netsh interface ipv6 set dns name="!IFACE!" static %~4 primary >nul 2>&1
    if errorlevel 1 goto DNS_PROFILE_ERROR
    if not "%~5"=="" (
        netsh interface ipv6 add dns name="!IFACE!" %~5 index=2 >nul 2>&1
        if errorlevel 1 goto DNS_PROFILE_ERROR
    )
) else (
    netsh interface ipv6 set dns name="!IFACE!" dhcp >nul 2>&1
)
ipconfig /flushdns >nul
echo Selesai! DNS %~1 berhasil diterapkan.
pause
goto DNS_MENU

:SET_DOH_PROFILE
call :GET_INTERFACE
if not defined IFACE (
    echo.
    echo [ERROR] Tidak ada interface jaringan aktif.
    pause
    goto :eof
)
if /i "!IFACE!"=="__ALL__" (
    call :RESET_DOH_SILENT
    echo.
    echo Mengatur DoH %~1 ke semua adaptor aktif...
    for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do call :APPLY_DOH_INTERFACE "%%d" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7"
    ipconfig /flushdns >nul
    echo Selesai! DoH %~1 berhasil diterapkan ke semua adaptor aktif.
    pause
    goto DNS_MENU
)
call :RESET_DOH_SILENT
echo.
echo Mengatur DoH %~1 ke adaptor: !IFACE!...
netsh interface ipv4 set dns name="!IFACE!" static %~2 primary >nul 2>&1
if errorlevel 1 goto DNS_PROFILE_ERROR
if not "%~3"=="" (
    netsh interface ipv4 add dns name="!IFACE!" %~3 index=2 >nul 2>&1
    if errorlevel 1 goto DNS_PROFILE_ERROR
)
if not "%~4"=="" (
    netsh interface ipv6 set dns name="!IFACE!" static %~4 primary >nul 2>&1
    if errorlevel 1 goto DNS_PROFILE_ERROR
    if not "%~5"=="" (
        netsh interface ipv6 add dns name="!IFACE!" %~5 index=2 >nul 2>&1
        if errorlevel 1 goto DNS_PROFILE_ERROR
    )
) else (
    netsh interface ipv6 set dns name="!IFACE!" dhcp >nul 2>&1
)
powershell -NoProfile -Command "Add-DnsClientDohServerAddress -ServerAddress '%~7' -DohTemplate '%~6' -AllowFallbackToUdp $false -AutoUpgrade $true" >nul 2>&1
ipconfig /flushdns >nul
echo Selesai! DoH %~1 berhasil diterapkan.
pause
goto DNS_MENU

:DNS_PROFILE_ERROR
echo.
echo [ERROR] Windows gagal menerapkan DNS %~1 pada adaptor: !IFACE!
echo Pastikan adaptor aktif dan jalankan toolkit sebagai Administrator.
pause
goto DNS_MENU

:APPLY_DNS_INTERFACE
netsh interface ipv4 set dns name="%~1" static %~2 primary >nul 2>&1
if not "%~3"=="" netsh interface ipv4 add dns name="%~1" %~3 index=2 >nul 2>&1
if not "%~4"=="" (
    netsh interface ipv6 set dns name="%~1" static %~4 primary >nul 2>&1
    if not "%~5"=="" netsh interface ipv6 add dns name="%~1" %~5 index=2 >nul 2>&1
) else (
    netsh interface ipv6 set dns name="%~1" dhcp >nul 2>&1
)
goto :eof

:APPLY_DOH_INTERFACE
netsh interface ipv4 set dns name="%~1" static %~2 primary >nul 2>&1
if not "%~3"=="" netsh interface ipv4 add dns name="%~1" %~3 index=2 >nul 2>&1
if not "%~4"=="" (
    netsh interface ipv6 set dns name="%~1" static %~4 primary >nul 2>&1
    if not "%~5"=="" netsh interface ipv6 add dns name="%~1" %~5 index=2 >nul 2>&1
) else (
    netsh interface ipv6 set dns name="%~1" dhcp >nul 2>&1
)
powershell -NoProfile -Command "Add-DnsClientDohServerAddress -ServerAddress '%~7' -DohTemplate '%~6' -AllowFallbackToUdp $false -AutoUpgrade $true" >nul 2>&1
goto :eof

:RESET_DNS_ALL
echo.
echo Mengembalikan DNS ke DHCP untuk semua adaptor aktif...
for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do (
    netsh interface ipv4 set dns name="%%d" dhcp >nul 2>&1
    netsh interface ipv4 set dnsservers name="%%d" source=dhcp >nul 2>&1
    netsh interface ipv6 set dns name="%%d" dhcp >nul 2>&1
)
powershell -NoProfile -Command "Remove-DnsClientDohServerAddress -AllServers -ErrorAction SilentlyContinue" >nul 2>&1
ipconfig /flushdns >nul
echo Selesai! DNS semua adaptor aktif dikembalikan ke DHCP.
pause
goto DNS_MENU

:RESET_DOH_SILENT
powershell -NoProfile -Command "Remove-DnsClientDohServerAddress -AllServers -ErrorAction SilentlyContinue" >nul 2>&1
goto :eof

:GET_INTERFACE
set "IFACE="
if defined SELECTED_ALL (
    set "IFACE=__ALL__"
    goto :eof
)
if defined SELECTED_IFACE (
    set "IFACE=!SELECTED_IFACE!"
    goto :eof
)
for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do (
    if not defined IFACE set "IFACE=%%d"
)
goto :eof

:RESET_DNS
call :GET_INTERFACE
if not defined IFACE (
    echo.
    echo Tidak ada interface jaringan yang aktif (terhubung).
    echo Tidak dapat mereset DNS.
    echo.
    pause
    goto DNS_MENU
)

echo.
echo Mengembalikan DNS (IPv4, IPv6, DoH) ke Otomatis (DHCP) untuk: !IFACE!...
netsh interface ipv4 set dns name="!IFACE!" dhcp >nul 2>&1
netsh interface ipv4 set dnsservers name="!IFACE!" source=dhcp >nul 2>&1
netsh interface ipv6 set dns name="!IFACE!" dhcp >nul 2>&1
powershell -Command "Remove-DnsClientDohServerAddress -InterfaceAlias '!IFACE!' -ResetServerAddresses -ErrorAction SilentlyContinue" >nul 2>&1
ipconfig /flushdns >nul
echo Selesai! Semua konfigurasi DNS telah dikembalikan ke DHCP (Otomatis).
pause
goto DNS_MENU

:FLUSH_DNS
echo.
echo Membersihkan cache DNS...
ipconfig /flushdns
echo.
echo Cache DNS berhasil dibersihkan!
pause
goto DNS_MENU

:SELECT_INTERFACE
cls
echo ===================================================
echo              PILIH ADAPTOR JARINGAN
echo ===================================================
echo.
set "adapter_count=0"
for /f "skip=3 tokens=4*" %%a in ('netsh interface show interface') do (
    set /a adapter_count+=1
    if "%%b"=="" (
        set "adapter_!adapter_count!=%%a"
        echo  [!adapter_count!] %%a
    ) else (
        set "adapter_!adapter_count!=%%a %%b"
        echo  [!adapter_count!] %%a %%b
    )
)
echo.
echo  [A] Kembali ke deteksi otomatis
echo  [S] Pilih semua adaptor aktif
echo  [0] Kembali ke menu DNS
set "adapter_choice="
set /p "adapter_choice=Pilih adaptor: "
if /i "!adapter_choice!"=="A" (
    set "SELECTED_ALL="
    set "SELECTED_IFACE="
    goto DNS_MENU
)
if /i "!adapter_choice!"=="S" (
    set "SELECTED_ALL=1"
    set "SELECTED_IFACE="
    goto DNS_MENU
)
if "!adapter_choice!"=="0" goto DNS_MENU
if not defined adapter_choice goto SELECT_INTERFACE
set /a adapter_index=adapter_choice 2>nul
if !adapter_index! LSS 1 goto SELECT_INTERFACE
if !adapter_index! GTR !adapter_count! goto SELECT_INTERFACE
for %%a in (!adapter_index!) do set "SELECTED_IFACE=!adapter_%%a!"
goto DNS_MENU

:CHECK_CURRENT_DNS
call :GET_INTERFACE
if not defined IFACE goto DNS_MENU
if /i "!IFACE!"=="__ALL__" (
    cls
    echo ===================================================
    echo       DNS AKTIF - SEMUA ADAPTOR TERHUBUNG
    echo ===================================================
    for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do call :CHECK_DNS_INTERFACE "%%d"
    echo.
    echo Pengujian resolusi umum:
    nslookup google.com
    pause
    goto DNS_MENU
)
call :CHECK_DNS_INTERFACE "!IFACE!"
pause
goto DNS_MENU

:CHECK_DNS_INTERFACE
echo.
echo ===================================================
echo       DNS AKTIF: %~1
echo ===================================================
echo [IPv4]
powershell -NoProfile -Command "Get-DnsClientServerAddress -InterfaceAlias '%~1' -AddressFamily IPv4 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty ServerAddresses"
echo.
echo [IPv6]
powershell -NoProfile -Command "Get-DnsClientServerAddress -InterfaceAlias '%~1' -AddressFamily IPv6 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty ServerAddresses"
echo.
echo [DoH/DoT]
powershell -NoProfile -Command "if (-not (Get-Command Get-DnsClientDohServerAddress -ErrorAction SilentlyContinue)) { Write-Host 'Status DoH/DoT tidak tersedia pada Windows/PowerShell ini.' } else { $servers = (Get-DnsClientServerAddress -InterfaceAlias '%~1' -ErrorAction SilentlyContinue).ServerAddresses; $doh = Get-DnsClientDohServerAddress | Where-Object { $_.ServerAddress -in $servers }; if ($doh) { $doh | Format-Table ServerAddress,AutoUpgrade,DohTemplate,DnsOverTls -AutoSize } else { Write-Host 'Tidak ada template DoH/DoT aktif.' } }"
echo.
goto :eof

:CHECK_PUBLIC_IP
echo.
echo ===================================================
echo                 CEK IP PUBLIK
echo ===================================================
powershell -NoProfile -Command "try { (Invoke-RestMethod -Uri 'https://ipinfo.io/ip' -TimeoutSec 10).Trim() } catch { Write-Host 'Gagal mengambil IP publik.' }"
pause
goto DNS_MENU

:: Benchmark DNS lama dihapus; gunakan opsi utama [21] Speedtest.
powershell -NoProfile -Command "if (-not (Get-Command Resolve-DnsName -ErrorAction SilentlyContinue)) { Write-Host 'Resolve-DnsName tidak tersedia pada PowerShell ini.' } else { $list = @(@{N='AdGuard';IP='94.140.14.14';T='DNS'},@{N='Cloudflare';IP='1.1.1.1';T='DNS'},@{N='Quad9';IP='9.9.9.9';T='DNS'},@{N='Google';IP='8.8.8.8';T='DNS'},@{N='Control D';IP='76.76.2.0';T='DNS'},@{N='Mullvad';IP='194.242.2.3';T='DNS'},@{N='OpenDNS';IP='208.67.222.222';T='DNS'},@{N='CleanBrowsing';IP='185.228.168.9';T='DNS'},@{N='DNS0.eu';IP='193.110.81.0';T='DNS'},@{N='NextDNS';IP='45.90.28.234';T='DNS'},@{N='AhaDNS';IP='5.2.78.36';T='DNS'},@{N='OpenDNS Family';IP='208.67.222.123';T='DNS'},@{N='Comodo';IP='8.26.56.26';T='DNS'},@{N='AdGuard Personal';IP='94.140.14.49';T='DoH'},@{N='AdGuard Rumah';IP='94.140.14.49';T='DoH'},@{N='AdGuard Hunting';IP='94.140.14.49';T='DoH'},@{N='AdGuard Poco';IP='94.140.14.49';T='DoH'},@{N='Cloudflare DoH';IP='1.1.1.1';T='DoH'},@{N='Quad9 DoH';IP='9.9.9.9';T='DoH'},@{N='Google DoH';IP='8.8.8.8';T='DoH'},@{N='NextDNS DoH';IP='45.90.28.234';T='DoH'},@{N='Mullvad AdBlock';IP='194.242.2.3';T='DoH'},@{N='Mullvad Standard';IP='194.242.2.3';T='DoH'},@{N='Control D DoH';IP='76.76.2.0';T='DoH'},@{N='Control D Family';IP='76.76.2.0';T='DoH'},@{N='OpenDNS DoH';IP='208.67.222.222';T='DoH'},@{N='OpenDNS Family DoH';IP='208.67.222.123';T='DoH'},@{N='CleanBrowsing Security';IP='185.228.168.9';T='DoH'},@{N='CleanBrowsing Adult';IP='185.228.168.10';T='DoH'},@{N='RethinkDNS';IP='116.202.176.26';T='DoH'},@{N='DNS0.eu Zero';IP='193.110.81.0';T='DoH'},@{N='DNS0.eu Kids';IP='193.110.81.1';T='DoH'},@{N='Nawala';IP='180.131.144.144';T='DNS'},@{N='AdGuard Indonesia';IP='94.140.14.14';T='DNS'},@{N='DNSku CleanDNS';IP='103.87.68.10';T='DNS'},@{N='NextDNS Jakarta';IP='45.90.28.0';T='DNS'},@{N='Control D Jakarta';IP='76.76.2.2';T='DNS'},@{N='Alternate DNS';IP='76.76.19.19';T='DNS'},@{N='RethinkDNS ID';IP='108.137.89.8';T='DNS'},@{N='BlahDNS Asia';IP='139.99.117.202';T='DNS'},@{N='AhaDNS Blitz';IP='5.2.75.148';T='DNS'},@{N='Cloudflare Malware';IP='1.1.1.2';T='DNS'},@{N='Cloudflare Protection';IP='1.1.1.3';T='DNS'},@{N='DNS.SB';IP='185.222.222.222';T='DNS'},@{N='DNSForge.de';IP='176.9.93.198';T='DNS'},@{N='AdGuard DoH';IP='94.140.14.14';T='DoH'},@{N='Control D DoH 2';IP='76.76.2.2';T='DoH'},@{N='RethinkDNS DoH';IP='108.137.89.8';T='DoH'},@{N='BlahDNS DoH';IP='139.99.117.202';T='DoH'},@{N='Cloudflare Security DoH';IP='1.1.1.2';T='DoH'},@{N='DNS.SB DoH';IP='185.222.222.222';T='DoH'},@{N='DNSForge DoH';IP='176.9.93.198';T='DoH'}); $domains = @('google.com','microsoft.com','kemenhub.go.id'); $bestName = ''; $bestMs = [double]::PositiveInfinity; $successCount = 0; foreach ($item in $list) { $times = @(); foreach ($domain in $domains) { try { $sw = [Diagnostics.Stopwatch]::StartNew(); $null = Resolve-DnsName $domain -Server $item.IP -Type A -DnsOnly -NoHostsFile -QuickTimeout -ErrorAction Stop; $sw.Stop(); $times += $sw.Elapsed.TotalMilliseconds } catch {} }; if ($times.Count -eq 0) { Write-Host ('{0,-25} {1,-16} {2,-4} timeout' -f $item.N,$item.IP,$item.T) } else { $successCount++; $total = 0; foreach ($time in $times) { $total += $time }; $average = [math]::Round($total / $times.Count); if ($average -lt 20) { $speed = 'Sangat cepat' } elseif ($average -lt 50) { $speed = 'Cepat' } elseif ($average -lt 100) { $speed = 'Normal' } elseif ($average -lt 200) { $speed = 'Lambat' } else { $speed = 'Sangat lambat' }; if ($average -lt $bestMs) { $bestMs = $average; $bestName = $item.N }; Write-Host ('{0,-25} {1,-16} {2,4} ms - {3} ({4})' -f $item.N,$item.IP,$average,$speed,$item.T) } }; Write-Host ''; Write-Host ('Berhasil diuji: {0}/{1} profil' -f $successCount,$list.Count); if ($bestName) { Write-Host ('Tercepat: ' + $bestName + ' (' + $bestMs + ' ms)') }; Write-Host 'Catatan: profil DoH diukur melalui resolver IP-nya, bukan jalur HTTPS terenkripsi.' }"
pause
goto DNS_MENU

echo Menguji profil DNS aktif (3 domain per profil)...
powershell -NoProfile -Command "if (-not (Get-Command Resolve-DnsName -ErrorAction SilentlyContinue)) { Write-Host 'Resolve-DnsName tidak tersedia pada PowerShell ini.' } else { $list = @(@{N='AdGuard';IP='94.140.14.14';T='DNS'},@{N='Cloudflare';IP='1.1.1.1';T='DNS'},@{N='Quad9';IP='9.9.9.9';T='DNS'},@{N='Google';IP='8.8.8.8';T='DNS'},@{N='Control D';IP='76.76.2.2';T='DNS'},@{N='Mullvad';IP='194.242.2.3';T='DNS'},@{N='OpenDNS';IP='208.67.222.222';T='DNS'},@{N='CleanBrowsing';IP='185.228.168.9';T='DNS'},@{N='DNS0.eu';IP='193.110.81.10';T='DNS'},@{N='NextDNS';IP='45.90.28.234';T='DNS'},@{N='AhaDNS';IP='5.2.78.36';T='DNS'},@{N='OpenDNS Family';IP='208.67.222.123';T='DNS'},@{N='Comodo';IP='8.26.56.26';T='DNS'},@{N='AdGuard Personal';U='https://8faa9ffc.d.adguard-dns.com/dns-query';T='DoH'},@{N='AdGuard Rumah';U='https://64c71a5e.d.adguard-dns.com/dns-query';T='DoH'},@{N='AdGuard Hunting';U='https://bae7b182.d.adguard-dns.com/dns-query';T='DoH'},@{N='AdGuard Poco';U='https://791115cd.d.adguard-dns.com/dns-query';T='DoH'},@{N='Cloudflare DoH';U='https://cloudflare-dns.com/dns-query';T='DoH'},@{N='Quad9 DoH';U='https://dns.quad9.net/dns-query';T='DoH'},@{N='Google DoH';U='https://dns.google/dns-query';T='DoH'},@{N='NextDNS DoH';U='https://dns.nextdns.io';T='DoH'},@{N='Mullvad AdBlock';U='https://adblock.dns.mullvad.net/dns-query';T='DoH'},@{N='Mullvad Standard';U='https://dns.mullvad.net/dns-query';T='DoH'},@{N='Control D DoH';U='https://freedns.controld.com/p2';T='DoH'},@{N='Control D Family';U='https://freedns.controld.com/family';T='DoH'},@{N='OpenDNS DoH';U='https://doh.opendns.com/dns-query';T='DoH'},@{N='OpenDNS Family DoH';U='https://doh.familyshield.opendns.com/dns-query';T='DoH'},@{N='CleanBrowsing Security';U='https://doh.cleanbrowsing.org/doh/security-filter/';T='DoH'},@{N='CleanBrowsing Adult';U='https://doh.cleanbrowsing.org/doh/adult-filter/';T='DoH'},@{N='RethinkDNS';U='https://max.rethinkdns.com/1:IAAgACAA';T='DoH'},@{N='DNS0.eu Zero';U='https://zero.dns0.eu';T='DoH'},@{N='DNS0.eu Kids';U='https://kids.dns0.eu';T='DoH'},@{N='AdGuard Indonesia';IP='94.140.14.14';T='DNS'},@{N='NextDNS Jakarta';IP='45.90.28.0';T='DNS'},@{N='Control D Jakarta';IP='76.76.2.2';T='DNS'},@{N='Alternate DNS';IP='76.76.19.19';T='DNS'},@{N='RethinkDNS ID';IP='108.137.89.8';T='DNS'},@{N='BlahDNS Asia';IP='139.99.117.202';T='DNS'},@{N='AhaDNS Blitz';IP='5.2.75.148';T='DNS'},@{N='Cloudflare Malware';IP='1.1.1.2';T='DNS'},@{N='Cloudflare Protection';IP='1.1.1.3';T='DNS'},@{N='DNS.SB';IP='185.222.222.222';T='DNS'},@{N='DNSForge.de';IP='176.9.93.198';T='DNS'},@{N='AdGuard DoH';U='https://dns.adguard-dns.com/dns-query';T='DoH'},@{N='Control D DoH Asia';U='https://freedns.controld.com/p2';T='DoH'},@{N='RethinkDNS DoH';U='https://max.rethinkdns.com/1:IAAgACAA';T='DoH'},@{N='BlahDNS DoH';U='https://doh-sg.blahdns.com/dns-query';T='DoH'},@{N='Cloudflare Security DoH';U='https://security.cloudflare-dns.com/dns-query';T='DoH'},@{N='DNS.SB DoH';U='https://doh.dns.sb/dns-query';T='DoH'},@{N='DNSForge DoH';U='https://dnsforge.de/dns-query';T='DoH'}); $domains = @('google.com','microsoft.com','kemenhub.go.id'); $bestName = ''; $bestMs = [double]::PositiveInfinity; $successCount = 0; foreach ($item in $list) { $times = @(); foreach ($domain in $domains) { try { $sw = [Diagnostics.Stopwatch]::StartNew(); if ($item.T -eq 'DNS') { $null = Resolve-DnsName $domain -Server $item.IP -Type A -DnsOnly -NoHostsFile -QuickTimeout -ErrorAction Stop } else { $response = Invoke-WebRequest -UseBasicParsing -Uri ($item.U + '?name=' + $domain + '&type=A') -Headers @{Accept='application/dns-json'} -TimeoutSec 5 -ErrorAction Stop; if ($response.StatusCode -ne 200) { throw 'HTTP error' } }; $sw.Stop(); $times += $sw.Elapsed.TotalMilliseconds } catch {} }; if ($times.Count -eq 0) { Write-Host ('{0,-25} {1,-4} timeout' -f $item.N,$item.T) } else { $successCount++; $total = 0; foreach ($time in $times) { $total += $time }; $average = [math]::Round($total / $times.Count); if ($average -lt 20) { $speed = 'Sangat cepat' } elseif ($average -lt 50) { $speed = 'Cepat' } elseif ($average -lt 100) { $speed = 'Normal' } elseif ($average -lt 200) { $speed = 'Lambat' } else { $speed = 'Sangat lambat' }; if ($average -lt $bestMs) { $bestMs = $average; $bestName = $item.N }; Write-Host ('{0,-25} {1,4} ms - {2} [{3}]' -f $item.N,$average,$speed,$item.T) } }; Write-Host ''; Write-Host ('Berhasil diuji: {0}/{1} profil' -f $successCount,$list.Count); if ($bestName) { Write-Host ('Tercepat: ' + $bestName + ' (' + $bestMs + ' ms)') }; Write-Host 'DoH diuji melalui URL HTTPS endpoint lengkap.' }"
pause
goto DNS_MENU

:PING_HOST
echo %~2
powershell -NoProfile -Command "$result = @(Test-Connection -ComputerName '%~1' -Count 2 -ErrorAction SilentlyContinue); if ($result.Count -eq 0) { Write-Host 'Status: gagal atau timeout' } else { $total = 0; foreach ($reply in $result) { $total += [int]$reply.ResponseTime }; $average = [math]::Round($total / $result.Count); if ($average -lt 20) { $speed = 'Sangat cepat' } elseif ($average -lt 50) { $speed = 'Cepat' } elseif ($average -lt 100) { $speed = 'Normal' } elseif ($average -lt 200) { $speed = 'Lambat' } else { $speed = 'Sangat lambat' }; Write-Host ('Rata-rata: ' + $average + ' ms (Kecepatan: ' + $speed + ')') }"
goto :eof

:TEST_TCP_PORT
echo %~3 (%~1:%~2):
powershell -NoProfile -Command "$target='%~1'; $port=%~2; $timer=[Diagnostics.Stopwatch]::StartNew(); $result=Test-NetConnection -ComputerName $target -Port $port -InformationLevel Detailed -WarningAction SilentlyContinue; $timer.Stop(); if ($result.TcpTestSucceeded) {$status='TERBUKA'} else {$status='TERTUTUP / GAGAL'}; Write-Host ('Status          : ' + $status); Write-Host ('Remote address  : ' + $result.RemoteAddress); Write-Host ('Remote port     : ' + $result.RemotePort); Write-Host ('Source address  : ' + $result.SourceAddress); Write-Host ('Waktu koneksi   : ' + $timer.ElapsedMilliseconds + ' ms'); if ($result.PingSucceeded) {Write-Host ('Ping host       : ' + $result.PingReplyDetails.RoundtripTime + ' ms')} else {Write-Host 'Ping host       : tidak tersedia'}"
goto :eof

:PING_TEST_DNS
echo.
echo ===================================================
echo                TES PING KONEKSI
echo ===================================================
echo --- DNS UTAMA ---
call :PING_HOST "94.140.14.49" "[1] AdGuard DNS (94.140.14.49)"
call :PING_HOST "1.1.1.1" "[2] Cloudflare DNS (1.1.1.1)"
call :PING_HOST "9.9.9.9" "[3] Quad9 DNS (9.9.9.9)"
call :PING_HOST "8.8.8.8" "[4] Google DNS (8.8.8.8)"
echo --- KONEKSI LOKAL ^& HOST ---
call :PING_HOST "ujiberkala-middle.kemenhub.go.id" "[5] Host Uji Berkala Kemenhub"
call :TEST_TCP_PORT "192.168.1.191" "5432" "[6] Database Lokal"
echo.
call :TEST_TCP_PORT "192.168.1.254" "5432" "[7] Database Lokal Dev"
echo.
call :PING_HOST "36.93.132.49" "[8] Local Cloud e-Reporting (36.93.132.49)"
call :PING_HOST "vta.dephub.go.id" "[9] Host VTA Dephub"
call :PING_HOST "ujitiperb.dephub.go.id" "[10] Host Uji Tipe RB Dephub"
call :PING_HOST "ujiberkala-core.kemenhub.go.id" "[11] Host Uji Berkala Core Kemenhub"
call :PING_HOST "kedaton.gresikkab.go.id" "[12] Host Kedaton Gresik Kab"
pause
goto DNS_MENU

:SET_DOT_CLOUDFLARE
call :GET_INTERFACE
if not defined IFACE goto DNS_MENU
if /i "!IFACE!"=="__ALL__" (
    echo.
    echo Mengatur Cloudflare DNS over TLS ke semua adaptor aktif...
    for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do call :APPLY_DOT_INTERFACE "%%d"
    ipconfig /flushdns >nul
    echo Selesai! Cloudflare DoT diterapkan ke semua adaptor aktif.
    pause
    goto DNS_MENU
)
echo.
echo Mengatur Cloudflare DNS over TLS ke adaptor: !IFACE!...
powershell -NoProfile -Command "Set-DnsClientServerAddress -InterfaceAlias '!IFACE!' -ServerAddresses ('1.1.1.1','1.0.0.1','2606:4700:4700::1111','2606:4700:4700::1001'); Add-DnsClientDohServerAddress -ServerAddress '1.1.1.1' -DohTemplate 'cloudflare-dns.com' -AllowFallbackToUdp $false -AutoUpgrade $true -DnsOverTls $true" >nul 2>&1
ipconfig /flushdns >nul
echo Selesai! Cloudflare DoT diterapkan.
pause
goto DNS_MENU

:APPLY_DOT_INTERFACE
powershell -NoProfile -Command "Set-DnsClientServerAddress -InterfaceAlias '%~1' -ServerAddresses ('1.1.1.1','1.0.0.1','2606:4700:4700::1111','2606:4700:4700::1001'); Add-DnsClientDohServerAddress -ServerAddress '1.1.1.1' -DohTemplate 'cloudflare-dns.com' -AllowFallbackToUdp $false -AutoUpgrade $true -DnsOverTls $true" >nul 2>&1
goto :eof

:CLEAR_DOH_SETTINGS
echo.
echo Menghapus semua template DoH/DoT...
powershell -NoProfile -Command "Remove-DnsClientDohServerAddress -AllServers -ErrorAction SilentlyContinue" >nul 2>&1
echo Selesai. Server DNS biasa tidak diubah.
pause
goto DNS_MENU





:: ==================================================================
:: == BAGIAN 2: MATIKAN UPDATE (dari Matikan_Windows_Update.bat)
:: ==================================================================

:RUN_DISABLE_UPDATE
cls
echo ===================================================
echo   MEMBERSIHKAN SAMPAH UPDATE ^& MEMATIKAN WINDOWS UPDATE
echo ===================================================
echo.

echo 1. Mematikan Service Windows Update ^& Task Scheduler...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop dosvc >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop msiserver >nul 2>&1
net stop waasmedicsvc >nul 2>&1
net stop usosvc >nul 2>&1

:: Jeda agar proses benar-benar berhenti dari file sistem
timeout /t 3 /nobreak >nul

schtasks /Change /TN "\Microsoft\Windows\InstallService\ScanForUpdates" /DISABLE >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /DISABLE >nul 2>&1

echo.
echo 2. Menghapus Folder Cache ^& Sampah Update Old...
if exist "C:\Windows\SoftwareDistribution.old" rd /s /q "C:\Windows\SoftwareDistribution.old" >nul 2>&1
if exist "C:\Windows\System32\catroot2.old" rd /s /q "C:\Windows\System32\catroot2.old" >nul 2>&1

ren "C:\Windows\SoftwareDistribution" "SoftwareDistribution.old" >nul 2>&1
if exist "C:\Windows\SoftwareDistribution.old" rd /s /q "C:\Windows\SoftwareDistribution.old" >nul 2>&1
if exist "C:\Windows\SoftwareDistribution" rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1

ren "C:\Windows\System32\catroot2" "catroot2.old" >nul 2>&1
if exist "C:\Windows\System32\catroot2.old" rd /s /q "C:\Windows\System32\catroot2.old" >nul 2>&1
if exist "C:\Windows\System32\catroot2" rd /s /q "C:\Windows\System32\catroot2" >nul 2>&1

echo.
echo ===================================================
echo  OPSI CLEANUP / SCAN IMAGE COMPONENT STORE (DISM)
echo ===================================================
echo  [1] Lakukan Scan ^& Cleanup Component Store (Proses Agak Lama)
echo  [2] Lewati Scan Image (Proses Cepat)
echo ===================================================
set "opt_dism="
set /p opt_dism="Pilih opsi (1/2 lalu tekan Enter): "

if "%opt_dism%"=="1" goto DO_DISM_MERGED
goto SKIP_DISM_MERGED

:DO_DISM_MERGED
echo.
echo 3. Memulai Scan ^& Cleaning Component Store (ResetBase)...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
goto CONTINUE_SCRIPT_MERGED

:SKIP_DISM_MERGED
echo.
echo 3. Langkah Scan Image dilewati.
goto CONTINUE_SCRIPT_MERGED

:CONTINUE_SCRIPT_MERGED
echo.
echo 4. Mematikan ^& Mengunci Service Windows Update...
sc config wuauserv start= disabled >nul 2>&1
sc config bits start= disabled >nul 2>&1
sc config waasmedicsvc start= disabled >nul 2>&1
sc config usosvc start= disabled >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\dosvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\waasmedicsvc" /v "Start" /t REG_DWORD /d 4 /f

echo.
echo 5. Mengunci Registry ^& Kebijakan Windows Update...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /t REG_DWORD /d 1 /f

echo.
echo 6. Sembunyikan ^& Matikan Meet Now...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f

echo.
echo ===================================================
echo  SELESAI! Sampah dibersihkan, Update ^& Meet Now Mati.
echo ===================================================
echo.
echo Kembali ke menu utama...
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 3: AKTIFKAN KEMBALI WINDOWS UPDATE
:: ==================================================================

:RUN_ENABLE_UPDATE
cls
echo ===================================================
echo         MENGAKTIFKAN KEMBALI WINDOWS UPDATE
echo ===================================================
echo.

echo 1. Mengaktifkan Service Windows Update...
sc config wuauserv start= auto >nul 2>&1
sc config bits start= auto >nul 2>&1
sc config dosvc start= auto >nul 2>&1
sc config waasmedicsvc start= auto >nul 2>&1
sc config usosvc start= auto >nul 2>&1

echo.
echo 2. Menjalankan Service Windows Update...
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
net start dosvc >nul 2>&1
net start waasmedicsvc >nul 2>&1
net start usosvc >nul 2>&1

echo.
echo 3. Mengembalikan Kebijakan Registry Windows Update...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /f >nul 2>&1

echo.
echo 4. Mengaktifkan kembali Task Scheduler Update...
schtasks /Change /TN "\Microsoft\Windows\InstallService\ScanForUpdates" /ENABLE >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /ENABLE >nul 2>&1

echo.
echo ===================================================
echo  SELESAI! Windows Update telah diaktifkan kembali.
echo ===================================================
echo.
echo Kembali ke menu utama...
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 4: BERSIHKAN FILE SAMPAH UMUM
:: ==================================================================

:RUN_CLEAN_WINDOWS
cls
echo ===================================================
echo            MEMBERSIHKAN CACHE ^& SAMPAH WINDOWS
echo ===================================================
echo.
echo Proses ini akan membersihkan berbagai file sementara, log,
echo cache, dan mengosongkan Recycle Bin.
echo.
echo PERINGATAN: Beberapa file mungkin tidak dapat dihapus jika
echo sedang digunakan oleh sistem. Ini normal.
echo.
pause
cls

echo.
echo 1. Membersihkan Temporary Files User (%%TEMP%%)...
del /q /f /s "%TEMP%\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do rmdir /s /q "%%x" >nul 2>&1

echo.
echo 2. Membersihkan Temporary Files Sistem (C:\Windows\Temp)...
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rmdir /s /q "%%x" >nul 2>&1

echo.
echo 3. Membersihkan Folder Prefetch dan Crash Dumps...
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
del /q /f /s "C:\Windows\Memory.dmp" >nul 2>&1
del /q /f /s "C:\Windows\Minidump\*" >nul 2>&1

echo.
echo 4. Membersihkan Windows Log Files...
del /q /f /s "C:\Windows\Logs\*" >nul 2>&1

echo.
echo 5. Membersihkan Recycle Bin...
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1

echo.
echo ===================================================
echo  SELESAI! Proses pembersihan telah dijalankan.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 9: RESTART WINDOWS EXPLORER
:: == BAGIAN 5: RESTART WINDOWS EXPLORER
:: ==================================================================

:RUN_RESTART_EXPLORER
cls
echo ===================================================
echo           RESTART WINDOWS EXPLORER
echo ===================================================
echo.
echo Proses ini akan menyegarkan Taskbar, Desktop, dan File Explorer.
echo.
echo Mematikan proses explorer.exe...
taskkill /f /im explorer.exe >nul 2>&1
echo.
echo Menjalankan kembali explorer.exe...
start explorer.exe
echo.
echo ===================================================
echo  SELESAI! Windows Explorer berhasil di-restart.
echo ===================================================
echo.
echo Kembali ke menu utama...
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 10: TUTUP PAKSA APLIKASI "NOT RESPONDING"
:: == BAGIAN 6: TUTUP PAKSA APLIKASI "NOT RESPONDING"
:: ==================================================================

:RUN_KILL_NOT_RESPONDING
cls
echo ===================================================
echo     TUTUP PAKSA APLIKASI "NOT RESPONDING"
echo ===================================================
echo.
echo Mencari dan menutup paksa semua aplikasi yang macet...
echo.
taskkill /F /FI "status eq NOT RESPONDING"
echo.
echo ===================================================
echo  SELESAI! Semua aplikasi yang tidak merespon telah ditutup.
echo ===================================================
echo.
echo Kembali ke menu utama...
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 11: BANGUN ULANG CACHE IKON & THUMBNAIL
:: == BAGIAN 7: BANGUN ULANG CACHE IKON & THUMBNAIL
:: ==================================================================

:RUN_REBUILD_CACHE
cls
echo ===================================================
echo      BANGUN ULANG CACHE IKON ^& THUMBNAIL
echo ===================================================
echo.
echo Proses ini akan menghapus database cache ikon dan thumbnail
echo yang mungkin rusak.
echo.
pause
echo.
echo 1. Menghentikan Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
echo.
echo 2. Menghapus file cache ikon...
del /a /f /q "%localappdata%\IconCache.db" >nul 2>&1
echo.
echo 3. Menghapus file cache thumbnail...
del /a /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
echo.
echo 4. Menjalankan kembali Windows Explorer...
start explorer.exe
echo.
echo ===================================================
echo  SELESAI! Cache telah dihapus dan Explorer di-restart.
echo  Beberapa ikon mungkin memerlukan restart komputer untuk tampil sempurna.
echo ===================================================
echo.
echo Kembali ke menu utama...
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 12: BERSIHKAN RIWAYAT CLIPBOARD
:: == BAGIAN 8: BERSIHKAN RIWAYAT CLIPBOARD
:: ==================================================================

:RUN_CLEAR_CLIPBOARD
cls
echo ===================================================
echo         BERSIHKAN RIWAYAT CLIPBOARD
echo ===================================================
echo.
echo Proses ini akan mengosongkan clipboard saat ini dan
echo menghapus riwayat clipboard (Win+V).
echo.
pause
echo.
echo 1. Mengosongkan clipboard saat ini...
echo off | clip >nul 2>&1
echo.
echo 2. Menghentikan layanan riwayat clipboard...
net stop "cbdhsvc" >nul 2>&1
echo.
echo 3. Menghapus file database riwayat clipboard...
if exist "%localappdata%\Microsoft\Windows\Clipboard\." (
    del /f /s /q "%localappdata%\Microsoft\Windows\Clipboard\*.*" >nul 2>&1
)
echo.
echo 4. Menjalankan kembali layanan riwayat clipboard...
net start "cbdhsvc" >nul 2>&1
echo.
echo ===================================================
echo  SELESAI! Riwayat clipboard telah dibersihkan.
echo ===================================================
echo.
echo Kembali ke menu utama...
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 9: RESET PRINT SPOOLER
:: ==================================================================

:RUN_RESET_SPOOLER
cls
echo ===================================================
echo           RESET PRINT SPOOLER
echo ===================================================
echo.
echo Proses ini akan menghentikan service printer, menghapus
echo antrean cetak yang macet, dan menyalakannya kembali.
echo.
pause
cls

echo 1. Menghentikan service Print Spooler...
net stop spooler
echo.
echo 2. Menghapus file antrean cetak yang korup...
del /F /S /Q %systemroot%\System32\spool\PRINTERS\*.* >nul 2>&1
echo.
echo 3. Menjalankan kembali service Print Spooler...
net start spooler
echo.
echo ===================================================
echo  SELESAI! Print Spooler berhasil di-reset.
echo  Coba cetak kembali dokumen Anda.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 10: UNHIDE FILE FLASHDISK
:: ==================================================================

:RUN_UNHIDE_FLASHDISK
cls
echo ===================================================
echo           UNHIDE FILE FLASHDISK
echo ===================================================
echo.
echo Fungsi ini akan mengembalikan file yang disembunyikan
echo oleh virus di flashdisk atau drive eksternal.
echo.
set "drive_letter="
set /p drive_letter="Masukkan huruf drive flashdisk (misal: E): "

if not defined drive_letter (
    echo.
    echo Huruf drive tidak boleh kosong.
    pause
    goto RUN_UNHIDE_FLASHDISK
)

if not exist "%drive_letter%:\" (
    echo.
    echo Drive %drive_letter%: tidak ditemukan. Pastikan flashdisk terpasang
    echo dan huruf drive sudah benar.
    pause
    goto RUN_UNHIDE_FLASHDISK
)

echo.
echo Memproses drive %drive_letter%:... Mohon tunggu...
attrib -h -r -s /s /d %drive_letter%:\*.*
echo.
echo ===================================================
echo  SELESAI! Proses unhide pada drive %drive_letter%: telah selesai.
echo  Silakan periksa kembali isi flashdisk Anda.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 11: FORCE SYNC JAM WINDOWS
:: ==================================================================

:RUN_SYNC_TIME
cls
echo ===================================================
echo           FORCE SYNC JAM WINDOWS
echo ===================================================
echo.
echo Proses ini akan memaksa sinkronisasi waktu PC Anda
echo dengan server waktu Microsoft untuk mengatasi error SSL.
echo.
pause
cls

echo 1. Mengkonfigurasi ulang service Windows Time...
w32tm /config /manualpeerlist:time.windows.com /syncfromflags:manual /reliable:yes /update >nul 2>&1
echo.
echo 2. Menghentikan service Windows Time (jika berjalan)...
net stop w32time >nul 2>&1
echo.
echo 3. Menjalankan kembali service Windows Time...
net start w32time >nul 2>&1
echo.
echo 4. Memaksa sinkronisasi waktu...
w32tm /resync /force
echo.
echo ===================================================
echo  SELESAI! Waktu Windows berhasil disinkronkan.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == BAGIAN 12: BERSIHKAN CACHE MICROSOFT OFFICE
:: ==================================================================

:RUN_CLEAN_OFFICE_CACHE
cls
echo ===================================================
echo      BERSIHKAN CACHE MICROSOFT OFFICE
echo ===================================================
echo.
echo Proses ini akan menutup aplikasi Office dan menghapus
echo cache yang bisa menyebabkan lag atau error.
echo.
echo PERINGATAN: Pastikan semua pekerjaan di Word, Excel,
echo PowerPoint, dll. sudah disimpan sebelum melanjutkan.
echo.
pause
cls

echo 1. Menutup paksa semua aplikasi Microsoft Office...
taskkill /f /im MSACCESS.EXE >nul 2>&1
taskkill /f /im EXCEL.EXE >nul 2>&1
taskkill /f /im WINWORD.EXE >nul 2>&1
taskkill /f /im POWERPNT.EXE >nul 2>&1
taskkill /f /im OUTLOOK.EXE >nul 2>&1
taskkill /f /im onenote.exe >nul 2>&1
echo.

echo 2. Menghapus folder OfficeFileCache...
set "OfficeCachePath=%localappdata%\Microsoft\Office"
if exist "%OfficeCachePath%" (
    for /d %%d in ("%OfficeCachePath%\*.0") do (
        if exist "%%d\OfficeFileCache" (
            echo Menghapus cache di: %%d\OfficeFileCache
            rd /s /q "%%d\OfficeFileCache"
        )
    )
)
echo.

echo ===================================================
echo  SELESAI! Cache Microsoft Office telah dibersihkan.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == FITUR TAMBAHAN: BERSIHKAN CACHE GOOGLE CHROME
:: ==================================================================

:RUN_CLEAN_CHROME
cls
echo ===================================================
echo       BERSIHKAN CACHE GOOGLE CHROME
echo ===================================================
echo.
echo Chrome akan ditutup. Sesi login dan cookies tidak dihapus.
echo.
taskkill /F /IM chrome.exe >nul 2>&1
for /d %%p in ("%localappdata%\Google\Chrome\User Data\*") do (
    if exist "%%p\Cache\." rd /s /q "%%p\Cache" >nul 2>&1
    if exist "%%p\Code Cache\." rd /s /q "%%p\Code Cache" >nul 2>&1
    if exist "%%p\GPUCache\." rd /s /q "%%p\GPUCache" >nul 2>&1
)
echo.
echo Selesai! Cache Chrome dibersihkan tanpa menghapus login atau cookies.
pause
goto MAIN_MENU


:: ==================================================================
:: == FITUR TAMBAHAN: REFRESH IP DAN ROUTING JARINGAN
:: ==================================================================

:RUN_REFRESH_NETWORK
cls
echo ===================================================
echo          REFRESH IP ^& ROUTING JARINGAN
echo ===================================================
echo.
echo Koneksi jaringan akan terputus sementara saat proses berjalan.
echo.
ipconfig /release
ipconfig /renew
arp -d * >nul 2>&1
nbtstat -R >nul 2>&1
ipconfig /flushdns >nul 2>&1
netsh winsock reset >nul 2>&1
netsh int ipv4 reset >nul 2>&1
netsh int ipv6 reset >nul 2>&1
echo.
echo Selesai! IP, routing, ARP, NetBIOS, DNS, Winsock, IPv4, dan IPv6 telah di-refresh.
echo Restart komputer disarankan setelah reset network stack.
pause
goto MAIN_MENU


:: ==================================================================
:: == FITUR TAMBAHAN: RESTART LAYANAN DATABASE POSTGRESQL
:: ==================================================================

:RUN_RESTART_DB
cls
echo ===================================================
echo       RESTART LAYANAN DATABASE POSTGRESQL
echo ===================================================
echo.
set "postgres_service=postgresql-x64-13"
set /p "postgres_service=Nama service PostgreSQL [postgresql-x64-13]: "
if not defined postgres_service set "postgres_service=postgresql-x64-13"
echo.
echo Menghentikan service %postgres_service%...
net stop "%postgres_service%"
echo.
echo Menjalankan kembali service %postgres_service%...
net start "%postgres_service%"
echo.
echo Selesai! Perintah restart service PostgreSQL telah dijalankan.
pause
goto MAIN_MENU


:: ==================================================================
:: == FITUR TAMBAHAN: HAPUS PAKSA FILE / FOLDER
:: ==================================================================

:RUN_FORCE_DELETE
cls
echo ===================================================
echo        HAPUS PAKSA FILE / FOLDER MEMBANDEL
echo ===================================================
echo.
set "delete_target="
set /p "delete_target=Seret file/folder ke sini lalu tekan Enter: "
set "delete_target=%delete_target:"=%"
if not defined delete_target (
    echo Target tidak boleh kosong.
    pause
    goto MAIN_MENU
)
if not exist "%delete_target%" (
    echo Target tidak ditemukan: %delete_target%
    pause
    goto MAIN_MENU
)
echo.
echo Menghapus paksa: %delete_target%
attrib -r -h -s "%delete_target%" /s /d >nul 2>&1
del /f /q "%delete_target%" >nul 2>&1
rd /s /q "%delete_target%" >nul 2>&1
if exist "%delete_target%" (
    echo GAGAL: target masih ada atau sedang digunakan sistem.
) else (
    echo Selesai! Target berhasil dihapus.
)
pause
goto MAIN_MENU


:: ==================================================================
:: == PEMELIHARAAN: PERBAIKI FILE SISTEM DENGAN SFC DAN DISM
:: ==================================================================

:RUN_REPAIR_SYSTEM
cls
echo ===================================================
echo       PEMERIKSAAN ^& PERBAIKAN FILE SISTEM
echo ===================================================
echo.
echo 1. Menjalankan SFC Scan (System File Checker)...
sfc /scannow
echo.
echo 2. Menjalankan DISM Health Restore...
dism /online /cleanup-image /restorehealth
echo.
echo ===================================================
echo  SELESAI! File sistem telah diperiksa dan diperbaiki.
echo ===================================================
pause
goto MAIN_MENU


:: ==================================================================
:: == UTILITAS TAMBAHAN: TOGGLE FILE TERSEMBUNYI DAN EKSTENSI
:: ==================================================================

:RUN_TOGGLE_EXPLORER_VIEW
cls
echo ===================================================
echo       TOGGLE FILE TERSEMBUNYI ^& EKSTENSI FILE
echo ===================================================
echo.
powershell -NoProfile -Command "$key='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; $hidden=(Get-ItemProperty -Path $key -Name Hidden -ErrorAction SilentlyContinue).Hidden; $extensions=(Get-ItemProperty -Path $key -Name HideFileExt -ErrorAction SilentlyContinue).HideFileExt; if ($hidden -eq 2) {$newHidden=1; $hiddenText='ditampilkan'} else {$newHidden=2; $hiddenText='disembunyikan'}; if ($extensions -eq 1) {$newExtensions=0; $extensionText='ditampilkan'} else {$newExtensions=1; $extensionText='disembunyikan'}; Set-ItemProperty -Path $key -Name Hidden -Type DWord -Value $newHidden; Set-ItemProperty -Path $key -Name HideFileExt -Type DWord -Value $newExtensions; Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue; Start-Process explorer.exe; Write-Host ('File tersembunyi sekarang: ' + $hiddenText); Write-Host ('Ekstensi file sekarang: ' + $extensionText); Write-Host 'Explorer telah dimuat ulang.'"
pause
goto MAIN_MENU


:: ==================================================================
:: == UTILITAS TAMBAHAN: KUNCI / BUKA USB STORAGE
:: ==================================================================

:RUN_TOGGLE_USB_STORAGE
cls
echo ===================================================
echo             KUNCI / BUKA USB STORAGE
echo ===================================================
echo.
set "usb_choice="
echo  [1] Kunci USB Storage (blokir baca/tulis flashdisk)
echo  [2] Buka USB Storage (izinkan baca/tulis flashdisk)
echo  [0] Batal
echo.
set /p "usb_choice=Pilih opsi: "
if "%usb_choice%"=="0" goto MAIN_MENU
if "%usb_choice%"=="1" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    if errorlevel 1 (echo [ERROR] Gagal mengunci USB Storage. Jalankan sebagai Administrator.) else echo USB Storage berhasil dikunci.
    pause
    goto MAIN_MENU
)
if "%usb_choice%"=="2" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    if errorlevel 1 (echo [ERROR] Gagal membuka USB Storage. Jalankan sebagai Administrator.) else echo USB Storage berhasil dibuka.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
pause
goto RUN_TOGGLE_USB_STORAGE


:: ==================================================================
:: == UTILITAS TAMBAHAN: PASSWORD WI-FI TERSIMPAN
:: ==================================================================

:RUN_WIFI_PASSWORDS
cls
echo ===================================================
echo             PASSWORD WI-FI TERSIMPAN
echo ===================================================
echo.
powershell -NoProfile -Command "$profiles=netsh wlan show profiles | Select-String 'All User Profile|Profil Semua Pengguna'; if (-not $profiles) {Write-Host 'Tidak ada profil Wi-Fi tersimpan atau WLAN tidak tersedia.'; exit}; foreach ($profile in $profiles) {$name=($profile.Line -split ':',2)[1].Trim(); $details=& netsh wlan show profile name=$name key=clear; $passwordLine=$details | Select-String 'Key Content|Isi Kunci' | Select-Object -First 1; if ($passwordLine) {$password=($passwordLine.Line -split ':',2)[1].Trim()} else {$password='(tidak tersedia / tanpa password)'}; Write-Host ('SSID      : ' + $name); Write-Host ('Password  : ' + $password); Write-Host '---------------------------------------------'}"
pause
goto MAIN_MENU


:: ==================================================================
:: == UTILITAS TAMBAHAN: BEBASKAN PORT MACET
:: ==================================================================

:RUN_KILL_PORT
cls
echo ===================================================
echo             BEBASKAN PORT MACET
echo ===================================================
echo.
set "port_number="
set /p "port_number=Masukkan nomor port (contoh 5432 atau 8080): "
if not defined port_number goto RUN_KILL_PORT
echo.
echo Mencari proses yang memakai port %port_number%...
set "port_found=0"
for /f "tokens=5" %%p in ('netstat -aon ^| findstr /r /c:":%port_number% " /c:":%port_number%$"') do (
    if not "%%p"=="0" if not "%%p"=="" (
        set "port_found=1"
        echo Menghentikan PID %%p...
        taskkill /F /PID %%p >nul 2>&1
        if errorlevel 1 echo [ERROR] PID %%p gagal dihentikan atau akses ditolak.
    )
)
if "!port_found!"=="0" echo Tidak ada proses yang ditemukan pada port %port_number%.
if "!port_found!"=="1" echo Proses pada port %port_number% telah ditangani.
pause
goto MAIN_MENU


:: ==================================================================
:: == UTILITAS TAMBAHAN: FOLDER GODMODE
:: ==================================================================

:RUN_CREATE_GODMODE
cls
echo ===================================================
echo             BUAT FOLDER GODMODE
echo ===================================================
echo.
set "godmode_path=%USERPROFILE%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
if exist "%godmode_path%" (
    echo Folder GodMode sudah tersedia di Desktop.
) else (
    md "%godmode_path%" >nul 2>&1
    if exist "%godmode_path%" (echo Folder GodMode berhasil dibuat di Desktop.) else echo [ERROR] Gagal membuat folder GodMode.
)
pause
goto MAIN_MENU

:RUN_RESTART_ALL_ADAPTERS
cls
echo ===================================================
echo          RESTART SEMUA ADAPTOR JARINGAN
echo ===================================================
echo.
echo Koneksi jaringan akan terputus sementara.
set "adapter_confirm="
set /p "adapter_confirm=Lanjutkan restart semua adaptor? (Y/N): "
if /i not "!adapter_confirm!"=="Y" goto MAIN_MENU
echo Menonaktifkan semua adaptor jaringan...
powershell -NoProfile -Command "Get-NetAdapter -ErrorAction Stop | Disable-NetAdapter -Confirm:$false -ErrorAction Stop"
echo Mengaktifkan kembali semua adaptor jaringan...
powershell -NoProfile -Command "Get-NetAdapter -ErrorAction Stop | Enable-NetAdapter -Confirm:$false -ErrorAction Stop"
if errorlevel 1 (echo [ERROR] Sebagian adaptor gagal diaktifkan kembali.) else echo Semua adaptor jaringan berhasil di-restart.
pause
goto MAIN_MENU


:: ==================================================================
:: == DIAGNOSIS: SPEEDTEST DENGAN TARGET GOOGLE
:: ==================================================================

:RUN_SPEEDTEST_ADAPTERS
cls
color 0B
echo.
echo  +---------------------------------------------------------------+
echo  ^|              SPEEDTEST PER ADAPTOR - PUBLIC SERVER           ^|
echo  +---------------------------------------------------------------+
echo.
echo  Each connected adapter will be tested independently.
echo  Metrics: ping ^| latency ^| jitter ^| download ^| upload
echo.
set "speedtest_adapter_count=0"
for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /i /C:"Connected" /C:"Terhubung" ^| findstr /v /i /C:"Disconnected" /C:"Terputus" /C:"Loopback"') do (
    set /a speedtest_adapter_count+=1
    call :RUN_SPEEDTEST_ADAPTER "%%d"
)
if !speedtest_adapter_count! EQU 0 echo  [!] Tidak ada adaptor aktif yang terhubung.
echo.
color 07
pause
goto MAIN_MENU

:RUN_SPEEDTEST_ADAPTER
echo.
echo  +---------------------------------------------------------------+
echo  ^| ADAPTER: %~1
echo  +---------------------------------------------------------------+
powershell -NoProfile -Command "Write-Host '  [1/4] Menyiapkan koneksi adaptor...' -ForegroundColor Yellow; Write-Host '  [2/4] Mengukur kualitas koneksi...' -ForegroundColor Yellow; Write-Host '  [3/4] Mengukur download dan upload...' -ForegroundColor Yellow"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='SilentlyContinue'; $adapter='%~1'; $sourceIp=(Get-NetIPAddress -InterfaceAlias $adapter -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object {$_.IPAddress -notlike '169.254.*'} | Select-Object -First 1 -ExpandProperty IPAddress); if (-not $sourceIp) {Write-Host 'IPv4 adaptor tidak ditemukan, adaptor dilewati.'; exit}; $target='speed.cloudflare.com'; $targetIps=@(Resolve-DnsName -Name $target -Type A -ErrorAction SilentlyContinue | Select-Object -ExpandProperty IPAddress); Write-Host ('IP lokal: ' + $sourceIp); Write-Host ('IP server: ' + ($targetIps -join ', ')); $pingValues=@(); 1..10 | ForEach-Object {$reply=Test-Connection -ComputerName $target -Source $sourceIp -Count 1 -ErrorAction SilentlyContinue; if ($reply) {$pingValues += [double]$reply.ResponseTime}}; if ($pingValues.Count -gt 0) {$latency=[math]::Round(($pingValues | Measure-Object -Average).Average,2); $jitterValues=@(); for ($index=1; $index -lt $pingValues.Count; $index++) {$jitterValues += [math]::Abs($pingValues[$index]-$pingValues[$index-1])}; $jitter=if ($jitterValues.Count -gt 0) {[math]::Round(($jitterValues | Measure-Object -Average).Average,2)} else {0}} else {$latency=$null; $jitter=$null}; $downloadFile=[IO.Path]::GetTempFileName(); $downloadBytes=0; $downloadWatch=[Diagnostics.Stopwatch]::StartNew(); try {while ($downloadWatch.Elapsed.TotalSeconds -lt 8) {& curl.exe --interface $sourceIp --silent --show-error --location --max-time 15 --output $downloadFile ('https://speed.cloudflare.com/__down?bytes=25000000&speedtest=' + [guid]::NewGuid()); if (Test-Path $downloadFile) {$downloadBytes += (Get-Item $downloadFile).Length}}} catch {}; $downloadWatch.Stop(); Remove-Item $downloadFile -Force -ErrorAction SilentlyContinue; $downloadMbps=if ($downloadWatch.Elapsed.TotalSeconds -gt 0) {[math]::Round(($downloadBytes*8/$downloadWatch.Elapsed.TotalSeconds/1000000),2)} else {0}; $uploadFile=[IO.Path]::GetTempFileName(); $uploadPayload=New-Object byte[] (4MB); (New-Object System.Random).NextBytes($uploadPayload); [IO.File]::WriteAllBytes($uploadFile,$uploadPayload); $uploadWatch=[Diagnostics.Stopwatch]::StartNew(); & curl.exe --interface $sourceIp --silent --show-error --location --max-time 15 --output NUL --data-binary ('@' + $uploadFile) 'https://speed.cloudflare.com/__up'; $uploadWatch.Stop(); Remove-Item $uploadFile -Force -ErrorAction SilentlyContinue; $uploadMbps=if ($uploadWatch.Elapsed.TotalSeconds -gt 0) {[math]::Round(($uploadPayload.Length*8/$uploadWatch.Elapsed.TotalSeconds/1000000),2)} else {0}; Write-Host ''; Write-Host 'Hasil:'; if ($latency -ne $null) {Write-Host ('Ping/Latensi : ' + $latency + ' ms')} else {Write-Host 'Ping/Latensi : gagal'}; if ($jitter -ne $null) {Write-Host ('Jitter       : ' + $jitter + ' ms')} else {Write-Host 'Jitter       : gagal'}; Write-Host ('Download     : ' + $downloadMbps + ' Mbps'); Write-Host ('Upload       : ' + $uploadMbps + ' Mbps'); Write-Host 'Keterangan: ping/latensi/jitter lebih kecil lebih baik; download/upload Mbps lebih besar lebih baik.'; Write-Host 'Tes HTTP diikat ke IP lokal adaptor ini, sehingga hasil tidak memakai adaptor lain.'"
echo  +---------------------------------------------------------------+
goto :eof

:RUN_SPEEDTEST_GOOGLE
goto RUN_SPEEDTEST_ADAPTERS
cls
echo ===================================================
echo       SPEEDTEST INTERNET - SERVER PUBLIK
echo ===================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='SilentlyContinue'; $target='speed.cloudflare.com'; $targetIps=@(Resolve-DnsName -Name $target -Type A -ErrorAction SilentlyContinue | Select-Object -ExpandProperty IPAddress); $targetIp=if ($targetIps.Count -gt 0) {$targetIps -join ', '} else {'tidak dapat diketahui'}; Write-Host ('Server speedtest: ' + $target + ' [' + $targetIp + ']'); Write-Host 'Mengukur ping, latensi, dan jitter ke server publik...'; $pingValues=@(); 1..10 | ForEach-Object { $reply=Test-Connection -ComputerName $target -Count 1 -ErrorAction SilentlyContinue; if ($reply) {$pingValues += [double]$reply.ResponseTime} }; $ping=$null; $latency=$null; $jitter=$null; if ($pingValues.Count -gt 0) {$ping=[math]::Round(($pingValues | Measure-Object -Average).Average,2); $latency=$ping; if ($pingValues.Count -gt 1) {$jitterValues=@(); for ($index=1; $index -lt $pingValues.Count; $index++) {$jitterValues += [math]::Abs($pingValues[$index]-$pingValues[$index-1])}; $jitter=[math]::Round(($jitterValues | Measure-Object -Average).Average,2)} else {$jitter=0}}; Write-Host 'Mengukur download melalui HTTPS server publik selama 8 detik...'; $handler=New-Object System.Net.Http.HttpClientHandler; $handler.AutomaticDecompression=[System.Net.DecompressionMethods]::GZip -bor [System.Net.DecompressionMethods]::Deflate; $client=New-Object System.Net.Http.HttpClient($handler); $client.Timeout=[TimeSpan]::FromSeconds(15); $downloadBytes=0; $downloadWatch=[Diagnostics.Stopwatch]::StartNew(); try {while ($downloadWatch.Elapsed.TotalSeconds -lt 8) {$response=$client.GetAsync(('https://speed.cloudflare.com/__down?bytes=25000000&speedtest=' + [guid]::NewGuid()),[System.Net.Http.HttpCompletionOption]::ResponseContentRead).Result; $downloadBytes += $response.Content.ReadAsByteArrayAsync().Result.Length; $response.Dispose()}} catch {}; $downloadWatch.Stop(); $downloadMbps=0; if ($downloadWatch.Elapsed.TotalSeconds -gt 0) {$downloadMbps=[math]::Round(($downloadBytes*8/$downloadWatch.Elapsed.TotalSeconds/1000000),2)}; Write-Host 'Mengukur upload dengan payload HTTPS 4 MB ke server publik...'; $uploadPayload=New-Object byte[] (4MB); (New-Object System.Random).NextBytes($uploadPayload); $uploadWatch=[Diagnostics.Stopwatch]::StartNew(); try {$uploadResponse=$client.PostAsync('https://speed.cloudflare.com/__up',[System.Net.Http.ByteArrayContent]::new($uploadPayload)).Result; $uploadResponse.Dispose()} catch {}; $uploadWatch.Stop(); $uploadMbps=0; if ($uploadWatch.Elapsed.TotalSeconds -gt 0) {$uploadMbps=[math]::Round(($uploadPayload.Length*8/$uploadWatch.Elapsed.TotalSeconds/1000000),2)}; $client.Dispose(); Write-Host ''; Write-Host '================ HASIL SPEEDTEST ================'; if ($ping -ne $null) {Write-Host ('Ping       : ' + $ping + ' ms')} else {Write-Host 'Ping       : gagal'}; if ($latency -ne $null) {Write-Host ('Latensi    : ' + $latency + ' ms (rata-rata respons server publik)')} else {Write-Host 'Latensi    : gagal'}; if ($jitter -ne $null) {Write-Host ('Jitter     : ' + $jitter + ' ms (perubahan antar-sampel latensi)')} else {Write-Host 'Jitter     : gagal'}; Write-Host ('Download   : ' + $downloadMbps + ' Mbps (HTTPS dari server publik)'); Write-Host ('Upload     : ' + $uploadMbps + ' Mbps (HTTPS ke server publik)'); Write-Host ''; Write-Host 'Keterangan:'; Write-Host '- Mbps lebih besar berarti transfer data lebih cepat.'; Write-Host '- Ping dan latensi lebih kecil berarti respons lebih cepat.'; Write-Host '- Jitter lebih kecil berarti koneksi lebih stabil.'; Write-Host '- Hasil dipengaruhi Wi-Fi, VPN, trafik, dan beban server speedtest.'; Write-Host '- IP server dapat berubah karena memakai jaringan CDN anycast.'"
echo.
echo Speedtest selesai.
pause
goto MAIN_MENU


:: ==================================================================
:: == PEMELIHARAAN: BUKA FOLDER STARTUP WINDOWS
:: ==================================================================

:RUN_OPEN_STARTUP
cls
echo ===================================================
echo           FOLDER STARTUP WINDOWS
echo ===================================================
echo.
explorer.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
echo Folder Startup telah dibuka.
pause
goto MAIN_MENU


:: ==================================================================
:: == PEMELIHARAAN: RESET WINDOWS SEARCH DAN INDEXING
:: ==================================================================

:RUN_RESET_SEARCH
cls
echo ===================================================
echo          RESET WINDOWS SEARCH SERVICE
echo ===================================================
echo.
echo Menghentikan service Windows Search...
net stop "wsearch" >nul 2>&1
echo Mengatur ulang status indexing...
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v "SetupCompletedSuccessfully" /t REG_DWORD /d 0 /f >nul 2>&1
echo Menjalankan kembali service Windows Search...
net start "wsearch" >nul 2>&1
echo.
echo ===================================================
echo  SELESAI! Windows Search telah di-reset.
echo  Windows mungkin membangun ulang indeks secara bertahap.
echo ===================================================
pause
goto MAIN_MENU


:: ==================================================================
:: == PEMELIHARAAN: INFORMASI SPESIFIKASI PC
:: ==================================================================

:RUN_PC_INFO
cls
echo ===================================================
echo             INFORMASI SPESIFIKASI PC
echo ===================================================
echo.
powershell -NoProfile -Command "$os = Get-CimInstance Win32_OperatingSystem; $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1; $board = Get-CimInstance Win32_BaseBoard | Select-Object -First 1; $ram = Get-CimInstance Win32_PhysicalMemory; Write-Host '[Sistem]'; Write-Host ('OS: ' + $os.Caption); Write-Host ('Arsitektur: ' + $os.OSArchitecture); Write-Host ''; Write-Host '[Processor]'; Write-Host ('Nama: ' + $cpu.Name); Write-Host ('Core: ' + $cpu.NumberOfCores); Write-Host ('Kecepatan maksimum: ' + $cpu.MaxClockSpeed + ' MHz'); Write-Host ''; Write-Host '[Motherboard dan Serial Number]'; Write-Host ('Manufacturer: ' + $board.Manufacturer); Write-Host ('Product: ' + $board.Product); Write-Host ('Serial Number: ' + $board.SerialNumber); Write-Host ''; Write-Host '[Memori RAM]'; foreach ($stick in $ram) { Write-Host ('Kapasitas: ' + [math]::Round($stick.Capacity / 1GB, 2) + ' GB | Kecepatan: ' + $stick.Speed + ' MHz | Tipe: ' + $stick.MemoryType) }; Write-Host ('Total RAM: ' + [math]::Round(($ram | Measure-Object -Property Capacity -Sum).Sum / 1GB, 2) + ' GB')"
echo ===================================================
pause
goto MAIN_MENU

:RUN_BACKUP_DRIVERS
cls
echo ===================================================
echo             BACKUP SEMUA DRIVER SISTEM
echo ===================================================
echo.
set "driver_backup_path=C:\Backup_Driver"
if not exist "%driver_backup_path%" md "%driver_backup_path%" >nul 2>&1
if not exist "%driver_backup_path%" (
    echo [ERROR] Folder backup tidak dapat dibuat. Akses ditolak.
    pause
    goto MAIN_MENU
)
echo Mengekspor driver ke %driver_backup_path%...
dism /online /export-driver /destination:"%driver_backup_path%"
if errorlevel 1 (echo [ERROR] Export driver gagal.) else echo Backup driver selesai: %driver_backup_path%
pause
goto MAIN_MENU

:RUN_WINDOWS_LICENSE
cls
echo ===================================================
echo             STATUS LISENSI WINDOWS
echo ===================================================
echo.
cscript //nologo "%SystemRoot%\System32\slmgr.vbs" /dli
echo.
pause
goto MAIN_MENU

:RUN_ADMIN_SHORTCUTS
cls
echo ===================================================
echo                  MENU PINTAS ADMIN
echo ===================================================
echo.
echo  [1] Device Manager
echo  [2] Services
echo  [3] Network Connections
echo  [4] Add / Remove Programs
echo  [0] Kembali
echo.
set "admin_shortcut="
set /p "admin_shortcut=Pilih shortcut: "
if "!admin_shortcut!"=="1" start "Device Manager" devmgmt.msc
if "!admin_shortcut!"=="2" start "Services" services.msc
if "!admin_shortcut!"=="3" start "Network Connections" ncpa.cpl
if "!admin_shortcut!"=="4" start "Programs and Features" appwiz.cpl
if "!admin_shortcut!"=="0" goto MAIN_MENU
if not "!admin_shortcut!"=="0" pause
goto RUN_ADMIN_SHORTCUTS

:RUN_NEVER_SLEEP
cls
echo ===================================================
echo              POWER SCHEME: NEVER SLEEP
echo ===================================================
echo.
echo Mengatur PC agar tidak Sleep saat maintenance...
powercfg /change standby-timeout-ac 0 >nul 2>&1
powercfg /change standby-timeout-dc 0 >nul 2>&1
powercfg /change hibernate-timeout-ac 0 >nul 2>&1
powercfg /change hibernate-timeout-dc 0 >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Power Scheme gagal diubah.
) else (
    echo Berhasil. Sleep dan Hibernate dinonaktifkan.
    echo Pengaturan berlaku pada power scheme yang sedang aktif.
)
pause
goto MAIN_MENU


:: ==================================================================
:: == SPESIALIS SERVIS PC: CEK KESEHATAN SSD / HDD
:: ==================================================================

:RUN_CHECK_DISK_HEALTH
cls
echo ===================================================
echo             KESEHATAN SSD / HDD (S.M.A.R.T)
echo ===================================================
echo.
powershell -NoProfile -Command "$disks=@(Get-PhysicalDisk -ErrorAction SilentlyContinue); if ($disks.Count -eq 0) {Write-Host '[ERROR] Informasi disk tidak tersedia.'} else {$disks | Select-Object FriendlyName,MediaType,HealthStatus,OperationalStatus,Size | Format-Table -AutoSize}"
echo.
echo HealthStatus Normal berarti Windows tidak mendeteksi masalah fisik.
pause
goto MAIN_MENU


:: ==================================================================
:: == SPESIALIS SERVIS PC: MATIKAN DEFENDER SEMENTARA
:: ==================================================================

:RUN_DISABLE_DEFENDER_TEMP
cls
echo ===================================================
echo        MATIKAN SEMENTARA WINDOWS DEFENDER
echo ===================================================
echo.
echo PERINGATAN: Real-Time Monitoring akan dimatikan.
echo Aktifkan kembali setelah maintenance selesai.
set "defender_confirm="
set /p "defender_confirm=Lanjutkan? (Y/N): "
if /i not "!defender_confirm!"=="Y" goto MAIN_MENU
powershell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction Stop"
if errorlevel 1 (echo [ERROR] Defender tidak dapat dimatikan. Tamper Protection mungkin aktif.) else echo Real-Time Monitoring Defender berhasil dimatikan sementara.
pause
goto MAIN_MENU


:: ==================================================================
:: == SPESIALIS SERVIS PC: BERSIHKAN EVENT LOG
:: ==================================================================

:RUN_CLEAR_EVENT_LOGS
cls
echo ===================================================
echo              BERSIHKAN SEMUA EVENT LOG
echo ===================================================
echo.
echo PERINGATAN: Seluruh riwayat log Event Viewer akan dihapus.
set "eventlog_confirm="
set /p "eventlog_confirm=Lanjutkan? (Y/N): "
if /i not "!eventlog_confirm!"=="Y" goto MAIN_MENU
set "eventlog_count=0"
for /f "delims=" %%l in ('wevtutil el') do (
    wevtutil cl "%%l" >nul 2>&1
    if not errorlevel 1 set /a eventlog_count+=1
)
echo Sebanyak !eventlog_count! Event Log berhasil dibersihkan.
pause
goto MAIN_MENU


:: ==================================================================
:: == SPESIALIS SERVIS PC: AKTIFKAN ADMINISTRATOR
:: ==================================================================

:RUN_ENABLE_ADMIN_ACCOUNT
cls
echo ===================================================
echo           AKTIFKAN AKUN ADMINISTRATOR BAWAAN
echo ===================================================
echo.
echo PERINGATAN: Akun Administrator lokal akan diaktifkan.
set "admin_account_confirm="
set /p "admin_account_confirm=Lanjutkan? (Y/N): "
if /i not "!admin_account_confirm!"=="Y" goto MAIN_MENU
net user Administrator /active:yes
if errorlevel 1 (echo [ERROR] Akun Administrator gagal diaktifkan.) else echo Akun Administrator berhasil diaktifkan.
pause
goto MAIN_MENU


:: ==================================================================
:: == SPESIALIS SERVIS PC: SYSTEM RESTORE POINT
:: ==================================================================

:RUN_CREATE_RESTORE_POINT
cls
echo ===================================================
echo              BUAT SYSTEM RESTORE POINT
echo ===================================================
echo.
echo Membuat restore point: Before_IT_Service...
powershell -NoProfile -Command "Checkpoint-Computer -Description 'Before_IT_Service' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction Stop"
if errorlevel 1 (
    echo [ERROR] Restore point gagal dibuat. Pastikan System Protection aktif.
) else (
    echo Restore point Before_IT_Service berhasil dibuat.
)
pause
goto MAIN_MENU

:CORE_ISOLATION_MENU
cls
echo ===================================================
echo        CORE ISOLATION - MEMORY INTEGRITY
echo ===================================================
echo.
echo  [1] Aktifkan Memory Integrity
echo  [2] Matikan Memory Integrity
echo  [3] Cek Status Memory Integrity
echo  [0] Kembali ke Menu Utama
echo.
set "core_isolation_opt="
set /p "core_isolation_opt=Pilih opsi lalu tekan Enter: "
if "%core_isolation_opt%"=="1" goto RUN_ENABLE_CORE_ISOLATION
if "%core_isolation_opt%"=="2" goto RUN_DISABLE_CORE_ISOLATION
if "%core_isolation_opt%"=="3" goto RUN_STATUS_CORE_ISOLATION
if "%core_isolation_opt%"=="0" goto MAIN_MENU
goto CORE_ISOLATION_MENU

:RUN_ENABLE_CORE_ISOLATION
cls
echo ===================================================
echo        AKTIFKAN MEMORY INTEGRITY
echo ===================================================
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 1 /f
if errorlevel 1 (
    echo [ERROR] Memory Integrity gagal diaktifkan.
) else (
    echo Memory Integrity berhasil diaktifkan.
    call :CORE_ISOLATION_RESTART_PROMPT
)
pause
goto CORE_ISOLATION_MENU

:RUN_SET_NETWORK_PRIVATE
cls
echo ===================================================
echo      UBAH SEMUA JARINGAN KE PROFIL PRIVATE
echo ===================================================
echo.
echo Mengubah profil koneksi aktif menjadi Private...
powershell -NoProfile -Command "Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private -ErrorAction SilentlyContinue"
if errorlevel 1 (echo [ERROR] Gagal mengubah profil. Pastikan Anda terhubung ke jaringan.) else (echo Berhasil! Jaringan sekarang dalam mode Private (Discovery Aktif).)
echo.
pause
goto MAIN_MENU

:RUN_RESET_STORE
cls
echo ===================================================
echo          RESET MICROSOFT STORE ^& APPS
echo ===================================================
echo.
echo 1. Menjalankan WSReset.exe (Mohon tunggu)...
start /wait wsreset.exe
echo.
echo 2. Registrasi ulang aplikasi bawaan Windows...
powershell -NoProfile -Command "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\" -ErrorAction SilentlyContinue}"
echo.
echo Selesai! Microsoft Store dan aplikasi UWP telah di-reset.
pause
goto MAIN_MENU

:RUN_CHECK_BAD_DRIVERS
cls
echo ===================================================
echo           CEK DRIVER BERMASALAH (ERROR)
echo ===================================================
echo.
echo Mencari perangkat dengan status error di Device Manager...
echo.
powershell -NoProfile -Command ^
    "$badDrivers = Get-CimInstance Win32_PnPEntity | Where-Object { $_.ConfigManagerErrorCode -ne 0 }; ^
     if ($badDrivers) { ^
        $badDrivers | Select-Object Name, @{n='Error_Code';e={$_.ConfigManagerErrorCode}}, Status | Format-Table -AutoSize; ^
        Write-Host 'Ditemukan perangkat bermasalah. Segera update driver tersebut.' -ForegroundColor Yellow; ^
     } else { ^
        Write-Host 'Semua driver terdeteksi berjalan normal (Tidak ada Error Code).' -ForegroundColor Green; ^
     }"
echo.
echo Catatan: Cek Device Manager untuk detail lebih lanjut.
pause
goto MAIN_MENU

:RUN_CLEAN_EDGE
cls
echo ===================================================
echo       BERSIHKAN CACHE MICROSOFT EDGE
echo ===================================================
echo.
echo Menutup Edge...
taskkill /F /IM msedge.exe >nul 2>&1
echo Membersihkan cache...
for /d %%p in ("%localappdata%\Microsoft\Edge\User Data\*") do (
    if exist "%%p\Cache\." rd /s /q "%%p\Cache" >nul 2>&1
    if exist "%%p\Code Cache\." rd /s /q "%%p\Code Cache" >nul 2>&1
    if exist "%%p\GPUCache\." rd /s /q "%%p\GPUCache" >nul 2>&1
)
echo Selesai! Cache Edge berhasil dibersihkan.
pause
goto MAIN_MENU

:RUN_CLEAN_DO_CACHE
cls
echo ===================================================
echo     HAPUS CACHE DELIVERY OPTIMIZATION
echo ===================================================
echo.
echo Menghentikan layanan Delivery Optimization...
net stop dosvc >nul 2>&1
echo Menghapus file cache (bisa memakan waktu)...
del /q /f /s "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*.*" >nul 2>&1
net start dosvc >nul 2>&1
echo.
echo Selesai! Ruang disk berhasil dibebaskan dari sampah update.
pause
goto MAIN_MENU

:RUN_CHECK_UPTIME
cls
echo ===================================================
echo        CEK UPTIME ^& TANGGAL INSTALASI
echo ===================================================
echo.
powershell -NoProfile -Command ^
    "$os = Get-CimInstance Win32_OperatingSystem; ^
     $uptime = (Get-Date) - $os.LastBootUpTime; ^
     Write-Host '--- Uptime Sistem ---' -ForegroundColor Cyan; ^
     Write-Host ('PC telah menyala selama: ' + $uptime.Days + ' Hari, ' + $uptime.Hours + ' Jam, ' + $uptime.Minutes + ' Menit'); ^
     Write-Host ''; ^
     Write-Host '--- Tanggal Instalasi Windows ---' -ForegroundColor Cyan; ^
     Write-Host ('Terinstal pada: ' + $os.InstallDate.ToString('dd MMMM yyyy, HH:mm')); ^
     if ($uptime.Days -gt 7) { Write-Host 'Saran: Lakukan restart jika sistem terasa tidak stabil.' -ForegroundColor Yellow }"
echo.
pause
goto MAIN_MENU

:RUN_TOGGLE_FAST_STARTUP
cls
echo ===================================================
echo             TOGGLE FAST STARTUP
echo ===================================================
echo.
echo Fast Startup sering membuat PC tidak benar-benar mati saat Shutdown,
echo sehingga memicu glitch driver/sistem. Mematikannya sangat disarankan.
echo.
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled 2^>nul') do set "fast_startup_status=%%A"
if "!fast_startup_status!"=="0x1" (echo Status saat ini: AKTIF) else (echo Status saat ini: NONAKTIF)
echo.
echo  [1] Matikan Fast Startup (Sangat Disarankan)
echo  [2] Aktifkan Fast Startup
echo  [0] Kembali ke Menu Utama
echo.
set "fs_opt="
set /p "fs_opt=Pilih opsi: "
if "%fs_opt%"=="1" reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f >nul 2>&1
if "%fs_opt%"=="2" reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f >nul 2>&1
goto MAIN_MENU

:RUN_GET_PRODUCT_KEY
cls
echo ===================================================
echo          EKSTRAK OEM PRODUCT KEY DARI BIOS
echo ===================================================
echo.
echo Mencari Product Key yang tertanam di motherboard (BIOS/UEFI)...
echo.
powershell -NoProfile -Command "$key=(Get-CimInstance SoftwareLicensingService).OA3xOriginalProductKey; if ($key) { Write-Host 'OEM Product Key (BIOS):' $key -ForegroundColor Green } else { Write-Host 'Tidak ditemukan OEM Product Key di BIOS.' -ForegroundColor Yellow; Write-Host 'PC ini mungkin dirakit sendiri atau menggunakan lisensi retail/volume non-OEM.' }"
echo.
pause
goto MAIN_MENU

:RUN_BATTERY_REPORT
cls
echo ===================================================
echo        GENERATE LAPORAN BATERAI LAPTOP
echo ===================================================
echo.
echo Membuat laporan kesehatan baterai (Battery Report)...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Battery_Report.html" >nul 2>&1
if errorlevel 1 (echo [ERROR] Gagal. Fitur ini hanya untuk device dengan baterai (Laptop/Tablet).) else (echo Berhasil! File 'Battery_Report.html' dibuat di Desktop. & start "" "%USERPROFILE%\Desktop\Battery_Report.html")
echo.
pause
goto MAIN_MENU

:RUN_DISABLE_CORE_ISOLATION
cls
echo ===================================================
echo        MATIKAN MEMORY INTEGRITY
echo ===================================================
echo PERINGATAN: Menonaktifkan fitur ini mengurangi perlindungan kernel Windows.
set "core_isolation_confirm="
set /p "core_isolation_confirm=Lanjutkan? (Y/N): "
if /i not "!core_isolation_confirm!"=="Y" goto CORE_ISOLATION_MENU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f
if errorlevel 1 (
    echo [ERROR] Memory Integrity gagal dimatikan.
) else (
    echo Memory Integrity berhasil dimatikan.
    call :CORE_ISOLATION_RESTART_PROMPT
)
pause
goto CORE_ISOLATION_MENU

:CORE_ISOLATION_RESTART_PROMPT
echo.
echo Perubahan akan diterapkan setelah Windows di-restart.
echo  [1] Restart sekarang
echo  [2] Restart nanti
set "core_isolation_restart_opt="
set /p "core_isolation_restart_opt=Pilih opsi lalu tekan Enter: "
if "%core_isolation_restart_opt%"=="1" (
    echo Windows akan di-restart sekarang.
    shutdown /r /t 0
    exit /b
)
if "%core_isolation_restart_opt%"=="2" exit /b
echo Pilihan tidak valid.
goto CORE_ISOLATION_RESTART_PROMPT

:RUN_STATUS_CORE_ISOLATION
cls
echo ===================================================
echo        STATUS MEMORY INTEGRITY
echo ===================================================
set "core_isolation_status="
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled 2^>nul ^| findstr /i "Enabled"') do set "core_isolation_status=%%A"
if /i "!core_isolation_status!"=="0x1" (
    echo Status: AKTIF
) else if /i "!core_isolation_status!"=="0x0" (
    echo Status: NONAKTIF
) else (
    echo Status: TIDAK TERKONFIGURASI
)
pause
goto CORE_ISOLATION_MENU