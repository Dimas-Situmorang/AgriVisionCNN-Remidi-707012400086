import 'dart:math';

import 'deteksi_rules.dart';
import 'deteksi_result.dart';

final contohDeteksi = <HasilDeteksi>[
  HasilDeteksi(
    id: 'contoh-001',
    petak: 'Petak 1',
    kelas: 'Normal / Sehat',
    skor: 0.91,
    namaPetugas: 'Budi',
    waktu: DateTime(2026, 10, 28, 8, 40),
  ),
  HasilDeteksi(
    id: 'contoh-002',
    petak: 'Petak 2',
    kelas: 'Hawar daun bakteri',
    skor: 0.78,
    namaPetugas: 'Siti',
    waktu: DateTime(2026, 10, 27, 16, 15),
  ),
  HasilDeteksi(
    id: 'contoh-003',
    petak: 'Petak 1',
    kelas: 'Bercak coklat',
    skor: 0.42,
    namaPetugas: 'Andi',
    waktu: DateTime(2026, 10, 26, 9, 20),
  ),
];

List<HasilDeteksi> buatDataSimulasi({Random? random}) {
  final rng = random ?? Random();
  final petak = ['Petak 1', 'Petak 2'];
  final waktuBuat = DateTime.now();

  return List.generate(10, (index) {
    final kelas = kelasDeteksi[rng.nextInt(kelasDeteksi.length)];
    final skorPersen = 30 + rng.nextInt(70);
    return HasilDeteksi(
      id: 'simulasi-${waktuBuat.microsecondsSinceEpoch}-$index',
      petak: petak[rng.nextInt(petak.length)],
      kelas: kelas,
      skor: skorPersen / 100,
      namaPetugas: 'Simulasi',
      waktu: waktuBuat.subtract(Duration(minutes: index * 5)),
    );
  });
}
