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

    // Simpan ke dalam Map
    Map<String, String> mahasiswa = {
      "nama": nama ?? "",
      "nim": nim ?? "",
      "jurusan": jurusan ?? ""
    };

    // Tambahkan ke dalam List
    daftarMahasiswa.add(mahasiswa);
    count++;
  }

  return daftarMahasiswa;
}

// Fungsi untuk mencari mahasiswa berdasarkan NIM atau nama
void cariMahasiswa(List<Map<String, String>> dataMahasiswa) {
  stdout.write("\nCari mahasiswa berdasarkan Nama atau NIM: ");
  String? keyword = stdin.readLineSync();

  bool ditemukan = false;
  for (var mhs in dataMahasiswa) {
    if (mhs["nama"]!.toLowerCase() == keyword!.toLowerCase() || mhs["nim"] == keyword) {
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

  print("\n=== Cari Data Mahasiswa ===");
  cariMahasiswa(mahasiswaList);
}
