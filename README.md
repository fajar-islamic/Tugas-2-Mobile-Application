# Tugas 2 - Aplikasi Mobile (Sistem Parkir Digital)

Tugas kelompok Pertemuan 2 matkul Aplikasi Mobile (Pak I Ketut Gunawan). Program ini dibuat pakai bahasa Dart buat nyimulasiin sistem manajemen parkir sederhana sekaligus ngerapin logika dasar kodingan.

### Anggota Kelompok
* **Fajar Hikmayatul Islami** - 1124160221
* **Ina** - 

---

## Gambaran Logika Program
Di program ini, kita nyobain nerapin 4 pilar *Computational Thinking*:

1. **Decomposition**: Logika hitung tarif dan diskon dipisah ke fungsi `hitungBiayaParkir()` biar fungsi `main()` tetep bersih.
2. **Pattern Recognition**: Pake `enum JenisKendaraan` buat ngebedain tarif motor dan mobil biar standar dan gak rawan Typo.
3. **Abstraction**: Bikin `class KendaraanParkir` cuma buat nampung data yang penting aja (plat, jenis kendaraan, jam masuk, jam keluar).
4. **Algorithm**: Pake kondisi `if-else` buat ngecek durasi parkir. Kalau parkir lebih dari 5 jam, otomatis dapet diskon 10%. Terus pake perulangan buat totalin pendapatan.

---

## Aturan Tarif
* **Mobil**: Rp 5.000 / jam
* **Motor**: Rp 2.000 / jam
* **Diskon**: Potongan 10% kalau durasi parkir > 5 jam

---

## Contoh Hasil Output

```text
=== SISTEM MANAJEMEN PARKIR DIGITAL ===

--- DAFTAR TRANSAKSI PARKIR ---
Plat: B 1234 ABC | Jenis: MOBIL | Durasi: 4 Jam | Biaya: Rp 20000
Plat: B 5678 DEF | Jenis: MOTOR | Durasi: 2 Jam | Biaya: Rp 4000
Plat: B 9999 VIP | Jenis: MOBIL | Durasi: 7 Jam | Biaya: Rp 31500 (Diskon 10%)
Plat: B 1122 JKL | Jenis: MOTOR | Durasi: 7 Jam | Biaya: Rp 12600 (Diskon 10%)

---------------------------------------
Total Mobil Parkir  : 2 unit
Total Motor Parkir  : 2 unit
Total Pendapatan    : Rp 68100
