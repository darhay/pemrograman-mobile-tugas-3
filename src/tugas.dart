import 'dart:io';

// Fungsi untuk entry data mahasiswa
List<Map<String, String>> entryMahasiswa() {
  List<Map<String, String>> daftarMahasiswa = [];
  int count = 0;

  while (count < 10) {
    print("\nInput Data Mahasiswa ke-${count + 1}");

    stdout.write("Masukkan Nama: ");
    String? nama = stdin.readLineSync();

    stdout.write("Masukkan NIM: ");
    String? nim = stdin.readLineSync();

    stdout.write("Masukkan Jurusan: ");
    String? jurusan = stdin.readLineSync();

    // Validasi input agar tidak boleh kosong
    if (nama == null || nama.isEmpty || 
        nim == null || nim.isEmpty || 
        jurusan == null || jurusan.isEmpty) {
      print("\nInput tidak boleh kosong! Silakan ulangi data mahasiswa ke-${count + 1}.");
      continue; // Ulangi input pada index yang sama
    }

    // Validasi NIM tidak boleh sama
    bool nimSudahAda = daftarMahasiswa.any((mhs) => mhs["nim"] == nim);
    if (nimSudahAda) {
      print("\nNIM sudah digunakan! Harus unik. Ulangi data mahasiswa ke-${count + 1}.");
      continue;
    }

    // Simpan ke dalam Map
    Map<String, String> mahasiswa = {
      "nama": nama,
      "nim": nim,
      "jurusan": jurusan
    };

    // Tambahkan ke dalam List
    daftarMahasiswa.add(mahasiswa);
    count++;
  }

  return daftarMahasiswa;
}

// Fungsi untuk mencari mahasiswa berdasarkan NIM atau nama
void cariMahasiswa(List<Map<String, String>> dataMahasiswa, String keyword) {
  bool ditemukan = false;

  for (var mhs in dataMahasiswa) {
    if (mhs["nama"]!.toLowerCase() == keyword.toLowerCase() ||
        mhs["nim"] == keyword) {
      print("\n=== Data Ditemukan ===");
      print("Nama   : ${mhs["nama"]}");
      print("NIM    : ${mhs["nim"]}");
      print("Jurusan: ${mhs["jurusan"]}");
      ditemukan = true;
      break;
    }
  }

  if (!ditemukan) {
    print("\nData tidak ditemukan.");
  }
}

void main() {
  print("=== Entry Data Mahasiswa ===");
  List<Map<String, String>> mahasiswaList = entryMahasiswa();

  print("\n=== Pencarian Data Mahasiswa ===");
  while (true) {
    stdout.write("\nMasukkan Nama atau NIM untuk mencari (ketik 'done' untuk keluar): ");
    String? keyword = stdin.readLineSync();

    if (keyword == null || keyword.toLowerCase() == "done") {
      print("\nProgram selesai. Terima kasih!");
      break; // keluar dari loop
    }

    cariMahasiswa(mahasiswaList, keyword);
  }
}
