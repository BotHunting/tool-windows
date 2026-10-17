<div align="center">

# 🛠️ Windows Toolkit Gabungan

**Toolkit all-in-one untuk maintenance, optimasi, dan troubleshooting Windows dalam satu file batch script.**

[![Windows](https://img.shields.io/badge/Windows-7%2F8%2F10%2F11-blue?style=flat-square&logo=windows)](https://www.microsoft.com/windows)
[![Batch](https://img.shields.io/badge/Batch-Script-4EAA25?style=flat-square&logo=powershell)](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## 📊 Statistik

- **Total Fitur**: 82 menu utama + 60+ opsi DNS
- **Kategori**: 15 kategori fitur
- **Baris Kode**: 3,234 baris
- **Bahasa**: Indonesia

---

## 🚀 Fitur Utama

### 1️⃣ Windows Update & System
- 🔴 Matikan Windows Update & bersihkan cache update
- 🟢 Aktifkan kembali Windows Update
- 🗑️ Empty Recycle Bin force (bersihkan sampah yang nge-stuck)
- ✅ Cek Windows Activation (verifikasi lisensi aktif/belum)
- 🖼️ Clean Thumbnails & Icon Cache (fix folder loading lama)
- 🔤 Reset Font Cache (fix font tampil aneh)
- 📝 Repair Microsoft Office (fix Office error/corrupt)

### 2️⃣ DNS & Network
- **DNS Standar**: AdGuard, Cloudflare, Quad9, Google, Control D, Mullvad, OpenDNS, CleanBrowsing, dns0.eu, NextDNS, AhaDNS, OpenDNS FamilyShield, Comodo
- **DNS DoH (DNS over HTTPS)**: AdGuard Personal/Rumah/Hunting/Poco, Cloudflare, Quad9, Google, NextDNS, Mullvad (AdBlock/Standard), Control D, OpenDNS, CleanBrowsing (Security/Adult), RethinkDNS, DNS0.eu (Zero/Kids)
- **DNS Tambahan Indonesia**: Nawala Trust+Positif, AdGuard Indonesia, DNSku CleanDNS, NextDNS Jakarta, Control D Jakarta
- **Fitur Kontrol**: Cek DNS aktif, cek IP publik, tes ping koneksi, reset DNS DHCP, flush DNS cache, pilih adaptor (manual/semua), hapus semua DoH/DoT, Cloudflare DoT
- 🔄 Refresh IP & routing jaringan
- 💾 Format flashdisk via diskpart (format USB yang error)
- 🌐 Reset network full (reset semua setting jaringan ke default)
- 🔒 Kunci/buka USB storage
- 🔑 Lihat password Wi-Fi tersimpan
- 🔓 Bebaskan port macet (kill PID)

### 3️⃣ Cleanup & Maintenance
- 🧹 Bersihkan file sampah umum (Temp, Prefetch, dll.)
- 📋 Bersihkan riwayat clipboard
- 📊 Bersihkan cache Microsoft Office
- 🌐 Bersihkan cache Google Chrome (tanpa logout)
- 📛 Bersihkan cache Microsoft Edge
- 📦 Hapus cache Delivery Optimization (hemat disk)
- 📝 Bersihkan semua event log
- ⏰ Scheduled auto cleanup (task scheduler otomatis bersihkan temp)
- ⚡ Optimize SSD (TRIM)
- 💿 Defrag HDD (defragmentasi hard disk)

### 4️⃣ Utilitas Sistem
- 🔄 Restart Windows Explorer
- ❌ Tutup paksa aplikasi "Not Responding"
- 🖼️ Bangun ulang cache ikon & thumbnail
- 👁️ Toggle file tersembunyi & ekstensi
- 🎛️ Buat folder GodMode di desktop
- 🌐 Restart semua adaptor jaringan

### 5️⃣ Manajemen Aplikasi
- 📦 Lihat program terinstall (sistem & user)
- 🗑️ Uninstall program paksa (via WMIC/PowerShell)
- 🚫 Disable startup apps (mempercepat boot)
- 📉 Hapus bloatware Windows (Xbox, Cortana, dll)
- 🏪 Reset Microsoft Store & apps bawaan

### 6️⃣ Hardware & Diagnosa
- 🌡️ Cek suhu CPU & motherboard
- 🔊 Test audio output
- 📷 Test webcam
- 💾 Cek kapasitas disk (space per drive)
- ⌨️ Test keyboard & mouse
- 💻 Cek spesifikasi hardware & sistem
- 📡 Speedtest internet (server Google)
- 💿 Cek kesehatan SSD/HDD (S.M.A.R.T)
- ⚠️ Cek driver bermasalah (error code)

### 7️⃣ Printer & Peripheral
- 🖨️ Reset Print Spooler (perbaiki printer macet)
- 🗄️ Restart layanan database PostgreSQL

### 8️⃣ User & Akun
- 👤 Buat user baru (admin atau standard)
- 🗑️ Hapus user profile (hapus user dan data)
- 👑 Aktifkan akun Administrator bawaan

### 9️⃣ Fitur Khusus Laptop
- 🔋 Cek kesehatan baterai detail (cycle count, degradation)
- 🔋 Calibrate battery (panduan manual)
- 🔋 Laporan kesehatan baterai (khusus laptop)

### 🔟 Pemeliharaan Lanjut
- 🔧 Perbaiki file sistem corrupt (SFC & DISM)
- 📂 Buka folder startup Windows
- 🔍 Reset Windows Search & indexing
- 💾 Buat System Restore Point
- 🛡️ Core Isolation - Memory Integrity (toggle enable/disable/cek status)
- ⚡ Toggle Fast Startup (perbaiki bug shutdown)
- 🌐 Ubah jaringan ke Private (fix share folder)

### 1️⃣1️⃣ Spesialis Servis PC
- 💾 Backup semua driver sistem
- ✅ Cek status lisensi Windows
- 🎛️ Menu pintas admin
- 💤 Set power scheme Never Sleep
- 🛡️ Matikan sementara Windows Defender
- 🔑 Ekstrak Product Key Windows dari BIOS
- ⏱️ Cek uptime sistem & umur Windows

### 1️⃣2️⃣ Emergency Troubleshooting
- 🦠 Unhide file flashdisk (pawang virus shortcut)
- ⏰ Force sync jam Windows (fix error SSL)
- 🗑️ Hapus paksa file/folder membandel

### 1️⃣3️⃣ Privacy & History
- 📄 Clear Recent Files (history dokumen, run, recent)
- 📋 Clear Run History (history command prompt)
- 🤖 Disable/Enable Cortana (toggle asisten Windows)
- 📊 Disable/Enable Telemetry (data collection Windows)
- 🔔 Disable/Enable Notifications (focus mode)

### 1️⃣4️⃣ System Tweaks
- 💻 Rename Computer (ganti nama PC)
- 🏷️ Check Computer Name (cek nama PC saat ini)
- 💤 Enable/Disable Hibernation (hemat space disk)
- 🔍 Check Windows Version (build number, detail)
- 📦 Check Installed Updates (history update Windows)

### 1️⃣5️⃣ Hardware Test
- 🎤 Test Mikrofon (cek mic untuk Zoom/Teams/Meet)
- 📸 Take Screenshot (tangkap layar untuk dokumentasi)
- 📷 Check Webcam Resolution (cek resolusi webcam)

---

## 📖 Cara Penggunaan

```bash
# 1. Jalankan file sebagai Administrator
Klik kanan pada Toolkit_windows.bat > Run as Administrator

# 2. Pilih menu sesuai kebutuhan
Masukkan nomor menu yang diinginkan

# 3. Ikuti instruksi yang muncul
Baca petunjuk dengan teliti sebelum konfirmasi
```

---

## 💻 Kebutuhan Sistem

| Komponen | Minimum | Rekomendasi |
|----------|---------|--------------|
| Sistem Operasi | Windows 7 | Windows 10/11 |
| PowerShell | Terinstall default | PowerShell 5.1+ |
| RAM | 512 MB | 2 GB+ |
| Ruang Disk | 50 MB | 100 MB+ |
| Akses | Administrator | Administrator |

---

---

## ⚠️ Catatan

- ⚡ Beberapa fitur memerlukan akses **Administrator**
- 💾 Selalu **backup data penting** sebelum melakukan perubahan sistem
- 🛡️ Toolkit ini bersifat **"as-is" tanpa garansi**
- 📌 Gunakan dengan bijak dan risiko Anda sendiri

---

## 📜 Lisensi

Toolkit ini open-source dan dapat digunakan secara bebas.

---

<div align="center">

**Dibuat dengan ❤️ untuk Tukang Servis Indonesia**

[⬆️ Kembali ke atas](#-windows-toolkit-gabungan)

</div>
