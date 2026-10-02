// 1. Enum (Pattern Recognition): Membatasi jenis kendaraan
enum JenisKendaraan { motor, mobil }

// 2. Class (Abstraction): Model data parkir kendaraan
class KendaraanParkir {
  String platNomor;
  JenisKendaraan jenis;
  int jamMasuk;
  int? jamKeluar; // Null Safety

  KendaraanParkir({
    required this.platNomor,
    required this.jenis,
    required this.jamMasuk,
    this.jamKeluar,
  });

  // Getter menghitung durasi parkir
  int get durasi {
    if (jamKeluar == null) return 0;
    int total = jamKeluar! - jamMasuk;
    return total > 0 ? total : 1; // Minimal hitung 1 jam
  }
}

// 3. Function (Decomposition & Algorithm): Hitung biaya + aturan diskon
double hitungBiayaParkir(KendaraanParkir kendaraan) {
  if (kendaraan.jamKeluar == null) return 0.0;

  // Mobil Rp 5.000/jam, Motor Rp 2.000/jam
  double tarifPerJam = (kendaraan.jenis == JenisKendaraan.mobil) ? 5000.0 : 2000.0;
  double totalBiaya = kendaraan.durasi * tarifPerJam;

  // Diskon 10% jika parkir lebih dari 5 jam
  if (kendaraan.durasi > 5) {
    totalBiaya *= 0.9;
  }

  return totalBiaya;
}

void main() {
  print('=== SISTEM MANAJEMEN PARKIR DIGITAL ===\n');

  // 4. Data Collection (List): Menampung banyak transaksi parkir
  List<KendaraanParkir> daftarParkir = [
    KendaraanParkir(platNomor: 'B 1234 ABC', jenis: JenisKendaraan.mobil, jamMasuk: 8, jamKeluar: 12),
    KendaraanParkir(platNomor: 'B 5678 DEF', jenis: JenisKendaraan.motor, jamMasuk: 9, jamKeluar: 11),
    KendaraanParkir(platNomor: 'B 9999 VIP', jenis: JenisKendaraan.mobil, jamMasuk: 8, jamKeluar: 15),
    KendaraanParkir(platNomor: 'B 1122 JKL', jenis: JenisKendaraan.motor, jamMasuk: 13, jamKeluar: 20),
  ];

  // Algoritma Perulangan (Looping) untuk Cetak Rincian Transaksi
  print('--- DAFTAR TRANSAKSI PARKIR ---');
  for (var kendaraan in daftarParkir) {
    double biaya = hitungBiayaParkir(kendaraan);
    String infoDiskon = kendaraan.durasi > 5 ? ' (Diskon 10%)' : '';
    print('Plat: ${kendaraan.platNomor} | Jenis: ${kendaraan.jenis.name.toUpperCase()} | Durasi: ${kendaraan.durasi} Jam | Biaya: Rp ${biaya.toStringAsFixed(0)}$infoDiskon');
  }

  // Collection Operation (where & fold) untuk Agregasi Data
  int jumlahMobil = daftarParkir.where((item) => item.jenis == JenisKendaraan.mobil).length;
  int jumlahMotor = daftarParkir.where((item) => item.jenis == JenisKendaraan.motor).length;
  double totalPendapatan = daftarParkir.fold(0, (sum, item) => sum + hitungBiayaParkir(item));

  print('\n---------------------------------------');
  print('Total Mobil Parkir  : $jumlahMobil unit');
  print('Total Motor Parkir  : $jumlahMotor unit');
  print('Total Pendapatan    : Rp ${totalPendapatan.toStringAsFixed(0)}');
}
