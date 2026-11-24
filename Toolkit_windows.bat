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
echo  --- UPDATE SYSTEM ---
echo  [1] Matikan Update    [2] Aktifkan Update   [3] Empty Recycle   [4] Cek Activation
echo  [5] Clean Thumbnails  [6] Reset Font        [7] Repair Office   [8] Pengaturan DNS
echo.
echo  --- NETWORK CLEANUP ---
echo  [9] Refresh IP        [10] Format USB       [11] Reset Network   [12] Kunci USB
echo [13] Password Wi-Fi    [14] Kill Port        [15] Bersihkan Temp  [16] Bersihkan Clip
echo [17] Cache Office      [18] Cache Chrome     [19] Cache Edge      [20] Cache Delivery
echo [21] Bersihkan Log     [22] Auto Cleanup     [23] Optimize SSD    [24] Defrag HDD
echo.
echo  --- UTILITAS APPS ---
echo [25] Restart Explorer  [26] Kill Not Resp    [27] Rebuild Cache    [28] Toggle File
echo [29] GodMode           [30] Restart Adaptor  [31] Lihat Program    [32] Uninstall Paksa
echo [33] Disable Startup   [34] Hapus Bloatware  [35] Reset Store      [36] Cek Suhu CPU
echo [37] Test Audio        [38] Test Webcam      [39] Cek Kapasitas    [40] Test Keyboard
echo [41] Cek Spesifikasi   [42] Speedtest        [43] Cek S.M.A.R.T    [44] Cek Driver
echo [45] Cek Semua Driver  [46] Update Driver
echo.
echo  --- PRINTER USER ---
echo [47] Reset Spooler     [48] Install Driver   [49] Buat User       [50] Hapus User
echo [51] Aktif Admin       [52] Baterai Detail   [53] Calibrate       [54] Laporan Baterai
echo.
echo  --- MAINTENANCE ---
echo [55] Perbaiki SFC      [56] Folder Startup    [57] Reset Search     [58] Restore Point
echo [59] Core Isolation    [60] Fast Startup      [61] Private Network  [62] Backup Driver
echo [63] Cek Lisensi       [64] Never Sleep       [65] Matikan Defender [66] Product Key
echo [67] Cek Uptime        [68] Unhide Flashdisk  [69] Sync Jam         [70] Hapus Paksa
echo [87] Startup Repair    [88] System Image      [89] Disk Cleanup     [90] Compact OS
echo [91] Page File
echo.
echo  --- QUICK ACTIONS ---
echo [92] Restart Delay     [93] Shutdown Delay    [94] Force Restart    [95] Safe Mode
echo [96] Boot to BIOS
echo.
echo  --- PERFORMANCE TUNING ---
echo [97] Power Plan        [98] Performance       [99] Disable Serv     [100] Visual Effects
echo [101] CPU Core Park
echo.
echo  --- PRIVACY TWEAKS ---
echo [69] Clear Recent      [70] Clear Run          [71] Toggle Cortana [72] Telemetry
echo [73] Notifications     [74] Rename PC          [75] Cek Nama PC    [76] Hibernation
echo [77] Windows Version   [78] Installed Updates  [79] Test Mikrofon  [80] Screenshot
echo [81] Webcam Res        [82] Event Viewer       [83] Task Manager   [84] Control Panel
echo.
echo  [0] Keluar
echo ===================================================
set "main_opt="
set /p main_opt="Pilih opsi lalu tekan Enter: "

if "%main_opt%"=="1" goto RUN_DISABLE_UPDATE
if "%main_opt%"=="2" goto RUN_ENABLE_UPDATE
if "%main_opt%"=="3" goto RUN_EMPTY_RECYCLE_BIN_FORCE
if "%main_opt%"=="4" goto RUN_CHECK_WINDOWS_ACTIVATION
if "%main_opt%"=="5" goto RUN_CLEAN_THUMBNAILS_ICONS
if "%main_opt%"=="6" goto RUN_RESET_FONT_CACHE
if "%main_opt%"=="7" goto RUN_REPAIR_OFFICE
if "%main_opt%"=="8" goto DNS_MENU
if "%main_opt%"=="9" goto RUN_REFRESH_NETWORK
if "%main_opt%"=="10" goto RUN_FORMAT_USB_DISKPART
if "%main_opt%"=="11" goto RUN_RESET_NETWORK_FULL
if "%main_opt%"=="12" goto RUN_TOGGLE_USB_STORAGE
if "%main_opt%"=="13" goto RUN_WIFI_PASSWORDS
if "%main_opt%"=="14" goto RUN_KILL_PORT
if "%main_opt%"=="15" goto RUN_CLEAN_WINDOWS
if "%main_opt%"=="16" goto RUN_CLEAR_CLIPBOARD
if "%main_opt%"=="17" goto RUN_CLEAN_OFFICE_CACHE
if "%main_opt%"=="18" goto RUN_CLEAN_CHROME
if "%main_opt%"=="19" goto RUN_CLEAN_EDGE
if "%main_opt%"=="20" goto RUN_CLEAN_DO_CACHE
if "%main_opt%"=="21" goto RUN_CLEAR_EVENT_LOGS
if "%main_opt%"=="22" goto RUN_SCHEDULED_CLEANUP
if "%main_opt%"=="23" goto RUN_OPTIMIZE_SSD
if "%main_opt%"=="24" goto RUN_DEFRAG_HDD
if "%main_opt%"=="25" goto RUN_RESTART_EXPLORER
if "%main_opt%"=="26" goto RUN_KILL_NOT_RESPONDING
if "%main_opt%"=="27" goto RUN_REBUILD_CACHE
if "%main_opt%"=="28" goto RUN_TOGGLE_EXPLORER_VIEW
if "%main_opt%"=="29" goto RUN_CREATE_GODMODE
if "%main_opt%"=="30" goto RUN_RESTART_ALL_ADAPTERS
if "%main_opt%"=="31" goto RUN_LIST_INSTALLED_APPS
if "%main_opt%"=="32" goto RUN_UNINSTALL_APP_FORCE
if "%main_opt%"=="33" goto RUN_DISABLE_STARTUP_APPS
if "%main_opt%"=="34" goto RUN_REMOVE_BLOATWARE
if "%main_opt%"=="35" goto RUN_RESET_STORE
if "%main_opt%"=="36" goto RUN_CHECK_CPU_TEMP
if "%main_opt%"=="37" goto RUN_TEST_AUDIO
if "%main_opt%"=="38" goto RUN_TEST_WEBCAM
if "%main_opt%"=="39" goto RUN_CHECK_DISK_SPACE
if "%main_opt%"=="40" goto RUN_TEST_KEYBOARD_MOUSE
if "%main_opt%"=="41" goto RUN_PC_INFO
if "%main_opt%"=="42" goto RUN_SPEEDTEST_ADAPTERS
if "%main_opt%"=="43" goto RUN_CHECK_DISK_HEALTH
if "%main_opt%"=="44" goto RUN_CHECK_BAD_DRIVERS
if "%main_opt%"=="45" goto RUN_CHECK_ALL_DRIVERS
if "%main_opt%"=="46" goto RUN_UPDATE_DRIVERS
if "%main_opt%"=="47" goto RUN_RESET_SPOOLER
if "%main_opt%"=="48" goto RUN_INSTALL_PRINTER_DRIVER
if "%main_opt%"=="49" goto RUN_CREATE_NEW_USER
if "%main_opt%"=="50" goto RUN_DELETE_USER_PROFILE
if "%main_opt%"=="51" goto RUN_ENABLE_ADMIN_ACCOUNT
if "%main_opt%"=="52" goto RUN_BATTERY_DETAIL
if "%main_opt%"=="53" goto RUN_CALIBRATE_BATTERY
if "%main_opt%"=="54" goto RUN_BATTERY_REPORT
if "%main_opt%"=="55" goto RUN_REPAIR_SYSTEM
if "%main_opt%"=="56" goto RUN_OPEN_STARTUP
if "%main_opt%"=="57" goto RUN_RESET_SEARCH
if "%main_opt%"=="58" goto RUN_CREATE_RESTORE_POINT
if "%main_opt%"=="59" goto CORE_ISOLATION_MENU
if "%main_opt%"=="60" goto RUN_TOGGLE_FAST_STARTUP
if "%main_opt%"=="61" goto RUN_SET_NETWORK_PRIVATE
if "%main_opt%"=="62" goto RUN_BACKUP_DRIVERS
if "%main_opt%"=="63" goto RUN_WINDOWS_LICENSE
if "%main_opt%"=="64" goto RUN_NEVER_SLEEP
if "%main_opt%"=="65" goto RUN_DISABLE_DEFENDER_TEMP
if "%main_opt%"=="66" goto RUN_GET_PRODUCT_KEY
if "%main_opt%"=="67" goto RUN_CHECK_UPTIME
if "%main_opt%"=="68" goto RUN_UNHIDE_FLASHDISK
if "%main_opt%"=="69" goto RUN_SYNC_TIME
if "%main_opt%"=="70" goto RUN_FORCE_DELETE
if "%main_opt%"=="71" goto RUN_CLEAR_RECENT_FILES
if "%main_opt%"=="72" goto RUN_CLEAR_RUN_HISTORY
if "%main_opt%"=="73" goto RUN_TOGGLE_CORTANA
if "%main_opt%"=="74" goto RUN_TOGGLE_TELEMETRY
if "%main_opt%"=="75" goto RUN_TOGGLE_NOTIFICATIONS
if "%main_opt%"=="76" goto RUN_RENAME_COMPUTER
if "%main_opt%"=="77" goto RUN_CHECK_COMPUTER_NAME
if "%main_opt%"=="78" goto RUN_TOGGLE_HIBERNATION
if "%main_opt%"=="79" goto RUN_CHECK_WINDOWS_VERSION
if "%main_opt%"=="80" goto RUN_CHECK_INSTALLED_UPDATES
if "%main_opt%"=="81" goto RUN_TEST_MICROPHONE
if "%main_opt%"=="82" goto RUN_TAKE_SCREENSHOT
if "%main_opt%"=="83" goto RUN_CHECK_WEBCAM_RESOLUTION
if "%main_opt%"=="84" goto RUN_OPEN_EVENT_VIEWER
if "%main_opt%"=="85" goto RUN_OPEN_TASK_MANAGER
if "%main_opt%"=="86" goto RUN_OPEN_CONTROL_PANEL
if "%main_opt%"=="87" goto RUN_STARTUP_REPAIR
if "%main_opt%"=="88" goto RUN_SYSTEM_IMAGE_BACKUP
if "%main_opt%"=="89" goto RUN_DISK_CLEANUP_MANAGER
if "%main_opt%"=="90" goto RUN_COMPACT_OS
if "%main_opt%"=="91" goto RUN_PAGE_FILE_MANAGER
if "%main_opt%"=="92" goto RUN_RESTART_DELAY
if "%main_opt%"=="93" goto RUN_SHUTDOWN_DELAY
if "%main_opt%"=="94" goto RUN_FORCE_RESTART
if "%main_opt%"=="95" goto RUN_SAFE_MODE_BOOT
if "%main_opt%"=="96" goto RUN_BOOT_TO_BIOS
if "%main_opt%"=="97" goto RUN_POWER_PLAN_MANAGER
if "%main_opt%"=="98" goto RUN_PERFORMANCE_MODE
if "%main_opt%"=="99" goto RUN_DISABLE_SERVICES
if "%main_opt%"=="100" goto RUN_VISUAL_EFFECTS_TOGGLE
if "%main_opt%"=="101" goto RUN_CPU_CORE_PARKING
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
echo  [1]  AdGuard                        [14] AdGuard Personal
echo  [2]  Cloudflare                     [15] AdGuard PC Rumah
echo  [3]  Quad9                          [16] AdGuard Hunting PC
echo  [4]  Google Public DNS              [17] AdGuard DNS Poco
echo  [5]  Control D                      [18] Cloudflare DoH
echo  [6]  Mullvad                        [19] Quad9 DoH
echo  [7]  OpenDNS                        [20] Google DoH
echo  [8]  CleanBrowsing                  [21] NextDNS DoH
echo  [9]  dns0.eu                        [22] Mullvad DoH AdBlock
echo  [10] NextDNS                        [23] Mullvad DoH Standard
echo  [11] AhaDNS                         [24] Control D DoH
echo  [12] OpenDNS FamilyShield           [25] Control D DoH Family
echo  [13] Comodo                         [26] OpenDNS DoH
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
echo  [46] Alternate DNS                    [59] DNS.SB DoH
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
echo  [39] Pilih Adaptor          [40] Cloudflare DoT
echo  [R] Reset DNS DHCP          [F] Flush DNS Cache      [0] Menu Utama
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

:: Benchmark DNS: Gunakan opsi utama [21] Speedtest untuk tes koneksi.

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

:: ==================================================================
:: == FITUR TAMBAHAN: PERBAIKAN & PEMASANGAN DRIVER PRINTER
:: ==================================================================

:RUN_INSTALL_PRINTER_DRIVER
cls
echo ===================================================
echo     PERBAIKAN & PEMASANGAN DRIVER PRINTER
echo ===================================================
echo.
echo Fitur ini untuk mengatasi kasus:
echo - Scanner terbaca tetapi antrean cetak tidak muncul
echo - Printer nyangkut ke driver bawaan Microsoft
echo - Perlu install driver dari file .inf
echo.
echo ===================================================
echo  LANGKAH 1: AUDIT DRIVER STORE & PORT USB
echo ===================================================
echo.
echo 1.1. Memeriksa driver printer di Driver Store...
echo.
powershell -NoProfile -Command "Write-Host 'Mencari driver printer (.inf) di Driver Store...'; $driverPath = 'C:\Windows\System32\DriverStore\FileRepository'; if (Test-Path $driverPath) { $infFiles = Get-ChildItem -Path $driverPath -Recurse -Filter '*.inf' -ErrorAction SilentlyContinue | Where-Object { (Get-Content $_.FullName -ErrorAction SilentlyContinue | Select-String -Pattern 'ClassGuid={4D36E979-E325-11CE-BFC1-08002BE10318}' -Quiet) }; if ($infFiles) { Write-Host ('Ditemukan ' + $infFiles.Count + ' file .inf printer:'); $infFiles | Select-Object -First 20 | ForEach-Object { Write-Host ('  - ' + $_.FullName) } } else { Write-Host 'Tidak ditemukan driver printer di Driver Store.' } } else { Write-Host 'Driver Store tidak ditemukan.' }"
echo.
echo 1.2. Memeriksa port USB printer yang tersedia...
echo.
powershell -NoProfile -Command "$ports = Get-PrinterPort -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'USB*' }; if ($ports) { Write-Host 'Port USB printer tersedia:'; $ports | ForEach-Object { Write-Host ('  - ' + $_.Name + ' - ' + $_.Description) } } else { Write-Host 'Tidak ada port USB printer terdeteksi.' }"
echo.
echo 1.3. Memeriksa printer yang terdeteksi (Device Manager)...
echo.
powershell -NoProfile -Command "$printers = Get-CimInstance Win32_PnPEntity | Where-Object { $_.Class -eq 'Printer' -or $_.Name -like '*Printer*' -or $_.Name -like '*Print*' }; if ($printers) { Write-Host 'Perangkat printer terdeteksi:'; $printers | ForEach-Object { Write-Host ('  - ' + $_.Name + ' | Status: ' + $_.Status) } } else { Write-Host 'Tidak ada perangkat printer terdeteksi.' }"
echo.
pause
echo ===================================================
echo  LANGKAH 2: VALIDASI & PEMULIHAN SERVICE PRINT SPOOLER
echo ===================================================
echo.
echo 2.1. Memeriksa status service Print Spooler...
sc query spooler | findstr "STATE"
echo.
echo 2.2. Mengatur service Print Spooler ke mode otomatis...
sc config spooler start= auto
if errorlevel 1 (
    echo [ERROR] Gagal mengatur service Print Spooler ke auto.
    pause
    goto MAIN_MENU
) else echo Service Print Spooler diatur ke auto.
echo.
echo 2.3. Memastikan service Print Spooler berjalan...
sc query spooler | findstr "RUNNING" >nul 2>&1
if errorlevel 1 (
    echo Service Print Spooler tidak berjalan. Memulai...
    net start spooler
    if errorlevel 1 (
        echo [ERROR] Gagal menjalankan service Print Spooler.
        echo.
        echo Kemungkinan penyebab:
        echo - Service sedang di-disabled
        echo - Ada error pada service
        echo - Masalah dependency service
        echo.
        echo Coba manual: sc start spooler
        pause
        goto MAIN_MENU
    ) else echo Service Print Spooler berhasil dijalankan.
) else echo Service Print Spooler sudah berjalan.
echo.
pause
echo ===================================================
echo  LANGKAH 3: REGISTRASI DRIVER PRINTER DARI FILE .INF
echo ===================================================
echo.
echo 3.1. Pilih sumber file .inf:
echo.
echo  [1] Cari di DriverStore\FileRepository
echo  [2] Masukkan path file .inf manual
echo  [3] Ekstrak dari folder driver lokal
echo  [0] Batal
echo.
set "inf_source_opt="
set /p "inf_source_opt=Pilih opsi: "
if "%inf_source_opt%"=="0" goto MAIN_MENU
if "%inf_source_opt%"=="1" (
    echo.
    echo Mencari file .inf printer di DriverStore...
    echo.
    powershell -NoProfile -Command "$infFiles = Get-ChildItem -Path 'C:\Windows\System32\DriverStore\FileRepository' -Recurse -Filter '*.inf' -ErrorAction SilentlyContinue | Where-Object { (Get-Content $_.FullName -ErrorAction SilentlyContinue | Select-String -Pattern 'ClassGuid={4D36E979-E325-11CE-BFC1-08002BE10318}' -Quiet) }; if ($infFiles) { $infFiles | Select-Object -First 30 | ForEach-Object { $index = [array]::IndexOf($infFiles, $_) + 1; Write-Host ('[' + $index + '] ' + $_.FullName) } } else { Write-Host 'Tidak ditemukan driver printer.' }"
    echo.
    set "inf_index="
    set /p "inf_index=Masukkan nomor file .inf: "
    if not defined inf_index goto RUN_INSTALL_PRINTER_DRIVER
    echo File nomor %inf_index% dipilih.
    set "inf_path="
    powershell -NoProfile -Command "$infFiles = Get-ChildItem -Path 'C:\Windows\System32\DriverStore\FileRepository' -Recurse -Filter '*.inf' -ErrorAction SilentlyContinue | Where-Object { (Get-Content $_.FullName -ErrorAction SilentlyContinue | Select-String -Pattern 'ClassGuid={4D36E979-E325-11CE-BFC1-08002BE10318}' -Quiet) }; if ($infFiles.Count -ge %inf_index%) { Write-Host ($infFiles[%inf_index%-1].FullName) }"
    echo.
    set "inf_path_manual="
    set /p "inf_path_manual=Path file .inf lengkap: "
    if not defined inf_path_manual goto RUN_INSTALL_PRINTER_DRIVER
    if not exist "%inf_path_manual%" (
        echo [ERROR] File tidak ditemukan: %inf_path_manual%
        pause
        goto RUN_INSTALL_PRINTER_DRIVER
    )
    set "inf_path=%inf_path_manual%"
)
if "%inf_source_opt%"=="2" (
    echo.
    set "inf_path_manual="
    set /p "inf_path_manual=Masukkan path lengkap file .inf: "
    if not defined inf_path_manual goto RUN_INSTALL_PRINTER_DRIVER
    if not exist "%inf_path_manual%" (
        echo [ERROR] File tidak ditemukan: %inf_path_manual%
        pause
        goto RUN_INSTALL_PRINTER_DRIVER
    )
    set "inf_path=%inf_path_manual%"
)
if "%inf_source_opt%"=="3" (
    echo.
    set "driver_folder="
    set /p "driver_folder=Masukkan path folder driver: "
    if not defined driver_folder goto RUN_INSTALL_PRINTER_DRIVER
    if not exist "%driver_folder%" (
        echo [ERROR] Folder tidak ditemukan: %driver_folder%
        pause
        goto RUN_INSTALL_PRINTER_DRIVER
    )
    echo Mencari file .inf di folder...
    powershell -NoProfile -Command "$infFiles = Get-ChildItem -Path '%driver_folder%' -Filter '*.inf' -ErrorAction SilentlyContinue; if ($infFiles) { $infFiles | ForEach-Object { Write-Host ('  - ' + $_.FullName) } } else { Write-Host 'Tidak ditemukan file .inf.' }"
    echo.
    set "inf_path_manual="
    set /p "inf_path_manual=Masukkan path file .inf dari daftar di atas: "
    if not defined inf_path_manual goto RUN_INSTALL_PRINTER_DRIVER
    if not exist "%inf_path_manual%" (
        echo [ERROR] File tidak ditemukan: %inf_path_manual%
        pause
        goto RUN_INSTALL_PRINTER_DRIVER
    )
    set "inf_path=%inf_path_manual%"
)
echo.
echo File .inf yang dipilih: %inf_path%
echo.
echo 3.2. Mendaftarkan driver printer ke Print Spooler...
echo.
rundll32 printui.dll,PrintUIEntry /ia /m "%inf_path%" /h "Intel" /v "Windows NT x86"
if errorlevel 1 (
    echo [ERROR] Gagal mendaftarkan driver printer.
    echo Mencoba metode alternatif dengan pnputil...
    pnputil /add-driver "%inf_path%" /install
    if errorlevel 1 (
        echo [ERROR] Gagal mendaftarkan driver dengan pnputil juga.
        echo Pastikan file .inf valid dan kompatibel dengan sistem.
        pause
        goto MAIN_MENU
    ) else echo Driver berhasil didaftarkan via pnputil.
) else echo Driver printer berhasil didaftarkan.
echo.
echo 3.3. Daftar driver printer yang terdaftar:
echo.
powershell -NoProfile -Command "Get-PrinterDriver -ErrorAction SilentlyContinue | Select-Object Name, Version | Format-Table -AutoSize"
echo.
pause
echo ===================================================
echo  LANGKAH 4: PEMBUATAN ANTREAN PRINTER & UJI CETAK
echo ===================================================
echo.
echo 4.1. Pilih port USB untuk printer:
echo.
powershell -NoProfile -Command "$ports = Get-PrinterPort -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'USB*' }; if ($ports) { $index = 1; $ports | ForEach-Object { Write-Host ('[' + $index + '] ' + $_.Name + ' - ' + $_.Description); $index++ } } else { Write-Host 'Tidak ada port USB tersedia. Membuat port baru...' }"
echo.
set "port_index="
set /p "port_index=Masukkan nomor port USB (atau tekan Enter untuk buat port baru): "
if not defined port_index (
    echo.
    echo Membuat port USB baru...
    set "printer_port_name=USB001"
    set "printer_port_name="
    set /p "printer_port_name=Nama port (default USB001): "
    if not defined printer_port_name set "printer_port_name=USB001"
    powershell -NoProfile -Command "Add-PrinterPort -Name '%printer_port_name%' -PrinterHostAddress '127.0.0.1' -ErrorAction SilentlyContinue"
    if errorlevel 1 (
        echo [ERROR] Gagal membuat port baru.
        pause
        goto MAIN_MENU
    ) else echo Port %printer_port_name% berhasil dibuat.
    set "selected_port=%printer_port_name%"
) else (
    set "selected_port="
    powershell -NoProfile -Command "$ports = Get-PrinterPort -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'USB*' }; if ($ports.Count -ge %port_index%) { Write-Host ($ports[%port_index%-1].Name) }"
    echo.
    set "selected_port_manual="
    set /p "selected_port_manual=Nama port (atau Enter gunakan dari daftar): "
    if defined selected_port_manual set "selected_port=%selected_port_manual%"
)
echo.
echo Port yang dipilih: %selected_port%
echo.
echo 4.2. Masukkan nama printer:
set "printer_name="
set /p "printer_name=Nama printer (misal: HP LaserJet Pro): "
if not defined printer_name (
    echo Nama printer tidak boleh kosong.
    pause
    goto MAIN_MENU
)
echo.
echo 4.3. Pilih driver dari daftar yang terdaftar:
echo.
powershell -NoProfile -Command "$drivers = Get-PrinterDriver -ErrorAction SilentlyContinue; if ($drivers) { $index = 1; $drivers | ForEach-Object { Write-Host ('[' + $index + '] ' + $_.Name); $index++ } } else { Write-Host 'Tidak ada driver terdaftar.' }"
echo.
set "driver_index="
set /p "driver_index=Masukkan nomor driver: "
if not defined driver_index goto RUN_INSTALL_PRINTER_DRIVER
set "selected_driver="
powershell -NoProfile -Command "$drivers = Get-PrinterDriver -ErrorAction SilentlyContinue; if ($drivers.Count -ge %driver_index%) { Write-Host ($drivers[%driver_index%-1].Name) }"
echo.
set "selected_driver_manual="
set /p "selected_driver_manual=Nama driver (atau Enter gunakan dari daftar): "
if defined selected_driver_manual set "selected_driver=%selected_driver_manual%"
echo.
echo 4.4. Membuat antrean printer...
echo.
powershell -NoProfile -Command "Add-Printer -Name '%printer_name%' -DriverName '%selected_driver%' -PortName '%selected_port%' -ErrorAction Stop"
if errorlevel 1 (
    echo [ERROR] Gagal membuat antrean printer.
    echo Mencoba metode alternatif dengan printui.dll...
    rundll32 printui.dll,PrintUIEntry /if /b "%printer_name%" /f "%inf_path%" /r "%selected_port%" /m "%selected_driver%"
    if errorlevel 1 (
        echo [ERROR] Gagal membuat antrean printer dengan kedua metode.
        echo Cek:
        echo - Port %selected_port% valid dan tersedia
        echo - Driver %selected_driver% terdaftar dengan benar
        echo - Nama printer %printer_name% belum digunakan
        pause
        goto MAIN_MENU
    ) else echo Antrean printer berhasil dibuat via printui.dll.
) else echo Antrean printer berhasil dibuat.
echo.
echo 4.5. Status printer yang baru dibuat:
echo.
powershell -NoProfile -Command "$printer = Get-Printer -Name '%printer_name%' -ErrorAction SilentlyContinue; if ($printer) { Write-Host ('Name: ' + $printer.Name); Write-Host ('DriverName: ' + $printer.DriverName); Write-Host ('PortName: ' + $printer.PortName); Write-Host ('PrinterStatus: ' + $printer.PrinterStatus); Write-Host ('Type: ' + $printer.Type) } else { Write-Host 'Printer tidak ditemukan.' }"
echo.
echo 4.6. Opsi tambahan:
echo.
echo  [1] Buka properti printer
echo  [2] Tes cetak halaman
echo  [3] Set sebagai printer default
echo  [4] Selesai
echo.
set "printer_extra_opt="
set /p "printer_extra_opt=Pilih opsi: "
if "%printer_extra_opt%"=="1" (
    rundll32 printui.dll,PrintUIEntry /p /n "%printer_name%"
    echo Properti printer dibuka.
)
if "%printer_extra_opt%"=="2" (
    echo Melakukan tes cetak...
    powershell -NoProfile -Command "Invoke-Command -ScriptBlock { Add-Type -AssemblyName System.Drawing; $printer = New-Object System.Drawing.Printing.PrintDocument; $printer.PrinterSettings.PrinterName = '%printer_name%'; if ($printer.PrinterSettings.IsValid) { $printer.Print(); Write-Host 'Tes cetak berhasil dikirim.' } else { Write-Host 'Printer tidak valid.' } } -ErrorAction SilentlyContinue"
    echo Tes cetak selesai.
)
if "%printer_extra_opt%"=="3" (
    powershell -NoProfile -Command "Set-DefaultPrinter -Name '%printer_name%' -ErrorAction SilentlyContinue"
    if errorlevel 1 (echo [ERROR] Gagal set sebagai default.) else echo Printer %printer_name% diatur sebagai default.
)
echo.
echo ===================================================
echo  SELESAI! Perbaikan & pemasangan driver printer selesai.
echo ===================================================
echo.
echo Ringkasan:
echo - Driver printer didaftarkan dari: %inf_path%
echo - Antrean printer: %printer_name%
echo - Port: %selected_port%
echo - Driver: %selected_driver%
echo.
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
:: == MANAJEMEN APLIKASI: LIHAT PROGRAM TERINSTALL
:: ==================================================================

:RUN_LIST_INSTALLED_APPS
cls
echo ===================================================
echo           LIHAT PROGRAM TERINSTALL
echo ===================================================
echo.
echo Daftar program yang terinstall di sistem:
echo.
powershell -NoProfile -Command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize"
echo.
echo.
echo Daftar program user (Current User):
echo.
powershell -NoProfile -Command "Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize"
echo.
echo Tekan tombol untuk melanjutkan...
pause >nul
goto MAIN_MENU


:: ==================================================================
:: == MANAJEMEN APLIKASI: UNINSTALL PROGRAM PAKSA
:: ==================================================================

:RUN_UNINSTALL_APP_FORCE
cls
echo ===================================================
echo         UNINSTALL PROGRAM PAKSA
echo ===================================================
echo.
echo Masukkan nama program yang ingin di-uninstall.
echo Gunakan nama persis seperti yang muncul di list program.
echo.
set "app_name="
set /p "app_name=Nama program: "
if not defined app_name (
    echo Nama program tidak boleh kosong.
    pause
    goto MAIN_MENU
)
echo.
echo Mencari program: %app_name%...
set "found=0"
for /f "tokens=*" %%a in ('reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%app_name%" 2^>nul ^| findstr /i "UninstallString"') do (
    set "found=1"
    echo Ditemukan di registry sistem.
)
for /f "tokens=*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%app_name%" 2^>nul ^| findstr /i "UninstallString"') do (
    set "found=1"
    echo Ditemukan di registry user.
)
if "!found!"=="0" (
    echo Program tidak ditemukan.
    pause
    goto MAIN_MENU
)
echo.
echo Mencoba uninstall menggunakan wmic...
wmic product where "name like '%%app_name%%'" call uninstall /nointeractive
if errorlevel 1 (
    echo WMIC gagal. Mencoba metode alternatif...
    powershell -NoProfile -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like '*%app_name%*' } | ForEach-Object { Write-Host ('Menguninstall: ' + $_.Name); $_.Uninstall() }"
)
echo.
echo Selesai. Jika gagal, gunakan Control Panel Programs and Features.
pause
goto MAIN_MENU


:: ==================================================================
:: == MANAJEMEN APLIKASI: DISABLE STARTUP APPS
:: ==================================================================

:RUN_DISABLE_STARTUP_APPS
cls
echo ===================================================
echo          DISABLE STARTUP APPS
echo ===================================================
echo.
echo Daftar aplikasi startup saat ini:
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_StartupCommand | Select-Object Name,Command,Location | Format-Table -AutoSize"
echo.
echo Startup apps di Task Manager:
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_StartupCommand | Select-Object Name,Command | Format-Table -AutoSize"
echo.
echo Masukkan nama aplikasi yang ingin di-disable dari startup:
echo (Kosongkan untuk batal)
set "startup_app="
set /p "startup_app=Nama aplikasi: "
if not defined startup_app goto MAIN_MENU
echo.
echo Menonaktifkan %startup_app% dari startup...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%startup_app%" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%startup_app%" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%startup_app%" /f >nul 2>&1
powershell -NoProfile -Command "Disable-ScheduledTask -TaskName '%startup_app%' -ErrorAction SilentlyContinue"
echo Selesai! Aplikasi telah di-disable dari startup.
pause
goto MAIN_MENU


:: ==================================================================
:: == MANAJEMEN APLIKASI: HAPUS BLOATWARE WINDOWS
:: ==================================================================

:RUN_REMOVE_BLOATWARE
cls
echo ===================================================
echo         HAPUS BLOATWARE WINDOWS
echo ===================================================
echo.
echo PERINGATAN: Aplikasi bawaan Windows akan dihapus.
echo Pastikan Anda tidak membutuhkan aplikasi ini.
echo.
echo Aplikasi yang akan dihapus:
echo - Xbox Gaming
echo - Cortana
echo - 3D Viewer
echo - Windows Maps
echo - Weather
echo - Money
echo - News
echo - Sports
echo.
set "bloat_confirm="
set /p "bloat_confirm=Lanjutkan? (Y/N): "
if /i not "!bloat_confirm!"=="Y" goto MAIN_MENU
echo.
echo Menghapus bloatware...
powershell -NoProfile -Command "Get-AppxPackage -AllUsers | Where-Object { $_.Name -like '*Xbox*' -or $_.Name -like '*Cortana*' -or $_.Name -like '*3DViewer*' -or $_.Name -like '*Maps*' -or $_.Name -like '*Weather*' -or $_.Name -like '*BingWeather*' -or $_.Name -like '*Money*' -or $_.Name -like '*BingFinance*' -or $_.Name -like '*News*' -or $_.Name -like '*BingNews*' -or $_.Name -like '*Sports*' -or $_.Name -like '*BingSports*' } | Remove-AppxPackage -ErrorAction SilentlyContinue"
echo.
echo Selesai! Bloatware telah dihapus.
echo Beberapa aplikasi mungkin masih muncul tapi tidak dapat dibuka.
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE & DIAGNOSA: CEK SUHU CPU & MOTHERBOARD
:: ==================================================================

:RUN_CHECK_CPU_TEMP
cls
echo ===================================================
echo         CEK SUHU CPU ^& MOTHERBOARD
echo ===================================================
echo.
echo Memeriksa suhu hardware...
echo.
powershell -NoProfile -Command "$cpu = Get-CimInstance MSAcpi_ThermalZoneTemperature -ErrorAction SilentlyContinue; if ($cpu) { foreach ($c in $cpu) { $temp = [math]::Round(($c.CurrentTemperature / 10) - 273.15, 2); Write-Host ('Zone: ' + $c.InstanceName); Write-Host ('Suhu: ' + $temp + ' C') } } else { Write-Host 'Sensor suhu tidak tersedia. Mencoba alternatif...' }"
echo.
powershell -NoProfile -Command "try { $wmi = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace 'root/wmi' -ErrorAction SilentlyContinue; if ($wmi) { foreach ($w in $wmi) { $temp = [math]::Round(($w.CurrentTemperature / 10) - 273.15, 2); Write-Host ('Zone: ' + $w.InstanceName); Write-Host ('Suhu: ' + $temp + ' C') } } else { Write-Host 'Sensor suhu WMI tidak tersedia.' } } catch { Write-Host 'Gagal membaca suhu via WMI.' }"
echo.
echo Catatan: Tidak semua motherboard/laptop mendukung pembacaan suhu via WMI.
echo Untuk detail lebih akurat, gunakan software seperti HWMonitor atau CoreTemp.
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE & DIAGNOSA: TEST AUDIO OUTPUT
:: ==================================================================

:RUN_TEST_AUDIO
cls
echo ===================================================
echo              TEST AUDIO OUTPUT
echo ===================================================
echo.
echo Memutar suara test...
echo.
powershell -NoProfile -Command "$player = New-Object Media.SoundPlayer; $player.SoundLocation = 'C:\Windows\Media\Windows Error.wav'; $player.PlaySync(); Write-Host 'Suara test diputar: Windows Error.wav'"
echo.
echo Jika Anda mendengar suara, audio berfungsi normal.
echo Jika tidak, cek:
echo - Driver audio terinstall?
echo - Speaker/earphone terhubung?
echo - Volume tidak mute?
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE & DIAGNOSA: TEST WEBCAM
:: ==================================================================

:RUN_TEST_WEBCAM
cls
echo ===================================================
echo               TEST WEBCAM
echo ===================================================
echo.
echo Mencari webcam yang terhubung...
echo.
powershell -NoProfile -Command "$webcams = Get-CimInstance Win32_PnPEntity | Where-Object { $_.Name -like '*Camera*' -or $_.Name -like '*Webcam*' -or $_.Name -like '*Integrated Camera*' }; if ($webcams) { Write-Host 'Webcam terdeteksi:'; $webcams | ForEach-Object { Write-Host ('  - ' + $_.Name) } } else { Write-Host 'Tidak ada webcam terdeteksi.' }"
echo.
echo Untuk test visual, jalankan aplikasi Camera Windows:
echo Win + R, ketik: microsoft.windows.camera:
echo.
powershell -NoProfile -Command "Start-Process 'microsoft.windowscamera:' -ErrorAction SilentlyContinue"
echo.
echo Aplikasi Camera dibuka (jika tersedia).
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE & DIAGNOSA: CEK KAPASITAS DISK
:: ==================================================================

:RUN_CHECK_DISK_SPACE
cls
echo ===================================================
echo            CEK KAPASITAS DISK
echo ===================================================
echo.
echo Informasi semua drive:
echo.
powershell -NoProfile -Command "Get-Volume | Select-Object DriveLetter,FileSystemLabel,FileSystem,Size,SizeRemaining,HealthStatus | Format-Table -AutoSize"
echo.
echo Detail kapasitas dan penggunaan:
echo.
powershell -NoProfile -Command "Get-Volume | ForEach-Object { $used = $_.Size - $_.SizeRemaining; $percent = [math]::Round(($used / $_.Size) * 100, 2); Write-Host ('Drive ' + $_.DriveLetter + ':'); Write-Host ('  Label: ' + $_.FileSystemLabel); Write-Host ('  Total: ' + [math]::Round($_.Size / 1GB, 2) + ' GB'); Write-Host ('  Free: ' + [math]::Round($_.SizeRemaining / 1GB, 2) + ' GB'); Write-Host ('  Used: ' + $percent + ' %'); Write-Host ('  Health: ' + $_.HealthStatus); Write-Host '' }"
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE & DIAGNOSA: TEST KEYBOARD & MOUSE
:: ==================================================================

:RUN_TEST_KEYBOARD_MOUSE
cls
echo ===================================================
echo           TEST KEYBOARD ^& MOUSE
echo ===================================================
echo.
echo MEMERIKSA PERIPHERAL TERHUBUNG...
echo.
echo --- KEYBOARD ---
powershell -NoProfile -Command "$keyboards = Get-CimInstance Win32_Keyboard; if ($keyboards) { Write-Host 'Keyboard terdeteksi:'; $keyboards | ForEach-Object { Write-Host ('  - ' + $_.Description) } } else { Write-Host 'Tidak ada keyboard terdeteksi.' }"
echo.
echo --- MOUSE / POINTING DEVICE ---
powershell -NoProfile -Command "$mice = Get-CimInstance Win32_PointingDevice; if ($mice) { Write-Host 'Mouse/Pointing Device terdeteksi:'; $mice | ForEach-Object { Write-Host ('  - ' + $_.Description) } } else { Write-Host 'Tidak ada mouse terdeteksi.' }"
echo.
echo TEST INTERAKTIF:
echo - Tekan tombol keyboard mana saja untuk test keyboard...
echo - Gerakkan mouse untuk test mouse...
echo.
echo Tekan tombol apa saja untuk mengakhiri test...
pause >nul
echo.
echo Test selesai. Jika tidak ada respon, peripheral mungkin bermasalah.
pause
goto MAIN_MENU


:: ==================================================================
:: == NETWORK & USB: FORMAT FLASHDISK VIA DISKPART
:: ==================================================================

:RUN_FORMAT_USB_DISKPART
cls
echo ===================================================
echo       FORMAT FLASHDISK VIA DISKPART
echo ===================================================
echo.
echo PERINGATAN: Semua data di flashdisk akan dihapus permanen!
echo.
set "usb_drive="
set /p "usb_drive=Masukkan huruf drive flashdisk (misal: E): "
if not defined usb_drive (
    echo Huruf drive tidak boleh kosong.
    pause
    goto MAIN_MENU
)
if not exist "%usb_drive%:\" (
    echo Drive %usb_drive%: tidak ditemukan.
    pause
    goto MAIN_MENU
)
echo.
echo Diskpart akan menghapus dan memformat drive %usb_drive%:
echo.
set "confirm="
set /p "confirm=Yakin ingin melanjutkan? (Y/N): "
if /i not "!confirm!"=="Y" goto MAIN_MENU
echo.
echo Membuat script diskpart...
echo select disk %usb_drive% > "%temp%\formatusb.txt"
echo clean >> "%temp%\formatusb.txt"
echo create partition primary >> "%temp%\formatusb.txt"
echo format fs=ntfs quick >> "%temp%\formatusb.txt"
echo assign >> "%temp%\formatusb.txt"
echo.
echo Menjalankan diskpart...
diskpart /s "%temp%\formatusb.txt"
del "%temp%\formatusb.txt" >nul 2>&1
echo.
echo Selesai! Flashdisk telah diformat.
pause
goto MAIN_MENU


:: ==================================================================
:: == NETWORK & USB: RESET NETWORK FULL
:: ==================================================================

:RUN_RESET_NETWORK_FULL
cls
echo ===================================================
echo          RESET NETWORK FULL
echo ===================================================
echo.
echo Mengembalikan semua setting jaringan ke default...
echo Proses ini akan:
echo - Reset Winsock
echo - Reset TCP/IP stack
echo - Flush DNS
echo - Release/Renew IP
echo - Hapus cache ARP dan routing
echo.
set "net_confirm="
set /p "net_confirm=Lanjutkan? (Y/N): "
if /i not "!net_confirm!"=="Y" goto MAIN_MENU
echo.
echo 1. Reset Winsock...
netsh winsock reset
echo.
echo 2. Reset TCP/IP stack...
netsh int ip reset
echo.
echo 3. Flush DNS...
ipconfig /flushdns
echo.
echo 4. Release IP...
ipconfig /release
echo.
echo 5. Renew IP...
ipconfig /renew
echo.
echo 6. Hapus cache ARP...
arp -d *
echo.
echo 7. Hapus cache routing...
route -f
echo.
echo 8. Flush NetBIOS cache...
nbtstat -R
echo.
echo 9. Reset Firewall ke default (opsional)...
netsh advfirewall reset
echo.
echo Selesai! Jaringan telah di-reset ke default.
echo Restart komputer disarankan.
pause
goto MAIN_MENU


:: ==================================================================
:: == USER & AKUN: BUAT USER BARU
:: ==================================================================

:RUN_CREATE_NEW_USER
cls
echo ===================================================
echo             BUAT USER BARU
echo ===================================================
echo.
set "new_username="
set /p "new_username=Username baru: "
if not defined new_username (
    echo Username tidak boleh kosong.
    pause
    goto MAIN_MENU
)
set "new_password="
set /p "new_password=Password: "
if not defined new_password (
    echo Password tidak boleh kosong.
    pause
    goto MAIN_MENU
)
echo.
echo Membuat user %new_username%...
net user "%new_username%" "%new_password%" /add
if errorlevel 1 (
    echo [ERROR] Gagal membuat user.
) else (
    echo User berhasil dibuat.
    echo.
    echo Menambahkan ke grup Administrators?
    set "admin_confirm="
    set /p "admin_confirm=Tambah sebagai admin? (Y/N): "
    if /i "!admin_confirm!"=="Y" (
        net localgroup Administrators "%new_username%" /add
        echo User ditambahkan ke grup Administrators.
    )
)
pause
goto MAIN_MENU


:: ==================================================================
:: == USER & AKUN: HAPUS USER PROFILE
:: ==================================================================

:RUN_DELETE_USER_PROFILE
cls
echo ===================================================
echo           HAPUS USER PROFILE
echo ===================================================
echo.
echo Daftar user di sistem:
echo.
net user
echo.
set "del_username="
set /p "del_username=Username yang ingin dihapus profile-nya: "
if not defined del_username (
    echo Username tidak boleh kosong.
    pause
    goto MAIN_MENU
)
echo.
echo PERINGATAN: Profile dan data user akan dihapus permanen!
set "del_confirm="
set /p "del_confirm=Yakin ingin menghapus profile %del_username%? (Y/N): "
if /i not "!del_confirm!"=="Y" goto MAIN_MENU
echo.
echo Menghapus user %del_username%...
net user "%del_username%" /delete
if errorlevel 1 (
    echo [ERROR] Gagal menghapus user.
) else (
    echo User berhasil dihapus.
    echo.
    echo Menghapus folder profile (jika masih ada)...
    if exist "C:\Users\%del_username%" (
        rd /s /q "C:\Users\%del_username%"
        echo Folder profile dihapus.
    )
)
pause
goto MAIN_MENU


:: ==================================================================
:: == FITUR KHUSUS LAPTOP: CEK KESEHATAN BATERAI DETAIL
:: ==================================================================

:RUN_BATTERY_DETAIL
cls
echo ===================================================
echo      CEK KESEHATAN BATERAI DETAIL
echo ===================================================
echo.
echo Membuat laporan detail baterai...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Battery_Detail.html" /duration 7 >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Gagal. Fitur ini hanya untuk device dengan baterai.
    pause
    goto MAIN_MENU
)
echo.
echo Laporan detail berhasil dibuat di Desktop.
echo.
echo Informasi yang ditampilkan:
echo - Cycle count (berapa kali charge/discharge)
echo - Design capacity vs Full charge capacity
echo - Degradation capacity
echo - History penggunaan baterai 7 hari terakhir
echo.
start "" "%USERPROFILE%\Desktop\Battery_Detail.html"
pause
goto MAIN_MENU


:: ==================================================================
:: == FITUR KHUSUS LAPTOP: CALIBRATE BATTERY
:: ==================================================================

:RUN_CALIBRATE_BATTERY
cls
echo ===================================================
echo          CALIBRATE BATTERY
echo ===================================================
echo.
echo Calibrasi baterai akan:
echo 1. Charge baterai ke 100%% (jika belum)
echo 2. Discharge hingga 0%%
echo 3. Charge kembali ke 100%%
echo.
echo PERINGATAN: Proses ini memakan waktu beberapa jam.
echo Jangan matikan laptop selama proses berjalan.
echo.
set "calib_confirm="
set /p "calib_confirm=Lanjutkan? (Y/N): "
if /i not "!calib_confirm!"=="Y" goto MAIN_MENU
echo.
echo Langkah-langkah manual:
echo.
echo 1. Charge laptop hingga 100%%, biarkan 1 jam.
echo 2. Gunakan laptop sampai baterai habis dan mati sendiri.
echo 3. Charge kembali hingga 100%% tanpa dinyalakan.
echo 4. Nyalakan laptop, battery indicator seharusnya lebih akurat.
echo.
echo Untuk kalibrasi otomatis, gunakan software bawaan produsen.
echo (misal: ASUS Battery Health Charging, Lenovo Vantage, dll)
pause
goto MAIN_MENU


:: ==================================================================
:: == MAINTENANCE: SCHEDULED AUTO CLEANUP
:: ==================================================================

:RUN_SCHEDULED_CLEANUP
cls
echo ===================================================
echo        SCHEDULED AUTO CLEANUP
echo ===================================================
echo.
echo Membuat task scheduler untuk otomatis bersihkan temp files.
echo.
set "task_name=AutoCleanup"
schtasks /query /tn "%task_name%" >nul 2>&1
if errorlevel 1 (
    echo Task belum ada. Membuat task baru...
    schtasks /create /tn "%task_name%" /tr "powershell -Command \"Get-ChildItem -Path $env:TEMP -Recurse -Force | Remove-Item -Force -ErrorAction SilentlyContinue; Get-ChildItem -Path 'C:\Windows\Temp' -Recurse -Force | Remove-Item -Force -ErrorAction SilentlyContinue\"" /sc weekly /d SUN /st 02:00 /ru SYSTEM /f
    if errorlevel 1 (
        echo [ERROR] Gagal membuat task.
    ) else (
        echo Task berhasil dibuat!
        echo Akan berjalan setiap hari Minggu jam 02:00.
    )
) else (
    echo Task sudah ada.
    echo.
    echo  [1] Hapus task
    echo  [2] Biarkan task
    set "task_opt="
    set /p "task_opt=Pilih opsi: "
    if "!task_opt!"=="1" (
        schtasks /delete /tn "%task_name%" /f
        echo Task berhasil dihapus.
    )
)
pause
goto MAIN_MENU


:: ==================================================================
:: == MAINTENANCE: OPTIMIZE SSD
:: ==================================================================

:RUN_OPTIMIZE_SSD
cls
echo ===================================================
echo            OPTIMIZE SSD
echo ===================================================
echo.
echo Mendeteksi drive SSD...
echo.
powershell -NoProfile -Command "$ssds = Get-PhysicalDisk | Where-Object { $_.MediaType -eq 'SSD' }; if ($ssds) { Write-Host 'Drive SSD terdeteksi:'; $ssds | ForEach-Object { Write-Host ('  - ' + $_.FriendlyName) } } else { Write-Host 'Tidak ada SSD terdeteksi.' }"
echo.
echo Menjalankan TRIM pada semua drive...
powershell -NoProfile -Command "Optimize-Volume -Defrag -Verbose -ErrorAction SilentlyContinue"
echo.
echo Selesai! SSD telah dioptimasi (TRIM).
pause
goto MAIN_MENU


:: ==================================================================
:: == MAINTENANCE: DEFRAG HDD
:: ==================================================================

:RUN_DEFRAG_HDD
cls
echo ===================================================
echo              DEFRAG HDD
echo ===================================================
echo.
echo Mendeteksi drive HDD...
echo.
powershell -NoProfile -Command "$hdds = Get-PhysicalDisk | Where-Object { $_.MediaType -eq 'HDD' }; if ($hdds) { Write-Host 'Drive HDD terdeteksi:'; $hdds | ForEach-Object { Write-Host ('  - ' + $_.FriendlyName) } } else { Write-Host 'Tidak ada HDD terdeteksi.' }"
echo.
echo Defragmentasi semua drive HDD...
defrag C: /O /V
defrag D: /O /V >nul 2>&1
defrag E: /O /V >nul 2>&1
echo.
echo Selesai! HDD telah didefragmentasi.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM: EMPTY RECYCLE BIN FORCE
:: ==================================================================

:RUN_EMPTY_RECYCLE_BIN_FORCE
cls
echo ===================================================
echo         EMPTY RECYCLE BIN FORCE
echo ===================================================
echo.
echo Membersihkan Recycle Bin secara paksa...
echo.
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo.
echo Membersihkan file di $Recycle.Bin (hidden)...
for /d %%d in (C:\$Recycle.Bin) do (
    rd /s /q "%%d" >nul 2>&1
)
for /d %%d in (D:\$Recycle.Bin) do (
    rd /s /q "%%d" >nul 2>&1
)
for /d %%d in (E:\$Recycle.Bin) do (
    rd /s /q "%%d" >nul 2>&1
)
echo.
echo Selesai! Recycle Bin telah dikosongkan paksa.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM: CEK WINDOWS ACTIVATION
:: ==================================================================

:RUN_CHECK_WINDOWS_ACTIVATION
cls
echo ===================================================
echo        CEK WINDOWS ACTIVATION
echo ===================================================
echo.
echo Memeriksa status aktivasi Windows...
echo.
cscript //nologo "%SystemRoot%\System32\slmgr.vbs" /dli
echo.
echo.
echo Status detail:
cscript //nologo "%SystemRoot%\System32\slmgr.vbs" /xpr
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM: CLEAN THUMBNAILS & ICON CACHE
:: ==================================================================

:RUN_CLEAN_THUMBNAILS_ICONS
cls
echo ===================================================
echo     CLEAN THUMBNAILS ^& ICON CACHE
echo ===================================================
echo.
echo Membersihkan cache thumbnail dan ikon yang mungkin corrupt...
echo.
echo 1. Menghentikan Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
echo.
echo 2. Menghapus file cache ikon...
del /a /f /q "%localappdata%\IconCache.db" >nul 2>&1
del /a /f /q "%localappdata%\IconCache_*.db" >nul 2>&1
echo.
echo 3. Menghapus file cache thumbnail...
del /a /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
rd /s /q "%localappdata%\Microsoft\Windows\Explorer\IconCache" >nul 2>&1
echo.
echo 4. Membersihkan cache icon sistem...
del /a /f /q "%localappdata%\Microsoft\Windows\Explorer\*.db" >nul 2>&1
echo.
echo 5. Menjalankan kembali Windows Explorer...
start explorer.exe
echo.
echo ===================================================
echo  SELESAI! Cache thumbnail dan ikon telah dibersihkan.
echo  Windows akan membangun ulang cache secara otomatis.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM: RESET FONT CACHE
:: ==================================================================

:RUN_RESET_FONT_CACHE
cls
echo ===================================================
echo           RESET FONT CACHE
echo ===================================================
echo.
echo Membersihkan cache font yang mungkin corrupt...
echo.
echo 1. Menghentikan service Windows Font Cache Service...
net stop "FontCache" >nul 2>&1
echo.
echo 2. Menghapus folder font cache...
rd /s /q "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\FontCache" >nul 2>&1
rd /s /q "%localappdata%\FontCache" >nul 2>&1
echo.
echo 3. Menjalankan kembali service Windows Font Cache Service...
net start "FontCache" >nul 2>&1
echo.
echo ===================================================
echo  SELESAI! Font cache telah di-reset.
echo  Font yang tampil aneh seharusnya kembali normal.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM: REPAIR MICROSOFT OFFICE
:: ==================================================================

:RUN_REPAIR_OFFICE
cls
echo ===================================================
echo        REPAIR MICROSOFT OFFICE
echo ===================================================
echo.
echo Mencari instalasi Microsoft Office...
echo.
set "office_found=0"
for /f "tokens=*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun" /s /f "Configuration" 2^>nul ^| findstr "Configuration"') do (
    set "office_found=1"
)
if "!office_found!"=="0" (
    echo Microsoft Office tidak ditemukan atau bukan Click-to-Run.
    echo.
    echo Untuk Office MSI, gunakan Control Panel ^> Programs and Features.
    pause
    goto MAIN_MENU
)
echo.
echo Menjalankan repair Microsoft Office...
echo.
echo PERINGATAN: Pastikan semua aplikasi Office ditutup.
set "repair_confirm="
set /p "repair_confirm=Lanjutkan repair? (Y/N): "
if /i not "!repair_confirm!"=="Y" goto MAIN_MENU
echo.
echo Memulai repair...
powershell -NoProfile -Command "Get-AppxPackage -Name '*Office*' | ForEach-Object { Repair-AppxPackage -PackageName $_.PackageFamilyName -ErrorAction SilentlyContinue }"
echo.
echo Mencoba metode alternatif via MSI...
for /f "tokens=*" %%a in ('dir /b /s "%ProgramFiles%\Microsoft Office\Office16\EXCEL.EXE" 2^>nul') do (
    set "office_path=%%a"
    goto RUN_OFFICE_REPAIR_FOUND
)
echo.
echo Selesai. Jika masih error, coba uninstall dan reinstall Office.
pause
goto MAIN_MENU

:RUN_OFFICE_REPAIR_FOUND
echo.
echo Ditemukan Office di: %office_path%
cd /d "%ProgramFiles%\Microsoft Office\Office16"
excel.exe /repair
echo.
echo Repair command telah dijalankan.
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
powershell -NoProfile -Command "$ErrorActionPreference='SilentlyContinue'; try { $badDrivers = Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue | Where-Object { $_.ConfigManagerErrorCode -ne 0 -and $_.ConfigManagerErrorCode -ne $null }; if ($badDrivers) { Write-Host '=== PERANGKAT BERMASALAH DITEMUKAN ===' -ForegroundColor Red; $badDrivers | Select-Object Name, @{n='Error_Code';e={$_.ConfigManagerErrorCode}}, Status, @{n='Hardware_ID';e={$_.DeviceID}} | Format-Table -AutoSize; Write-Host ''; Write-Host 'Ringkasan Error Code:' -ForegroundColor Yellow; $errorCodes = $badDrivers | Group-Object ConfigManagerErrorCode; $errorCodes | ForEach-Object { $code = $_.Name; $count = $_.Count; $desc = 'Unknown error'; if ($code -eq 1) { $desc = 'Device is not configured correctly' } elseif ($code -eq 3) { $desc = 'The driver might be corrupted' } elseif ($code -eq 10) { $desc = 'The device cannot start' } elseif ($code -eq 19) { $desc = 'Windows cannot start this device' } elseif ($code -eq 22) { $desc = 'Drivers not installed' } elseif ($code -eq 28) { $desc = 'Drivers not installed' } elseif ($code -eq 31) { $desc = 'Cannot load drivers' } elseif ($code -eq 37) { $desc = 'Cannot initialize driver' } elseif ($code -eq 39) { $desc = 'Driver failed to initialize' } elseif ($code -eq 41) { $desc = 'Driver loaded with issues' } elseif ($code -eq 42) { $desc = 'Cannot load driver' } elseif ($code -eq 43) { $desc = 'Cannot verify digital signature' }; Write-Host ('  Code ' + $code + ' (' + $count + ' devices): ' + $desc) }; Write-Host ''; Write-Host ('Ditemukan ' + $badDrivers.Count + ' perangkat bermasalah.') -ForegroundColor Yellow } else { Write-Host '=== SEMUA DRIVER NORMAL ===' -ForegroundColor Green; Write-Host 'Tidak ada perangkat dengan Error Code ditemukan.' -ForegroundColor Green } } catch { Write-Host '[ERROR] Gagal membaca driver: ' $_.Exception.Message -ForegroundColor Red }"
echo.
echo Rekomendasi Tindakan:
echo - Gunakan menu [46] Update Driver untuk update driver bermasalah
echo - Cek Device Manager untuk detail lebih lanjut (devmgmt.msc)
echo - Untuk error code 10/22/28, cek install ulang driver
echo - Untuk error code 43, uninstall driver dan reboot
echo.
echo  [1] Buka Device Manager
echo  [2] Export list error ke file
echo  [0] Kembali
echo.
set "bad_driver_opt="
set /p "bad_driver_opt=Pilih opsi: "
if "%bad_driver_opt%"=="0" goto MAIN_MENU
if "%bad_driver_opt%"=="1" (
    start devmgmt.msc
    echo Device Manager dibuka.
    pause
    goto MAIN_MENU
)
if "%bad_driver_opt%"=="2" (
    echo.
    echo Exporting error list to file...
    powershell -NoProfile -Command "$ErrorActionPreference='SilentlyContinue'; try { $badDrivers = Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue | Where-Object { $_.ConfigManagerErrorCode -ne 0 -and $_.ConfigManagerErrorCode -ne $null }; if ($badDrivers) { $badDrivers | Select-Object Name, ConfigManagerErrorCode, Status, DeviceID | Export-Csv -Path '%USERPROFILE%\Desktop\Driver_Errors.csv' -NoTypeInformation; Write-Host 'Exported to: %USERPROFILE%\Desktop\Driver_Errors.csv' } else { Write-Host 'No errors to export.' } } catch { Write-Host '[ERROR] Gagal export: ' $_.Exception.Message -ForegroundColor Red }"
    echo.
    if exist "%USERPROFILE%\Desktop\Driver_Errors.csv" (
        start "" "%USERPROFILE%\Desktop\Driver_Errors.csv"
    )
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_CHECK_BAD_DRIVERS


:: ==================================================================
:: == DIAGNOSIS: CEK SEMUA DRIVER
:: ==================================================================

:RUN_CHECK_ALL_DRIVERS
cls
echo ===================================================
echo              CEK SEMUA DRIVER SISTEM
echo ===================================================
echo.
echo Memeriksa semua driver yang terinstall di sistem...
echo.
powershell -NoProfile -Command "$drivers = Get-CimInstance Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, DriverDate, ProviderName | Sort-Object DeviceName; if ($drivers) { $drivers | Format-Table -AutoSize } else { Write-Host 'Tidak ada driver ditemukan.' }"
echo.
echo Total driver terinstall:
powershell -NoProfile -Command "(Get-CimInstance Win32_PnPSignedDriver).Count"
echo.
echo  [1] Export ke file CSV
echo  [2] Cek driver lama (lebih dari 2 tahun)
echo  [3] Cek driver tanpa digital signature
echo  [0] Kembali
echo.
set "driver_check_opt="
set /p "driver_check_opt=Pilih opsi: "
if "%driver_check_opt%"=="0" goto MAIN_MENU
if "%driver_check_opt%"=="1" (
    echo.
    echo Exporting driver list to CSV...
    powershell -NoProfile -Command "$drivers = Get-CimInstance Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, DriverDate, ProviderName, InfName | Sort-Object DeviceName; $drivers | Export-Csv -Path '%USERPROFILE%\Desktop\Driver_List.csv' -NoTypeInformation; Write-Host 'Exported to: %USERPROFILE%\Desktop\Driver_List.csv'"
    echo.
    start "" "%USERPROFILE%\Desktop\Driver_List.csv"
    pause
    goto MAIN_MENU
)
if "%driver_check_opt%"=="2" (
    echo.
    echo Mencari driver lama (lebih dari 2 tahun)...
    powershell -NoProfile -Command "$twoYearsAgo = (Get-Date).AddYears(-2); $oldDrivers = Get-CimInstance Win32_PnPSignedDriver | Where-Object { $_.DriverDate -lt $twoYearsAgo }; if ($oldDrivers) { Write-Host 'Driver lama ditemukan:'; $oldDrivers | Select-Object DeviceName, DriverDate, DriverVersion | Format-Table -AutoSize } else { Write-Host 'Tidak ada driver lama ditemukan.' }"
    echo.
    pause
    goto MAIN_MENU
)
if "%driver_check_opt%"=="3" (
    echo.
    echo Mencari driver tanpa digital signature...
    powershell -NoProfile -Command "$unsignedDrivers = Get-CimInstance Win32_PnPSignedDriver | Where-Object { $_.DriverDate -lt [DateTime]'2000-01-01' -or $_.DriverVersion -eq '0.0.0.0' }; if ($unsignedDrivers) { Write-Host 'Driver tanpa signature atau invalid ditemukan:'; $unsignedDrivers | Select-Object DeviceName, DriverVersion, DriverDate | Format-Table -AutoSize } else { Write-Host 'Semua driver memiliki signature valid.' }"
    echo.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_CHECK_ALL_DRIVERS


:: ==================================================================
:: == DIAGNOSIS: UPDATE DRIVER
:: ==================================================================

:RUN_UPDATE_DRIVERS
cls
echo ===================================================
echo              UPDATE DRIVER
echo ===================================================
echo.
echo Fitur ini akan mencoba update driver secara otomatis.
echo.
echo PERINGATAN:
echo - Update driver dilakukan via Windows Update
echo - Proses mungkin memakan waktu lama
echo - Beberapa driver mungkin perlu diupdate manual dari website vendor
echo.
echo  [1] Scan driver yang perlu update via Windows Update
echo  [2] Update driver dari folder lokal
echo  [3] Cek driver update via Device Manager (manual)
echo  [4] Update driver spesifik (pnputil)
echo  [0] Batal
echo.
set "update_driver_opt="
set /p "update_driver_opt=Pilih opsi: "
if "%update_driver_opt%"=="0" goto MAIN_MENU
if "%update_driver_opt%"=="1" (
    echo.
    echo Mencari driver update via Windows Update...
    echo Ini akan membuka Settings Windows Update.
    echo Pilih "Optional updates" atau "Advanced options" untuk driver.
    echo.
    start ms-settings:windowsupdate
    echo Windows Update dibuka.
    echo.
    pause
    goto MAIN_MENU
)
if "%update_driver_opt%"=="2" (
    echo.
    set "driver_folder="
    set /p "driver_folder=Masukkan path folder driver: "
    if not defined driver_folder goto RUN_UPDATE_DRIVERS
    if not exist "%driver_folder%" (
        echo [ERROR] Folder tidak ditemukan: %driver_folder%
        pause
        goto RUN_UPDATE_DRIVERS
    )
    echo.
    echo Mencari file .inf di folder...
    powershell -NoProfile -Command "$infFiles = Get-ChildItem -Path '%driver_folder%' -Filter '*.inf' -ErrorAction SilentlyContinue; if ($infFiles) { $infFiles | ForEach-Object { Write-Host ('  - ' + $_.FullName) } } else { Write-Host 'Tidak ditemukan file .inf.' }"
    echo.
    set "inf_path_manual="
    set /p "inf_path_manual=Masukkan path file .inf untuk install: "
    if not defined inf_path_manual goto RUN_UPDATE_DRIVERS
    if not exist "%inf_path_manual%" (
        echo [ERROR] File tidak ditemukan: %inf_path_manual%
        pause
        goto RUN_UPDATE_DRIVERS
    )
    echo.
    echo Menginstall driver dari %inf_path_manual%...
    pnputil /add-driver "%inf_path_manual%" /install
    if errorlevel 1 (
        echo [ERROR] Gagal menginstall driver.
        echo Mencoba metode alternatif...
        rundll32 printui.dll,PrintUIEntry /ia /m "%inf_path_manual%" /h "Intel" /v "Windows NT x86"
        if errorlevel 1 (
            echo [ERROR] Gagal menginstall driver dengan kedua metode.
        ) else echo Driver berhasil diinstall via printui.dll.
    ) else echo Driver berhasil diinstall via pnputil.
    echo.
    pause
    goto MAIN_MENU
)
if "%update_driver_opt%"=="3" (
    echo.
    echo Membuka Device Manager untuk update driver manual...
    echo.
    echo Langkah manual:
    echo 1. Klik kanan pada perangkat yang ingin diupdate
    echo 2. Pilih "Update driver"
    echo 3. Pilih "Search automatically for drivers" atau "Browse my computer"
    echo.
    start devmgmt.msc
    echo Device Manager dibuka.
    echo.
    pause
    goto MAIN_MENU
)
if "%update_driver_opt%"=="4" (
    echo.
    echo  [1] List driver packages di DriverStore
    echo  [2] Install driver package spesifik
    echo  [3] Remove driver package
    echo  [0] Kembali
    echo.
    set "pnputil_opt="
    set /p "pnputil_opt=Pilih opsi: "
    if "%pnputil_opt%"=="0" goto RUN_UPDATE_DRIVERS
    if "%pnputil_opt%"=="1" (
        echo.
        echo Listing driver packages di DriverStore...
        pnputil /enum-drivers
        echo.
        pause
        goto RUN_UPDATE_DRIVERS
    )
    if "%pnputil_opt%"=="2" (
        echo.
        set "inf_install_path="
        set /p "inf_install_path=Masukkan path file .inf: "
        if not defined inf_install_path goto RUN_UPDATE_DRIVERS
        if not exist "%inf_install_path%" (
            echo [ERROR] File tidak ditemukan.
            pause
            goto RUN_UPDATE_DRIVERS
        )
        echo.
        echo Installing driver package...
        pnputil /add-driver "%inf_install_path%" /install
        echo.
        pause
        goto RUN_UPDATE_DRIVERS
    )
    if "%pnputil_opt%"=="3" (
        echo.
        echo Listing driver packages untuk remove...
        pnputil /enum-drivers
        echo.
        set "oem_name="
        set /p "oem_name=Masukkan OEM name untuk remove (contoh: oem1.inf): "
        if not defined oem_name goto RUN_UPDATE_DRIVERS
        echo.
        echo Removing driver package %oem_name%...
        pnputil /delete-driver "%oem_name%" /uninstall
        echo.
        pause
        goto RUN_UPDATE_DRIVERS
    )
    echo Pilihan tidak valid.
    goto RUN_UPDATE_DRIVERS
)
echo Pilihan tidak valid.
goto RUN_UPDATE_DRIVERS


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


:: ==================================================================
:: == PRIVACY & HISTORY: CLEAR RECENT FILES
:: ==================================================================

:RUN_CLEAR_RECENT_FILES
cls
echo ===================================================
echo          CLEAR RECENT FILES
echo ===================================================
echo.
echo Membersihkan history dokumen, run, dan recent files...
echo.
echo 1. Clear jump list...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1
echo.
echo 2. Clear run history...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1
echo.
echo 3. Clear recent documents...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1
echo.
echo 4. Clear typed paths...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >nul 2>&1
echo.
echo 5. Clear recent files from Office...
reg delete "HKCU\Software\Microsoft\Office\*\User MRU" /f >nul 2>&1
echo.
echo 6. Clear recent files from Windows Media Player...
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /f >nul 2>&1
echo.
echo ===================================================
echo  SELESAI! History recent files telah dibersihkan.
echo ===================================================
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == PRIVACY & HISTORY: CLEAR RUN HISTORY
:: ==================================================================

:RUN_CLEAR_RUN_HISTORY
cls
echo ===================================================
echo           CLEAR RUN HISTORY
echo ===================================================
echo.
echo Membersihkan history command prompt run...
echo.
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1
echo.
echo Selesai! History run CMD telah dibersihkan.
pause
goto MAIN_MENU


:: ==================================================================
:: == PRIVACY & HISTORY: TOGGLE CORTANA
:: ==================================================================

:RUN_TOGGLE_CORTANA
cls
echo ===================================================
echo           TOGGLE CORTANA
echo ===================================================
echo.
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana >nul 2>&1
if errorlevel 1 (
    echo Cortana belum diatur di registry.
    echo.
    echo  [1] Matikan Cortana
    echo  [2] Aktifkan Cortana
    echo  [0] Batal
    echo.
    set "cortana_opt="
    set /p "cortana_opt=Pilih opsi: "
    if "!cortana_opt!"=="1" (
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
        echo Cortana telah dimatikan.
    )
    if "!cortana_opt!"=="2" (
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 1 /f
        echo Cortana telah diaktifkan.
    )
) else (
    reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana | findstr "0x0" >nul
    if errorlevel 1 (
        echo Status Cortana: AKTIF
        echo.
        echo  [1] Matikan Cortana
        echo  [0] Batal
        set "cortana_opt="
        set /p "cortana_opt=Pilih opsi: "
        if "!cortana_opt!"=="1" (
            reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
            echo Cortana telah dimatikan.
        )
    ) else (
        echo Status Cortana: NONAKTIF
        echo.
        echo  [1] Aktifkan Cortana
        echo  [0] Batal
        set "cortana_opt="
        set /p "cortana_opt=Pilih opsi: "
        if "!cortana_opt!"=="1" (
            reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 1 /f
            echo Cortana telah diaktifkan.
        )
    )
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == PRIVACY & HISTORY: TOGGLE TELEMETRY
:: ==================================================================

:RUN_TOGGLE_TELEMETRY
cls
echo ===================================================
echo          TOGGLE TELEMETRY
echo ===================================================
echo.
echo Telemetry Windows mengirim data penggunaan ke Microsoft.
echo.
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry >nul 2>&1
if errorlevel 1 (
    echo Telemetry belum diatur di registry.
    echo.
    echo  [1] Matikan Telemetry (Minimal)
    echo  [2] Aktifkan Telemetry (Full)
    echo  [0] Batal
    echo.
    set "telemetry_opt="
    set /p "telemetry_opt=Pilih opsi: "
    if "!telemetry_opt!"=="1" (
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
        echo Telemetry telah dimatikan (Minimal).
    )
    if "!telemetry_opt!"=="2" (
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 3 /f
        echo Telemetry telah diaktifkan (Full).
    )
) else (
    reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry | findstr "0x0" >nul
    if errorlevel 1 (
        echo Status Telemetry: AKTIF/DEFAULT
        echo.
        echo  [1] Matikan Telemetry (Minimal)
        echo  [0] Batal
        set "telemetry_opt="
        set /p "telemetry_opt=Pilih opsi: "
        if "!telemetry_opt!"=="1" (
            reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
            echo Telemetry telah dimatikan (Minimal).
        )
    ) else (
        echo Status Telemetry: NONAKTIF (Minimal)
        echo.
        echo  [1] Aktifkan Telemetry (Full)
        echo  [0] Batal
        set "telemetry_opt="
        set /p "telemetry_opt=Pilih opsi: "
        if "!telemetry_opt!"=="1" (
            reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 3 /f
            echo Telemetry telah diaktifkan (Full).
        )
    )
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == PRIVACY & HISTORY: TOGGLE NOTIFICATIONS
:: ==================================================================

:RUN_TOGGLE_NOTIFICATIONS
cls
echo ===================================================
echo       TOGGLE NOTIFICATIONS (FOCUS MODE)
echo ===================================================
echo.
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled >nul 2>&1
if errorlevel 1 (
    echo Notifications belum diatur di registry.
    echo.
    echo  [1] Matikan Notifications (Focus Mode)
    echo  [2] Aktifkan Notifications
    echo  [0] Batal
    echo.
    set "notif_opt="
    set /p "notif_opt=Pilih opsi: "
    if "!notif_opt!"=="1" (
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
        echo Notifications telah dimatikan (Focus Mode aktif).
    )
    if "!notif_opt!"=="2" (
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 1 /f
        echo Notifications telah diaktifkan.
    )
) else (
    reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled | findstr "0x0" >nul
    if errorlevel 1 (
        echo Status Notifications: AKTIF
        echo.
        echo  [1] Matikan Notifications (Focus Mode)
        echo  [0] Batal
        set "notif_opt="
        set /p "notif_opt=Pilih opsi: "
        if "!notif_opt!"=="1" (
            reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
            echo Notifications telah dimatikan (Focus Mode aktif).
        )
    ) else (
        echo Status Notifications: NONAKTIF (Focus Mode)
        echo.
        echo  [1] Aktifkan Notifications
        echo  [0] Batal
        set "notif_opt="
        set /p "notif_opt=Pilih opsi: "
        if "!notif_opt!"=="1" (
            reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 1 /f
            echo Notifications telah diaktifkan.
        )
    )
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM TWEAKS: RENAME COMPUTER
:: ==================================================================

:RUN_RENAME_COMPUTER
cls
echo ===================================================
echo            RENAME COMPUTER
echo ===================================================
echo.
echo Nama komputer saat ini:
hostname
echo.
set "new_name="
set /p "new_name=Masukkan nama komputer baru: "
if not defined new_name (
    echo Nama komputer tidak boleh kosong.
    pause
    goto MAIN_MENU
)
echo.
echo Mengubah nama komputer menjadi: %new_name%...
wmic computersystem where name="%COMPUTERNAME%" call rename name="%new_name%"
if errorlevel 1 (
    echo [ERROR] Gagal mengubah nama komputer.
) else (
    echo Selesai! Nama komputer berhasil diubah menjadi %new_name%.
    echo Restart komputer untuk menerapkan perubahan.
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM TWEAKS: CHECK COMPUTER NAME
:: ==================================================================

:RUN_CHECK_COMPUTER_NAME
cls
echo ===================================================
echo           CHECK COMPUTER NAME
echo ===================================================
echo.
echo Nama komputer saat ini:
hostname
echo.
echo Nama komputer lengkap:
wmic computersystem get name
echo.
echo Workgroup/Domain:
wmic computersystem get domain
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM TWEAKS: TOGGLE HIBERNATION
:: ==================================================================

:RUN_TOGGLE_HIBERNATION
cls
echo ===================================================
echo          TOGGLE HIBERNATION
echo ===================================================
echo.
powercfg /hibernate | findstr /i "hibernate"
if errorlevel 1 (
    echo Status Hibernation: MATIK
    echo.
    echo  [1] Aktifkan Hibernation
    echo  [0] Batal
    echo.
    set "hib_opt="
    set /p "hib_opt=Pilih opsi: "
    if "!hib_opt!"=="1" (
        powercfg /hibernate on
        echo Hibernation telah diaktifkan.
    )
) else (
    echo Status Hibernation: AKTIF
    echo.
    echo  [1] Matikan Hibernation
    echo  [0] Batal
    echo.
    set "hib_opt="
    set /p "hib_opt=Pilih opsi: "
    if "!hib_opt!"=="1" (
        powercfg /hibernate off
        echo Hibernation telah dimatikan.
        echo File hiberfil.sys akan dihapus saat restart.
    )
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM TWEAKS: CHECK WINDOWS VERSION
:: ==================================================================

:RUN_CHECK_WINDOWS_VERSION
cls
echo ===================================================
echo          CHECK WINDOWS VERSION
echo ===================================================
echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"OS Build" /C:"System Type"
echo.
echo Detail lengkap:
wmic os get Caption,Version,BuildNumber,SerialNumber,WindowsDirectory
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM TWEAKS: CHECK INSTALLED UPDATES
:: ==================================================================

:RUN_CHECK_INSTALLED_UPDATES
cls
echo ===================================================
echo        CHECK INSTALLED UPDATES
echo ===================================================
echo.
echo Daftar update Windows yang terinstall:
echo.
wmic qfe list brief /format:table
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE TEST: TEST MIKROFON
:: ==================================================================

:RUN_TEST_MICROPHONE
cls
echo ===================================================
echo             TEST MIKROFON
echo ===================================================
echo.
echo Mendeteksi perangkat audio input...
echo.
powershell -NoProfile -Command "$mics = Get-CimInstance Win32_PnPEntity | Where-Object { $_.Name -like '*Audio*' -or $_.Name -like '*Microphone*' -or $_.Name -like '*Mic*' }; if ($mics) { Write-Host 'Mikrofon terdeteksi:'; $mics | ForEach-Object { Write-Host ('  - ' + $_.Name) } } else { Write-Host 'Tidak ada mikrofon terdeteksi.' }"
echo.
echo Untuk test audio input:
echo 1. Buka Settings ^> System ^> Sound ^> Input
echo 2. Pilih mikrofon dan klik Test
echo 3. Bicara untuk menguji level input
echo.
echo Atau buka aplikasi Voice Recorder untuk test rekaman.
echo.
powershell -NoProfile -Command "Start-Process 'mspaint:' -ErrorAction SilentlyContinue" >nul 2>&1
echo Voice Recorder dibuka (Sound Recorder terintegrasi di Paint di Windows 11).
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE TEST: TAKE SCREENSHOT
:: ==================================================================

:RUN_TAKE_SCREENSHOT
cls
echo ===================================================
echo            TAKE SCREENSHOT
echo ===================================================
echo.
echo Screenshot akan diambil dan disimpan ke Desktop.
echo.
set "screenshot_name=Screenshot_%date:~-0,2%%date:~-3,2%%date:~-6,2%_%time:~0,2%%time:~3,2%%time:~6,2%.png"
set "screenshot_path=%USERPROFILE%\Desktop\%screenshot_name%"
echo.
echo Menyimpan screenshot ke: %screenshot_path%
echo.
powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds; $bmp = New-Object System.Drawing.Bitmap $bounds.width, $bounds.height; $graphics = [System.Drawing.Graphics]::FromImage($bmp); $graphics.CopyFromScreen($bounds.x, $bounds.y, $bounds.width, $bounds.height); $bmp.Save('%screenshot_path%'); $graphics.Dispose(); $bmp.Dispose(); Write-Host 'Screenshot berhasil disimpan.'"
echo.
if exist "%screenshot_path%" (
    echo Selesai! Screenshot tersimpan di Desktop.
    start "" "%screenshot_path%"
) else (
    echo [ERROR] Gagal mengambil screenshot.
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == HARDWARE TEST: CHECK WEBCAM RESOLUTION
:: ==================================================================

:RUN_CHECK_WEBCAM_RESOLUTION
cls
echo ===================================================
echo         CHECK WEBCAM RESOLUTION
echo ===================================================
echo.
echo Mendeteksi webcam dan resolusi...
echo.
powershell -NoProfile -Command "$webcams = Get-CimInstance Win32_PnPEntity | Where-Object { $_.Name -like '*Camera*' -or $_.Name -like '*Webcam*' }; if ($webcams) { Write-Host 'Webcam terdeteksi:'; $webcams | ForEach-Object { Write-Host ('  - ' + $_.Name) } } else { Write-Host 'Tidak ada webcam terdeteksi.' }"
echo.
echo.
echo Untuk cek resolusi webcam:
echo 1. Buka aplikasi Camera Windows
echo 2. Klik gear icon (Settings)
echo 3. Lihat resolusi yang tersedia
echo.
powershell -NoProfile -Command "Start-Process 'microsoft.windowscamera:' -ErrorAction SilentlyContinue"
echo.
echo Aplikasi Camera dibuka.
pause
goto MAIN_MENU


:: ==================================================================
:: == ADMIN SHORTCUTS: OPEN EVENT VIEWER
:: ==================================================================

:RUN_OPEN_EVENT_VIEWER
cls
echo ===================================================
echo           OPEN EVENT VIEWER
echo ===================================================
echo.
echo Membuka Event Viewer...
echo.
eventvwr.msc
echo.
echo Event Viewer dibuka.
pause
goto MAIN_MENU


:: ==================================================================
:: == ADMIN SHORTCUTS: OPEN TASK MANAGER
:: ==================================================================

:RUN_OPEN_TASK_MANAGER
cls
echo ===================================================
echo           OPEN TASK MANAGER
echo ===================================================
echo.
echo Membuka Task Manager...
echo.
taskmgr
echo.
echo Task Manager dibuka.
pause
goto MAIN_MENU


:: ==================================================================
:: == ADMIN SHORTCUTS: OPEN CONTROL PANEL
:: ==================================================================

:RUN_OPEN_CONTROL_PANEL
cls
echo ===================================================
echo           OPEN CONTROL PANEL
echo ===================================================
echo.
echo Membuka Control Panel...
echo.
control
echo.
echo Control Panel dibuka.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM MAINTENANCE: STARTUP REPAIR
:: ==================================================================

:RUN_STARTUP_REPAIR
cls
echo ===================================================
echo           STARTUP REPAIR WINDOWS
echo ===================================================
echo.
echo Startup Repair akan memperbaiki masalah boot Windows.
echo.
echo PERINGATAN: PC akan restart dan masuk ke lingkungan repair.
echo Pastikan Anda memiliki data penting tersimpan.
echo.
set "startup_repair_confirm="
set /p "startup_repair_confirm=Lanjutkan? (Y/N): "
if /i not "!startup_repair_confirm!"=="Y" goto MAIN_MENU
echo.
echo Memeriksa dan menjalankan Startup Repair...
reagentc /enable >nul 2>&1
bcdedit /set {default} recoveryenabled Yes >nul 2>&1
bcdedit /set {default} bootstatuspolicy IgnoreAllFailures >nul 2>&1
echo.
echo Pengaturan Startup Repair telah diaktifkan.
echo Untuk menjalankan repair sekarang, lakukan salah satu:
echo.
echo  [1] Restart sekarang dan tekan F8/F11 saat boot untuk Advanced Startup
echo  [2] Buka Settings ^> Update ^& Security ^> Recovery ^> Advanced Startup
echo  [3] Gunakan command: shutdown /r /o /t 0
echo.
set "startup_reboot_opt="
set /p "startup_reboot_opt=Restart sekarang ke Advanced Startup? (Y/N): "
if /i "!startup_reboot_opt!"=="Y" (
    shutdown /r /o /t 0
    exit /b
)
echo.
pause
goto MAIN_MENU


:: ==================================================================
:: == SYSTEM MAINTENANCE: SYSTEM IMAGE BACKUP
:: ==================================================================

:RUN_SYSTEM_IMAGE_BACKUP
cls
echo ===================================================
echo         SYSTEM IMAGE BACKUP
echo ===================================================
echo.
echo System Image Backup akan membuat backup lengkap sistem Windows.
echo.
echo PERINGATAN: Proses ini memakan waktu lama dan ruang disk besar.
echo Pastikan drive eksternal tersedia jika backup ke drive lain.
echo.
echo  [1] Backup ke Drive Eksternal (Rekomendasi)
echo  [2] Backup ke Drive Lokal (C:\WindowsImageBackup)
echo  [0] Batal
echo.
set "backup_opt="
set /p "backup_opt=Pilih opsi: "
if "%backup_opt%"=="0" goto MAIN_MENU
if "%backup_opt%"=="1" (
    echo.
    echo Masukkan huruf drive tujuan (misal: D): 
    set "backup_drive="
    set /p "backup_drive=Drive: "
    if not defined backup_drive goto RUN_SYSTEM_IMAGE_BACKUP
    if not exist "%backup_drive%:\" (
        echo Drive %backup_drive%: tidak ditemukan.
        pause
        goto RUN_SYSTEM_IMAGE_BACKUP
    )
    echo.
    echo Memulai System Image Backup ke drive %backup_drive%:...
    echo Proses ini mungkin memakan waktu berjam-jam.
    pause
    wbadmin start backup -backupTarget:%backup_drive%: -include:C: -allCritical -systemState -quiet
    if errorlevel 1 (
        echo [ERROR] Backup gagal. Pastikan drive tersedia dan cukup ruang.
    ) else (
        echo Backup berhasil! File image tersimpan di %backup_drive%:\WindowsImageBackup
    )
    pause
    goto MAIN_MENU
)
if "%backup_opt%"=="2" (
    echo.
    echo PERINGATAN: Backup ke drive lokal akan memakan ruang di C:.
    echo Pastikan cukup ruang tersedia (minimal 50GB).
    set "backup_local_confirm="
    set /p "backup_local_confirm=Lanjutkan? (Y/N): "
    if /i not "!backup_local_confirm!"=="Y" goto MAIN_MENU
    echo.
    echo Memulai System Image Backup ke drive lokal...
    wbadmin start backup -include:C: -allCritical -systemState -backupTarget:D: -quiet >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] Backup ke lokal memerlukan drive terpisah.
        echo Gunakan opsi [1] dengan drive eksternal.
    ) else (
        echo Backup berhasil!
    )
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_SYSTEM_IMAGE_BACKUP


:: ==================================================================
:: == SYSTEM MAINTENANCE: DISK CLEANUP MANAGER
:: ==================================================================

:RUN_DISK_CLEANUP_MANAGER
cls
echo ===================================================
echo        DISK CLEANUP MANAGER
echo ===================================================
echo.
echo Disk Cleanup akan membersihkan file sementara, cache, dan file sampah.
echo.
echo  [1] Disk Cleanup Biasa (C:)
echo  [2] Disk Cleanup dengan Opsi Lengkap (Termasuk Update Windows)
echo  [3] Disk Cleanup Semua Drive
echo  [0] Batal
echo.
set "cleanup_opt="
set /p "cleanup_opt=Pilih opsi: "
if "%cleanup_opt%"=="0" goto MAIN_MENU
if "%cleanup_opt%"=="1" (
    echo.
    echo Membuka Disk Cleanup untuk drive C:...
    cleanmgr /dC:
    echo Disk Cleanup dibuka.
    pause
    goto MAIN_MENU
)
if "%cleanup_opt%"=="2" (
    echo.
    echo Membersihkan dengan opsi lengkap (Windows Update Cache, dll)...
    echo Proses ini akan memakan waktu dan memerlukan restart.
    set "cleanup_full_confirm="
    set /p "cleanup_full_confirm=Lanjutkan? (Y/N): "
    if /i not "!cleanup_full_confirm!"=="Y" goto MAIN_MENU
    echo.
    echo Membersihkan Windows Update Cache dan sampah sistem...
    cleanmgr /sagerun:1
    echo.
    echo Disk Cleanup selesai dengan opsi lengkap.
    pause
    goto MAIN_MENU
)
if "%cleanup_opt%"=="3" (
    echo.
    echo Membuka Disk Cleanup untuk semua drive...
    cleanmgr /dC: /dD: /dE:
    echo Disk Cleanup dibuka untuk multiple drive.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_DISK_CLEANUP_MANAGER


:: ==================================================================
:: == SYSTEM MAINTENANCE: COMPACT OS
:: ==================================================================

:RUN_COMPACT_OS
cls
echo ===================================================
echo              COMPACT OS (KOMPRESI)
echo ===================================================
echo.
echo Compact OS akan mengompresi file sistem Windows untuk menghemat ruang.
echo.
echo Keuntungan:
echo - Hemat 2-5 GB ruang disk (tergantung system)
echo - Mendukung SSD (menggunakan LZX compression)
echo.
echo Kerugian:
echo - Sedikit penurunan performa CPU saat decompress
echo - Tidak disarankan untuk HDD lama
echo.
echo PERINGATAN: Proses ini memakan waktu 10-30 menit.
echo Jangan matikan PC selama proses berjalan.
echo.
echo  [1] Cek Status Compact OS
echo  [2] Aktifkan Compact OS
echo  [3] Nonaktifkan Compact OS (Uncompact)
echo  [0] Batal
echo.
set "compact_opt="
set /p "compact_opt=Pilih opsi: "
if "%compact_opt%"=="0" goto MAIN_MENU
if "%compact_opt%"=="1" (
    echo.
    echo Mengecek status Compact OS...
    compact /compactos:query
    echo.
    pause
    goto MAIN_MENU
)
if "%compact_opt%"=="2" (
    echo.
    echo Mengaktifkan Compact OS...
    echo Ini akan mengompresi file sistem Windows.
    set "compact_enable_confirm="
    set /p "compact_enable_confirm=Lanjutkan? (Y/N): "
    if /i not "!compact_enable_confirm!"=="Y" goto MAIN_MENU
    echo.
    echo Memulai kompresi sistem...
    compact /compactos:always
    echo.
    echo Compact OS berhasil diaktifkan.
    echo Restart komputer disarankan.
    pause
    goto MAIN_MENU
)
if "%compact_opt%"=="3" (
    echo.
    echo Menonaktifkan Compact OS (Uncompact)...
    echo Ini akan mengembalikan file ke ukuran asli.
    set "compact_disable_confirm="
    set /p "compact_disable_confirm=Lanjutkan? (Y/N): "
    if /i not "!compact_disable_confirm!"=="Y" goto MAIN_MENU
    echo.
    echo Memulai dekompresi sistem...
    compact /compactos:never
    echo.
    echo Compact OS berhasil dinonaktifkan.
    echo Restart komputer disarankan.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_COMPACT_OS


:: ==================================================================
:: == SYSTEM MAINTENANCE: PAGE FILE MANAGEMENT
:: ==================================================================

:RUN_PAGE_FILE_MANAGER
cls
echo ===================================================
echo          PAGE FILE MANAGEMENT (VIRTUAL MEMORY)
echo ===================================================
echo.
echo Page file (virtual memory) digunakan ketika RAM penuh.
echo.
echo Status saat ini:
wmic pagefile list /format:list
echo.
echo  [1] Atur Page File Manual (Custom Size)
echo  [2] Atur Page File ke Sistem Managed
echo  [3] Hapus Page File di Drive Tertentu
echo  [4] Cek Usage Page File
echo  [0] Batal
echo.
set "pagefile_opt="
set /p "pagefile_opt=Pilih opsi: "
if "%pagefile_opt%"=="0" goto MAIN_MENU
if "%pagefile_opt%"=="1" (
    echo.
    echo Masukkan ukuran page file dalam MB.
    echo Minimum: 1.5x RAM (MB)
    echo Maximum: 3x RAM (MB)
    echo.
    set "pf_drive="
    set /p "pf_drive=Drive (misal: C): "
    if not defined pf_drive goto RUN_PAGE_FILE_MANAGER
    set "pf_min="
    set /p "pf_min=Ukuran Minimum (MB): "
    if not defined pf_min goto RUN_PAGE_FILE_MANAGER
    set "pf_max="
    set /p "pf_max=Ukuran Maximum (MB): "
    if not defined pf_max goto RUN_PAGE_FILE_MANAGER
    echo.
    echo Mengatur page file di drive %pf_drive%: (Min: %pf_min% MB, Max: %pf_max% MB)...
    wmic pagefileset where "name='%pf_drive%:\\pagefile.sys'" set InitialSize=%pf_min%,MaximumSize=%pf_max%
    if errorlevel 1 (
        echo [ERROR] Gagal mengatur page file.
        echo Mencoba metode alternatif via registry...
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagingFiles" /t REG_MULTI_SZ /d "%pf_drive%:\pagefile.sys %pf_min% %pf_max%" /f
        if errorlevel 1 (
            echo [ERROR] Gagal mengatur page file.
        ) else (
            echo Page file berhasil diatur. Restart diperlukan.
        )
    ) else (
        echo Page file berhasil diatur. Restart diperlukan.
    )
    pause
    goto MAIN_MENU
)
if "%pagefile_opt%"=="2" (
    echo.
    echo Mengatur page file ke System Managed...
    wmic pagefileset where "name='C:\\pagefile.sys'" set InitialSize=0,MaximumSize=0
    if errorlevel 1 (
        echo [ERROR] Gagal mengatur page file.
    ) else (
        echo Page file diatur ke System Managed. Restart diperlukan.
    )
    pause
    goto MAIN_MENU
)
if "%pagefile_opt%"=="3" (
    echo.
    echo Masukkan drive yang ingin dihapus page file-nya:
    set "pf_del_drive="
    set /p "pf_del_drive=Drive (misal: D): "
    if not defined pf_del_drive goto RUN_PAGE_FILE_MANAGER
    echo.
    echo PERINGATAN: Menghapus page file dapat menyebabkan error jika RAM penuh.
    set "pf_del_confirm="
    set /p "pf_del_confirm=Yakin ingin menghapus page file di %pf_del_drive%:? (Y/N): "
    if /i not "!pf_del_confirm!"=="Y" goto MAIN_MENU
    echo.
    echo Menghapus page file di drive %pf_del_drive%:...
    wmic pagefileset where "name='%pf_del_drive%:\\pagefile.sys'" delete
    if errorlevel 1 (
        echo [ERROR] Gagal menghapus page file.
    ) else (
        echo Page file berhasil dihapus. Restart diperlukan.
    )
    pause
    goto MAIN_MENU
)
if "%pagefile_opt%"=="4" (
    echo.
    echo Cek penggunaan page file saat ini...
    powershell -NoProfile -Command "$pagefile = Get-CimInstance Win32_PageFileUsage; if ($pagefile) { $pagefile | Select-Object Name,AllocatedBaseSize,PeakUsage,CurrentUsage | Format-Table -AutoSize } else { Write-Host 'Informasi page file tidak tersedia.' }"
    echo.
    echo Cek performa memory...
    powershell -NoProfile -Command "$os = Get-CimInstance Win32_OperatingSystem; $totalMem = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2); $freeMem = [math]::Round($os.FreePhysicalMemory / 1MB, 2); $usedMem = $totalMem - $freeMem; $percent = [math]::Round(($usedMem / $totalMem) * 100, 2); Write-Host ('Total RAM: ' + $totalMem + ' GB'); Write-Host ('RAM Used: ' + $usedMem + ' GB (' + $percent + ' %)'); Write-Host ('RAM Free: ' + $freeMem + ' GB')"
    echo.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_PAGE_FILE_MANAGER


:: ==================================================================
:: == QUICK ACTIONS: RESTART WITH DELAY
:: ==================================================================

:RUN_RESTART_DELAY
cls
echo ===================================================
echo           RESTART WITH DELAY (TIMER)
echo ===================================================
echo.
echo Restart PC dengan timer. Berguna untuk remote support.
echo.
set "restart_delay_time="
set /p "restart_delay_time=Masukkan waktu delay dalam detik (misal: 60): "
if not defined restart_delay_time goto RUN_RESTART_DELAY
set /a restart_delay_check=restart_delay_time 2>nul
if !restart_delay_check! LSS 1 (
    echo Waktu minimal 1 detik.
    pause
    goto RUN_RESTART_DELAY
)
echo.
echo PC akan restart dalam !restart_delay_time! detik...
echo Untuk membatalkan, gunakan: shutdown /a
echo.
echo.
set "restart_delay_confirm="
set /p "restart_delay_confirm=Lanjutkan? (Y/N): "
if /i not "!restart_delay_confirm!"=="Y" goto MAIN_MENU
echo.
echo Restart dijadwalkan dalam !restart_delay_time! detik...
shutdown /r /t !restart_delay_time! /c "Restart dengan timer dari Toolkit"
echo.
echo [INFO] Untuk membatalkan: shutdown /a
pause
goto MAIN_MENU


:: ==================================================================
:: == QUICK ACTIONS: SHUTDOWN WITH DELAY
:: ==================================================================

:RUN_SHUTDOWN_DELAY
cls
echo ===================================================
echo          SHUTDOWN WITH DELAY (TIMER)
echo ===================================================
echo.
echo Shutdown PC dengan timer. Berguna untuk remote support.
echo.
set "shutdown_delay_time="
set /p "shutdown_delay_time=Masukkan waktu delay dalam detik (misal: 60): "
if not defined shutdown_delay_time goto RUN_SHUTDOWN_DELAY
set /a shutdown_delay_check=shutdown_delay_time 2>nul
if !shutdown_delay_check! LSS 1 (
    echo Waktu minimal 1 detik.
    pause
    goto RUN_SHUTDOWN_DELAY
)
echo.
echo PC akan shutdown dalam !shutdown_delay_time! detik...
echo Untuk membatalkan, gunakan: shutdown /a
echo.
echo.
set "shutdown_delay_confirm="
set /p "shutdown_delay_confirm=Lanjutkan? (Y/N): "
if /i not "!shutdown_delay_confirm!"=="Y" goto MAIN_MENU
echo.
echo Shutdown dijadwalkan dalam !shutdown_delay_time! detik...
shutdown /s /t !shutdown_delay_time! /c "Shutdown dengan timer dari Toolkit"
echo.
echo [INFO] Untuk membatalkan: shutdown /a
pause
goto MAIN_MENU


:: ==================================================================
:: == QUICK ACTIONS: FORCE RESTART
:: ==================================================================

:RUN_FORCE_RESTART
cls
echo ===================================================
echo             FORCE RESTART (RESTART PAKSA)
echo ===================================================
echo.
echo PERINGATAN: Ini akan memaksa restart tanpa menyimpan aplikasi.
echo Gunakan hanya jika PC benar-benar hang dan tidak merespon.
echo.
echo Aplikasi yang sedang berjalan akan ditutup paksa.
echo Data yang belum disimpan akan HILANG.
echo.
set "force_restart_confirm="
set /p "force_restart_confirm=Yakin ingin FORCE RESTART? (Y/N): "
if /i not "!force_restart_confirm!"=="Y" goto MAIN_MENU
echo.
echo Memaksa restart PC sekarang...
shutdown /r /f /t 0 /c "Force restart dari Toolkit"
exit /b


:: ==================================================================
:: == QUICK ACTIONS: SAFE MODE BOOT
:: ==================================================================

:RUN_SAFE_MODE_BOOT
cls
echo ===================================================
echo              SAFE MODE BOOT
echo ===================================================
echo.
echo PC akan restart dan masuk ke Safe Mode.
echo.
echo Safe Mode berguna untuk:
echo - Memperbaiki driver bermasalah
echo - Menghapus malware yang sulit dihapus
echo - Memperbaiki error sistem
echo.
echo PERINGATAN: Anda perlu boot ulang ke normal setelah selesai.
echo.
echo  [1] Safe Mode (Minimal)
echo  [2] Safe Mode with Networking
echo  [3] Safe Mode with Command Prompt
echo  [0] Batal
echo.
set "safemode_opt="
set /p "safemode_opt=Pilih opsi: "
if "%safemode_opt%"=="0" goto MAIN_MENU
if "%safemode_opt%"=="1" (
    echo.
    echo PC akan restart ke Safe Mode (Minimal)...
    bcdedit /set {default} safeboot minimal
    if errorlevel 1 (
        echo [ERROR] Gagal mengatur Safe Mode.
        pause
        goto MAIN_MENU
    )
    echo.
    echo Restart dalam 5 detik...
    shutdown /r /t 5 /c "Restart ke Safe Mode"
    exit /b
)
if "%safemode_opt%"=="2" (
    echo.
    echo PC akan restart ke Safe Mode with Networking...
    bcdedit /set {default} safeboot network
    if errorlevel 1 (
        echo [ERROR] Gagal mengatur Safe Mode.
        pause
        goto MAIN_MENU
    )
    echo.
    echo Restart dalam 5 detik...
    shutdown /r /t 5 /c "Restart ke Safe Mode with Networking"
    exit /b
)
if "%safemode_opt%"=="3" (
    echo.
    echo PC akan restart ke Safe Mode with Command Prompt...
    bcdedit /set {default} safeboot minimal
    bcdedit /set {default} sos on
    if errorlevel 1 (
        echo [ERROR] Gagal mengatur Safe Mode.
        pause
        goto MAIN_MENU
    )
    echo.
    echo Restart dalam 5 detik...
    shutdown /r /t 5 /c "Restart ke Safe Mode with Command Prompt"
    exit /b
)
echo Pilihan tidak valid.
goto RUN_SAFE_MODE_BOOT


:: ==================================================================
:: == QUICK ACTIONS: BOOT TO BIOS/UEFI
:: ==================================================================

:RUN_BOOT_TO_BIOS
cls
echo ===================================================
echo             BOOT TO BIOS/UEFI
echo ===================================================
echo.
echo PC akan restart dan masuk ke BIOS/UEFI setup.
echo.
echo PERINGATAN:
echo - Metode ini menggunakan Advanced Startup Options Windows.
echo - Tidak semua motherboard mendukung metode ini.
echo - Jika gagal, tekan tombol BIOS (F2, F10, Del, F12) saat boot.
echo.
echo  [1] Boot ke BIOS/UEFI Setup
echo  [2] Boot ke Firmware Settings (Windows 11)
echo  [3] Cancel Safe Mode (Jika sebelumnya aktif)
echo  [0] Batal
echo.
set "bios_opt="
set /p "bios_opt=Pilih opsi: "
if "%bios_opt%"=="0" goto MAIN_MENU
if "%bios_opt%"=="1" (
    echo.
    echo Mengatur boot ke BIOS/UEFI...
    shutdown /r /o /t 5 /c "Boot to BIOS/UEFI"
    echo.
    echo PC akan restart dalam 5 detik.
    echo Pilih "Troubleshoot" ^> "Advanced options" ^> "UEFI Firmware Settings"
    echo.
    exit /b
)
if "%bios_opt%"=="2" (
    echo.
    echo Mengatur boot ke Firmware Settings (Windows 11)...
    shutdown /r /o /t 5 /c "Boot to Firmware Settings"
    echo.
    echo PC akan restart dalam 5 detik.
    echo Pilih "Troubleshoot" ^> "Advanced options" ^> "UEFI Firmware Settings"
    echo.
    exit /b
)
if "%bios_opt%"=="3" (
    echo.
    echo Menghapus setting Safe Mode...
    bcdedit /deletevalue {default} safeboot
    bcdedit /deletevalue {default} sos
    if errorlevel 1 (
        echo [ERROR] Gagal menghapus setting Safe Mode atau tidak ada setting.
    ) else (
        echo Setting Safe Mode berhasil dihapus.
        echo PC akan boot normal pada restart berikutnya.
    )
    echo.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_BOOT_TO_BIOS


:: ==================================================================
:: == PERFORMANCE TUNING: POWER PLAN MANAGER
:: ==================================================================

:RUN_POWER_PLAN_MANAGER
cls
echo ===================================================
echo            POWER PLAN MANAGER
echo ===================================================
echo.
echo Power plan mengatur konsumsi daya dan performa sistem.
echo.
echo Power plan tersedia:
echo.
powershell -NoProfile -Command "$plans = powercfg -list; $plans | ForEach-Object { if ($_ -match '(\d+)\s+([^(]+)\(([^)]+)\)') { $id = $matches[1]; $name = $matches[2].Trim(); $status = if ($_ -match '\*') {'[AKTIF]'} else {''}; Write-Host ('  ' + $status + ' ' + $name) } }"
echo.
echo  [1] Power Saver (Hemat Daya)
echo  [2] Balanced (Seimbang)
echo  [3] High Performance (Performa Tinggi)
echo  [4] Ultimate Performance (Performa Ekstrem - Windows 10/11 Pro)
echo  [5] Cek Power Plan Aktif
echo  [0] Batal
echo.
set "powerplan_opt="
set /p "powerplan_opt=Pilih opsi: "
if "%powerplan_opt%"=="0" goto MAIN_MENU
if "%powerplan_opt%"=="1" (
    echo.
    echo Mengatur ke Power Saver...
    powercfg -setactive a1841308-0354-4abc-b7dd-0e6575847f2a
    if errorlevel 1 (echo [ERROR] Gagal mengatur power plan.) else echo Power plan diubah ke Power Saver.
    pause
    goto MAIN_MENU
)
if "%powerplan_opt%"=="2" (
    echo.
    echo Mengatur ke Balanced...
    powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
    if errorlevel 1 (echo [ERROR] Gagal mengatur power plan.) else echo Power plan diubah ke Balanced.
    pause
    goto MAIN_MENU
)
if "%powerplan_opt%"=="3" (
    echo.
    echo Mengatur ke High Performance...
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    if errorlevel 1 (echo [ERROR] Gagal mengatur power plan.) else echo Power plan diubah ke High Performance.
    pause
    goto MAIN_MENU
)
if "%powerplan_opt%"=="4" (
    echo.
    echo Mengatur ke Ultimate Performance...
    powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    if errorlevel 1 (
        echo [ERROR] Ultimate Performance tidak tersedia.
        echo Fitur ini hanya untuk Windows 10/11 Pro/Enterprise.
        echo Untuk mengaktifkan: powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    ) else echo Power plan diubah ke Ultimate Performance.
    pause
    goto MAIN_MENU
)
if "%powerplan_opt%"=="5" (
    echo.
    echo Power plan yang sedang aktif:
    powercfg -getactivescheme
    echo.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_POWER_PLAN_MANAGER


:: ==================================================================
:: == PERFORMANCE TUNING: PERFORMANCE MODE
:: ==================================================================

:RUN_PERFORMANCE_MODE
cls
echo ===================================================
echo            PERFORMANCE MODE
echo ===================================================
echo.
echo Mode performa akan mengoptimalkan sistem untuk kecepatan maksimal.
echo.
echo PERINGATAN: Mode ini akan meningkatkan konsumsi daya dan suhu.
echo Tidak disarankan untuk laptop dengan baterai rendah.
echo.
echo  [1] High Performance Mode (Gaming/Workstation)
echo  [2] Ultimate Performance Mode (Ekstrem)
echo  [3] Balanced Mode (Kembali ke seimbang)
echo  [4] Custom Performance (Optimasi Advanced)
echo  [0] Batal
echo.
set "perf_opt="
set /p "perf_opt=Pilih opsi: "
if "%perf_opt%"=="0" goto MAIN_MENU
if "%perf_opt%"=="1" (
    echo.
    echo Mengatur ke High Performance Mode...
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg -change -monitor-timeout-ac 0
    powercfg -change -monitor-timeout-dc 0
    powercfg -change -standby-timeout-ac 0
    powercfg -change -standby-timeout-dc 0
    powercfg -change -hibernate-timeout-ac 0
    powercfg -change -hibernate-timeout-dc 0
    echo.
    echo High Performance Mode diaktifkan.
    echo - Sleep dan Hibernate dimatikan
    echo - Monitor timeout dimatikan
    pause
    goto MAIN_MENU
)
if "%perf_opt%"=="2" (
    echo.
    echo Mengatur ke Ultimate Performance Mode...
    powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    if errorlevel 1 (
        echo Mengaktifkan Ultimate Performance scheme terlebih dahulu...
        powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
        powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
    )
    powercfg -change -monitor-timeout-ac 0
    powercfg -change -monitor-timeout-dc 0
    powercfg -change -standby-timeout-ac 0
    powercfg -change -standby-timeout-dc 0
    powercfg -change -hibernate-timeout-ac 0
    powercfg -change -hibernate-timeout-dc 0
    echo.
    echo Ultimate Performance Mode diaktifkan.
    echo - Semua limitasi performa dihapus
    echo - Sleep dan Hibernate dimatikan
    pause
    goto MAIN_MENU
)
if "%perf_opt%"=="3" (
    echo.
    echo Mengatur ke Balanced Mode...
    powercfg -setactive 381b4222-f694-41f0-9a85-a6e23a8c635c
    powercfg -change -monitor-timeout-ac 10
    powercfg -change -monitor-timeout-dc 5
    powercfg -change -standby-timeout-ac 30
    powercfg -change -standby-timeout-dc 15
    echo.
    echo Balanced Mode diaktifkan.
    echo - Pengaturan daya dikembalikan ke default
    pause
    goto MAIN_MENU
)
if "%perf_opt%"=="4" (
    echo.
    echo Custom Performance Optimasi Advanced...
    echo.
    echo  [1] Disable CPU Throttling
    echo  [2] Disable HDD Spindown
    echo  [3] Disable USB Selective Suspend
    echo  [4] Enable PCI Express Power Management
    echo  [0] Kembali
    echo.
    set "custom_opt="
    set /p "custom_opt=Pilih opsi: "
    if "%custom_opt%"=="0" goto RUN_PERFORMANCE_MODE
    if "%custom_opt%"=="1" (
        echo.
        echo Disable CPU Throttling...
        powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTAC 0
        powercfg -setactive SCHEME_CURRENT
        echo CPU Throttling dinonaktifkan.
        pause
        goto RUN_PERFORMANCE_MODE
    )
    if "%custom_opt%"=="2" (
        echo.
        echo Disable HDD Spindown...
        powercfg -setacvalueindex SCHEME_CURRENT SUB_DISK DISKIDLE 0
        powercfg -setactive SCHEME_CURRENT
        echo HDD Spindown dinonaktifkan.
        pause
        goto RUN_PERFORMANCE_MODE
    )
    if "%custom_opt%"=="3" (
        echo.
        echo Disable USB Selective Suspend...
        powercfg -setacvalueindex SCHEME_CURRENT SUB_USB USBSELECTIVESUSPEND 0
        powercfg -setactive SCHEME_CURRENT
        echo USB Selective Suspend dinonaktifkan.
        pause
        goto RUN_PERFORMANCE_MODE
    )
    if "%custom_opt%"=="4" (
        echo.
        echo Enable PCI Express Power Management...
        powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0
        powercfg -setactive SCHEME_CURRENT
        echo PCI Express Power Management dinonaktifkan (untuk performa).
        pause
        goto RUN_PERFORMANCE_MODE
    )
    echo Pilihan tidak valid.
    goto RUN_PERFORMANCE_MODE
)
echo Pilihan tidak valid.
goto RUN_PERFORMANCE_MODE


:: ==================================================================
:: == PERFORMANCE TUNING: DISABLE SERVICES
:: ==================================================================

:RUN_DISABLE_SERVICES
cls
echo ===================================================
echo          DISABLE UNNECESSARY SERVICES
echo ===================================================
echo.
echo Menggunakan preset untuk menonaktifkan services yang tidak perlu.
echo.
echo PERINGATAN: Beberapa services mungkin diperlukan oleh aplikasi tertentu.
echo Pastikan Anda tahu fungsi service sebelum menonaktifkannya.
echo.
echo  [1] Gaming Preset (Disable background services)
echo  [2] Minimal Preset (Disable banyak services untuk performa maksimal)
echo  [3] Bloatware Preset (Disable telemetry & ad services)
echo  [4] Restore Default Services
echo  [5] List Disabled Services
echo  [0] Batal
echo.
set "service_opt="
set /p "service_opt=Pilih opsi: "
if "%service_opt%"=="0" goto MAIN_MENU
if "%service_opt%"=="1" (
    echo.
    echo Menggunakan Gaming Preset...
    echo Menonaktifkan background services yang mengganggu gaming...
    sc config "DiagTrack" start= disabled >nul 2>&1
    sc config "WSearch" start= disabled >nul 2>&1
    sc config "SysMain" start= disabled >nul 2>&1
    sc config "XblAuthManager" start= disabled >nul 2>&1
    sc config "XblGameSave" start= disabled >nul 2>&1
    sc config "XboxNetApiSvc" start= disabled >nul 2>&1
    echo.
    echo Gaming Preset diterapkan.
    echo Services yang dinonaktifkan:
    echo - Telemetry (DiagTrack)
    echo - Windows Search (WSearch)
    echo - Superfetch (SysMain)
    echo - Xbox Services
    pause
    goto MAIN_MENU
)
if "%service_opt%"=="2" (
    echo.
    echo Menggunakan Minimal Preset...
    echo Menonaktifkan banyak services untuk performa maksimal...
    sc config "Themes" start= disabled >nul 2>&1
    sc config "wuauserv" start= disabled >nul 2>&1
    sc config "wercplsupport" start= disabled >nul 2>&1
    sc config "WinRM" start= disabled >nul 2>&1
    sc config "WinHttpAutoProxySvc" start= disabled >nul 2>&1
    sc config "XblAuthManager" start= disabled >nul 2>&1
    sc config "XblGameSave" start= disabled >nul 2>&1
    sc config "XboxNetApiSvc" start= disabled >nul 2>&1
    sc config "WMPNetworkSvc" start= disabled >nul 2>&1
    sc config "Wms" start= disabled >nul 2>&1
    echo.
    echo Minimal Preset diterapkan.
    echo Beberapa fitur Windows mungkin tidak berfungsi setelah ini.
    pause
    goto MAIN_MENU
)
if "%service_opt%"=="3" (
    echo.
    echo Menggunakan Bloatware Preset...
    echo Menonaktifkan telemetry dan ad services...
    sc config "DiagTrack" start= disabled >nul 2>&1
    sc config "dmwappushservice" start= disabled >nul 2>&1
    sc config "Advertising" start= disabled >nul 2>&1
    sc config "wbengine" start= disabled >nul 2>&1
    sc config "Wecsvc" start= disabled >nul 2>&1
    sc config "WerSvc" start= disabled >nul 2>&1
    echo.
    echo Bloatware Preset diterapkan.
    echo Telemetry dan ad services dinonaktifkan.
    pause
    goto MAIN_MENU
)
if "%service_opt%"=="4" (
    echo.
    echo Restore Default Services...
    echo Mengembalikan services ke konfigurasi default...
    sc config "Themes" start= auto >nul 2>&1
    sc config "wuauserv" start= auto >nul 2>&1
    sc config "WSearch" start= auto >nul 2>&1
    sc config "SysMain" start= auto >nul 2>&1
    sc config "DiagTrack" start= auto >nul 2>&1
    sc config "dmwappushservice" start= auto >nul 2>&1
    sc config "XblAuthManager" start= auto >nul 2>&1
    sc config "XblGameSave" start= auto >nul 2>&1
    sc config "XboxNetApiSvc" start= auto >nul 2>&1
    echo.
    echo Services dikembalikan ke default.
    echo Restart komputer disarankan.
    pause
    goto MAIN_MENU
)
if "%service_opt%"=="5" (
    echo.
    echo List services yang dinonaktifkan:
    echo.
    sc query type= state= all | findstr /i "STATE_DISABLED"
    echo.
    pause
    goto MAIN_MENU
)
echo Pilihan tidak valid.
goto RUN_DISABLE_SERVICES


:: ==================================================================
:: == PERFORMANCE TUNING: VISUAL EFFECTS TOGGLE
:: ==================================================================

:RUN_VISUAL_EFFECTS_TOGGLE
cls
echo ===================================================
echo            VISUAL EFFECTS TOGGLE
echo ===================================================
echo.
echo Visual effects mempengaruhi performa terutama pada GPU/rendah.
echo.
echo Visual effects saat ini:
echo.
powershell -NoProfile -Command "$key='HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'; $visualfx=(Get-ItemProperty -Path $key -Name VisualFXSetting -ErrorAction SilentlyContinue).VisualFXSetting; if ($visualfx -eq 0) { Write-Host 'Status: Let Windows choose (Default)' } elseif ($visualfx -eq 1) { Write-Host 'Status: All effects enabled' } elseif ($visualfx -eq 2) { Write-Host 'Status: All effects disabled (Best Performance)' } else { Write-Host 'Status: Custom' }"
echo.
echo  [1] Best Performance (Disable all effects)
echo  [2] Best Appearance (Enable all effects)
echo  [3] Let Windows choose (Default)
echo  [4] Custom (Select specific effects)
echo  [0] Batal
echo.
set "visual_opt="
set /p "visual_opt=Pilih opsi: "
if "%visual_opt%"=="0" goto MAIN_MENU
if "%visual_opt%"=="1" (
    echo.
    echo Mengatur ke Best Performance (Disable all effects)...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
    reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 0 /f
    reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 2 /f
    echo.
    echo Best Performance diaktifkan.
    echo Semua visual effects dinonaktifkan.
    echo Restart Explorer untuk menerapkan perubahan.
    taskkill /f /im explorer.exe >nul 2>&1
    start explorer.exe
    pause
    goto MAIN_MENU
)
if "%visual_opt%"=="2" (
    echo.
    echo Mengatur ke Best Appearance (Enable all effects)...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
    reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 1 /f
    reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 1 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 1 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 1 /f
    echo.
    echo Best Appearance diaktifkan.
    echo Semua visual effects diaktifkan.
    echo Restart Explorer untuk menerapkan perubahan.
    taskkill /f /im explorer.exe >nul 2>&1
    start explorer.exe
    pause
    goto MAIN_MENU
)
if "%visual_opt%"=="3" (
    echo.
    echo Mengatur ke Let Windows choose (Default)...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f
    echo.
    echo Pengaturan dikembalikan ke default Windows.
    echo Restart Explorer untuk menerapkan perubahan.
    taskkill /f /im explorer.exe >nul 2>&1
    start explorer.exe
    pause
    goto MAIN_MENU
)
if "%visual_opt%"=="4" (
    echo.
    echo Custom Visual Effects Selection...
    echo.
    echo  [1] Disable animations
    echo  [2] Disable transparency effects
    echo  [3] Disable window shadows
    echo  [4] Disable taskbar animations
    echo  [5] Disable thumbnail previews
    echo  [0] Kembali
    echo.
    set "custom_visual_opt="
    set /p "custom_visual_opt=Pilih opsi: "
    if "%custom_visual_opt%"=="0" goto RUN_VISUAL_EFFECTS_TOGGLE
    if "%custom_visual_opt%"=="1" (
        reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
        echo Animations dinonaktifkan.
        pause
        goto RUN_VISUAL_EFFECTS_TOGGLE
    )
    if "%custom_visual_opt%"=="2" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
        echo Transparency effects dinonaktifkan.
        pause
        goto RUN_VISUAL_EFFECTS_TOGGLE
    )
    if "%custom_visual_opt%"=="3" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 0 /f
        echo Window shadows dinonaktifkan.
        pause
        goto RUN_VISUAL_EFFECTS_TOGGLE
    )
    if "%custom_visual_opt%"=="4" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
        echo Taskbar animations dinonaktifkan.
        pause
        goto RUN_VISUAL_EFFECTS_TOGGLE
    )
    if "%custom_visual_opt%"=="5" (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 2 /f
        echo Thumbnail previews dinonaktifkan.
        pause
        goto RUN_VISUAL_EFFECTS_TOGGLE
    )
    echo Pilihan tidak valid.
    goto RUN_VISUAL_EFFECTS_TOGGLE
)
echo Pilihan tidak valid.
goto RUN_VISUAL_EFFECTS_TOGGLE


:: ==================================================================
:: == PERFORMANCE TUNING: CPU CORE PARKING
:: ==================================================================

:RUN_CPU_CORE_PARKING
cls
echo ===================================================
echo            CPU CORE PARKING
echo ===================================================
echo.
echo Core Parking adalah fitur Windows yang mematikan beberapa core CPU
echo saat idle untuk menghemat daya. Menonaktifkannya meningkatkan performa.
echo.
echo PERINGATAN: Menonaktifkan core parking akan meningkatkan konsumsi daya
echo dan suhu CPU. Hanya gunakan untuk workstation/gaming.
echo.
echo  [1] Disable Core Parking (All Cores Active)
echo  [2] Enable Core Parking (Default - Power Saving)
echo  [3] Check Core Parking Status
echo  [4] Advanced Core Settings
echo  [0] Batal
echo.
set "corepark_opt="
set /p "corepark_opt=Pilih opsi: "
if "%corepark_opt%"=="0" goto MAIN_MENU
if "%corepark_opt%"=="1" (
    echo.
    echo Menonaktifkan Core Parking (Mengaktifkan semua core)...
    echo.
    powershell -NoProfile -Command "$powerPlan = powercfg -getactivescheme; if ($powerPlan -match '(\{[A-F0-9-]+\})') { $guid = $matches[1]; Write-Host ('Power Plan GUID: ' + $guid); $processorGuid = '{54533251-82be-4824-96c7-20deb4f4e8ad}'; $minProc = 0; $maxProc = 100; powercfg -setacvalueindex $guid $processorGuid 5d76a2ca-e8c0-402f-a133-2158492d5ad8 $minProc; powercfg -setacvalueindex $guid $processorGuid 638baff8-7929-4f7a-a624-1f2a003db778 $maxProc; powercfg -setactive $guid; Write-Host 'Core Parking dinonaktifkan.' } else { Write-Host 'Gagal mendapatkan power plan GUID.' }"
    echo.
    echo Core Parking dinonaktifkan.
    echo Semua core CPU akan tetap aktif.
    pause
    goto MAIN_MENU
)
if "%corepark_opt%"=="2" (
    echo.
    echo Mengaktifkan Core Parking (Default)...
    echo.
    powershell -NoProfile -Command "$powerPlan = powercfg -getactivescheme; if ($powerPlan -match '(\{[A-F0-9-]+\})') { $guid = $matches[1]; Write-Host ('Power Plan GUID: ' + $guid); $processorGuid = '{54533251-82be-4824-96c7-20deb4f4e8ad}'; $minProc = 5; $maxProc = 100; powercfg -setacvalueindex $guid $processorGuid 5d76a2ca-e8c0-402f-a133-2158492d5ad8 $minProc; powercfg -setacvalueindex $guid $processorGuid 638baff8-7929-4f7a-a624-1f2a003db778 $maxProc; powercfg -setactive $guid; Write-Host 'Core Parking diaktifkan (default).' } else { Write-Host 'Gagal mendapatkan power plan GUID.' }"
    echo.
    echo Core Parking diaktifkan.
    echo Windows akan mematikan core saat idle untuk hemat daya.
    pause
    goto MAIN_MENU
)
if "%corepark_opt%"=="3" (
    echo.
    echo Cek Status Core Parking...
    echo.
    powershell -NoProfile -Command "$powerPlan = powercfg -getactivescheme; if ($powerPlan -match '(\{[A-F0-9-]+\})') { $guid = $matches[1]; $processorGuid = '{54533251-82be-4824-96c7-20deb4f4e8ad}'; $minProc = powercfg -q $guid $processorGuid 5d76a2ca-e8c0-402f-a133-2158492d5ad8; $maxProc = powercfg -q $guid $processorGuid 638baff8-7929-4f7a-a624-1f2a003db778; Write-Host ('Min Unparked Cores: ' + $minProc + '%%'); Write-Host ('Max Unparked Cores: ' + $maxProc + '%%'); if ($minProc -eq 0) { Write-Host 'Core Parking: DISABLED (All cores active)' } else { Write-Host 'Core Parking: ENABLED (Some cores may park)' } } else { Write-Host 'Gagal membaca status core parking.' }"
    echo.
    pause
    goto MAIN_MENU
)
if "%corepark_opt%"=="4" (
    echo.
    echo Advanced Core Settings...
    echo.
    echo  [1] Set Minimum Unparked Cores (0-100%%)
    echo  [2] Set Maximum Unparked Cores (0-100%%)
    echo  [3] Check CPU Info (Core/Thread count)
    echo  [0] Kembali
    echo.
    set "advanced_core_opt="
    set /p "advanced_core_opt=Pilih opsi: "
    if "%advanced_core_opt%"=="0" goto RUN_CPU_CORE_PARKING
    if "%advanced_core_opt%"=="1" (
        echo.
        set "min_unparked="
        set /p "min_unparked=Masukkan minimum unparked cores (0-100): "
        if not defined min_unparked goto RUN_CPU_CORE_PARKING
        set /a min_unparked_check=min_unparked 2>nul
        if !min_unparked_check! LSS 0 if !min_unparked_check! GTR 100 (
            echo Nilai harus antara 0-100.
            pause
            goto RUN_CPU_CORE_PARKING
        )
        powershell -NoProfile -Command "$powerPlan = powercfg -getactivescheme; if ($powerPlan -match '(\{[A-F0-9-]+\})') { $guid = $matches[1]; $processorGuid = '{54533251-82be-4824-96c7-20deb4f4e8ad}'; powercfg -setacvalueindex $guid $processorGuid 5d76a2ca-e8c0-402f-a133-2158492d5ad8 !min_unparked_check!; powercfg -setactive $guid; Write-Host ('Minimum unparked cores diatur ke ' + !min_unparked_check! + '%%') }"
        pause
        goto RUN_CPU_CORE_PARKING
    )
    if "%advanced_core_opt%"=="2" (
        echo.
        set "max_unparked="
        set /p "max_unparked=Masukkan maximum unparked cores (0-100): "
        if not defined max_unparked goto RUN_CPU_CORE_PARKING
        set /a max_unparked_check=max_unparked 2>nul
        if !max_unparked_check! LSS 0 if !max_unparked_check! GTR 100 (
            echo Nilai harus antara 0-100.
            pause
            goto RUN_CPU_CORE_PARKING
        )
        powershell -NoProfile -Command "$powerPlan = powercfg -getactivescheme; if ($powerPlan -match '(\{[A-F0-9-]+\})') { $guid = $matches[1]; $processorGuid = '{54533251-82be-4824-96c7-20deb4f4e8ad}'; powercfg -setacvalueindex $guid $processorGuid 638baff8-7929-4f7a-a624-1f2a003db778 !max_unparked_check!; powercfg -setactive $guid; Write-Host ('Maximum unparked cores diatur ke ' + !max_unparked_check! + '%%') }"
        pause
        goto RUN_CPU_CORE_PARKING
    )
    if "%advanced_core_opt%"=="3" (
        echo.
        echo CPU Information:
        echo.
        powershell -NoProfile -Command "$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1; Write-Host ('Processor: ' + $cpu.Name); Write-Host ('Cores: ' + $cpu.NumberOfCores); Write-Host ('Logical Processors: ' + $cpu.NumberOfLogicalProcessors); Write-Host ('Max Clock Speed: ' + $cpu.MaxClockSpeed + ' MHz')"
        echo.
        pause
        goto RUN_CPU_CORE_PARKING
    )
    echo Pilihan tidak valid.
    goto RUN_CPU_CORE_PARKING
)
echo Pilihan tidak valid.
goto RUN_CPU_CORE_PARKING