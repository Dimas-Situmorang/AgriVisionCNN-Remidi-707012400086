import 'deteksi_rules.dart';

class HasilDeteksi {
  const HasilDeteksi({
    required this.id,
    required this.petak,
    required this.kelas,
    required this.skor,
    required this.namaPetugas,
    required this.waktu,
  });

  final String id;
  final String petak;
  final String kelas;
  final double skor;
  final String namaPetugas;
  final DateTime waktu;

  StatusDeteksi get status => tentukanStatus(kelas: kelas, skor: skor);

  String get rekomendasi => status == StatusDeteksi.tidakPasti
      ? 'Cek ulang oleh petugas.'
      : rekomendasiUntuk(kelas);

  String get skorLabel => '${(skor * 100).toStringAsFixed(0)}%';

  HasilDeteksi copyWith({
    String? id,
    String? petak,
    String? kelas,
    double? skor,
    String? namaPetugas,
    DateTime? waktu,
  }) {
    return HasilDeteksi(
      id: id ?? this.id,
      petak: petak ?? this.petak,
      kelas: kelas ?? this.kelas,
      skor: skor ?? this.skor,
      namaPetugas: namaPetugas ?? this.namaPetugas,
      waktu: waktu ?? this.waktu,
    );
  }
}
