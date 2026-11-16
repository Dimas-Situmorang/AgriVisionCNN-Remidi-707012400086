# AgriVision CNN

Aplikasi Flutter untuk simulasi pencatatan kondisi tanaman padi pada Petak 1 dan Petak 2.

## Fitur

- Beranda, Tentang, Deteksi, Statistik, dan Pengaturan.
- Form deteksi dengan validasi, konfirmasi simpan, status, dan rekomendasi.
- Riwayat dengan filter petak, hapus catatan, ringkasan, dan badge tindakan.
- Sepuluh data simulasi dan grafik jumlah deteksi per kelas.
- Tema terang dan gelap.

Kelas dan skor dimasukkan secara manual. Data tersimpan di memori selama aplikasi berjalan; aplikasi tidak memanggil API atau menjalankan inferensi gambar CNN.

## Menjalankan aplikasi

1. Instal Flutter SDK dan Android SDK.
2. Buka folder proyek ini.
3. Jalankan `flutter pub get`.
4. Jalankan `flutter run` dengan emulator atau perangkat Android yang aktif.

Paket utama yang digunakan adalah `provider` untuk state dan `fl_chart` untuk grafik. Tangkapan layar ada di folder `screenshots/`.

## Repositori

https://github.com/Dimas-Situmorang/AgriVisionCNN-Remidi-707012400086
