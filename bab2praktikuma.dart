import 'dart:core';

// Enum untuk kategori produk
enum KategoriProduk {
  DataManagement,
  NetworkAutomation,
}

// Enum untuk fase proyek
enum FaseProyek {
  Perencanaan,
  Pengembangan,
  Evaluasi,
}

// Abstract class untuk Produk
abstract class Produk {
  String namaProduk;
  double harga;
  KategoriProduk kategori;

  Produk(this.namaProduk, this.harga, this.kategori);
}

// Class untuk Produk Digital
class ProdukDigital extends Produk {
  ProdukDigital(String namaProduk, double harga, KategoriProduk kategori)
      : assert(
            (kategori == KategoriProduk.NetworkAutomation && harga >= 200000) ||
                (kategori == KategoriProduk.DataManagement && harga < 200000),
            'Harga tidak sesuai dengan kategori produk'),
        super(namaProduk, harga, kategori);

  // Method untuk mendapatkan harga dengan diskon
  double hargaSetelahDiskon(int jumlahTerjual) {
    if (kategori == KategoriProduk.NetworkAutomation && jumlahTerjual > 50) {
      double hargaDiskon = harga * 0.85;
      return hargaDiskon < 200000 ? 200000 : hargaDiskon;
    }
    return harga;
  }
}

// Enum untuk peran karyawan
enum PeranKaryawan {
  Developer,
  NetworkEngineer,
  Manager,
}

// Mixin untuk evaluasi kinerja
mixin Kinerja {
  int _produktivitas = 0;
  DateTime _lastUpdate = DateTime.now().subtract(Duration(days: 31));

  void updateProduktivitas(int nilai) {
    if (DateTime.now().difference(_lastUpdate).inDays < 30) {
      print('Produktivitas hanya bisa diperbarui setiap 30 hari sekali.');
      return;
    }
    if (nilai < 0 || nilai > 100) {
      print('Nilai produktivitas harus antara 0 dan 100.');
      return;
    }
    _produktivitas = nilai;
    _lastUpdate = DateTime.now();
  }

  int get produktivitas => _produktivitas;
}

// Abstract class untuk Karyawan
abstract class Karyawan {
  String nama;
  int umur;
  PeranKaryawan peran;

  Karyawan(this.nama, {required this.umur, required this.peran});
}

// Class untuk Karyawan Tetap
class KaryawanTetap extends Karyawan with Kinerja {
  KaryawanTetap(String nama, {required int umur, required PeranKaryawan peran})
      : super(nama, umur: umur, peran: peran);
}

// Class untuk Karyawan Kontrak
class KaryawanKontrak extends Karyawan with Kinerja {
  KaryawanKontrak(String nama,
      {required int umur, required PeranKaryawan peran})
      : super(nama, umur: umur, peran: peran);
}

// Class untuk Proyek
class Proyek {
  String namaProyek;
  List<Karyawan> timProyek = [];
  FaseProyek faseProyek = FaseProyek.Perencanaan;
  DateTime tanggalMulai;

  Proyek(this.namaProyek, this.tanggalMulai);

  void tambahKaryawan(Karyawan karyawan) {
    if (timProyek.length < 20) {
      timProyek.add(karyawan);
    } else {
      print('Tim proyek sudah penuh.');
    }
  }

  void hapusKaryawan(Karyawan karyawan) {
    timProyek.remove(karyawan);
  }

  void cekFase() {
    if (faseProyek == FaseProyek.Pere
    ncanaan && timProyek.length >= 5) {
      faseProyek = FaseProyek.Pengembangan;
    } else if (faseProyek == FaseProyek.Pengembangan &&
        DateTime.now().difference(tanggalMulai).inDays > 45) {
      faseProyek = FaseProyek.Evaluasi;
    }
  }
}

void main() {
  // Mengelola produk digital
  ProdukDigital produk1 = ProdukDigital(
      'Data Management System', 150000, KategoriProduk.DataManagement);
  ProdukDigital produk2 = ProdukDigital(
      'Network Automation System', 250000, KategoriProduk.NetworkAutomation);

  print('Harga produk1: ${produk1.harga}');
  print('Harga produk2 sebelum diskon: ${produk2.harga}');
  print('Harga produk2 setelah diskon (60 terjual): ${produk2.hargaSetelahDiskon(60)}');

  // Mengelola karyawan
  KaryawanTetap karyawan1 =
      KaryawanTetap('radika', umur: 30, peran: PeranKaryawan.Developer);
  KaryawanKontrak karyawan2 =
      KaryawanKontrak('putri', umur: 25, peran: PeranKaryawan.NetworkEngineer);

  karyawan1.updateProduktivitas(90);
  karyawan2.updateProduktivitas(75);

  print('Produktivitas karyawan1: ${karyawan1.produktivitas}');
  print('Produktivitas karyawan2: ${karyawan2.produktivitas}');

  // Mengelola proyek
  Proyek proyek1 =
      Proyek('Proyek A', DateTime.now().subtract(Duration(days: 50)));
  proyek1.tambahKaryawan(karyawan1);
  proyek1.tambahKaryawan(karyawan2);
  proyek1.tambahKaryawan(
      KaryawanTetap('sani', umur: 40, peran: PeranKaryawan.Manager));
  proyek1.tambahKaryawan(
      KaryawanKontrak('dina', umur: 22, peran: PeranKaryawan.Developer));
  proyek1.tambahKaryawan(
      KaryawanTetap('safina', umur: 28, peran: PeranKaryawan.NetworkEngineer));

  proyek1.cekFase();
  print('Fase proyek1: ${proyek1.faseProyek}');

  proyek1.tambahKaryawan(
      KaryawanKontrak('Frank', umur: 35, peran: PeranKaryawan.Manager));
  proyek1.cekFase();
  print('Fase proyek1 setelah tambah karyawan: ${proyek1.faseProyek}');
}
