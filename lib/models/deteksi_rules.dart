enum StatusDeteksi { sehat, tidakPasti, perluTindakan }

const kelasDeteksi = <String>[
  'Normal / Sehat',
  'Hawar daun bakteri',
  'Penyakit blas (jamur)',
  'Bercak coklat',
  'Penyakit tungro (virus)',
];

const rekomendasiPerKelas = <String, String>{
  'Hawar daun bakteri':
      'Kurangi pupuk urea, buang air berlebih, bersihkan jerami yang sakit.',
  'Penyakit blas (jamur)':
      'Jaga sawah tetap tergenang, semprot obat jamur saat padi keluar malai.',
  'Bercak coklat': 'Tambah pupuk kalium, jaga sawah tetap tergenang.',
  'Normal / Sehat': 'Tanaman sehat. Lanjutkan pemantauan rutin.',
  'Penyakit tungro (virus)':
      'Cabut rumpun yang sakit, musim depan pakai varietas tahan.',
};

StatusDeteksi tentukanStatus({required String kelas, required double skor}) {
  if (kelas == 'Normal / Sehat') return StatusDeteksi.sehat;
  if (skor < 0.50) return StatusDeteksi.tidakPasti;
  return StatusDeteksi.perluTindakan;
}

String labelStatus(StatusDeteksi status) {
  switch (status) {
    case StatusDeteksi.sehat:
      return 'Sehat';
    case StatusDeteksi.tidakPasti:
      return 'Tidak Pasti';
    case StatusDeteksi.perluTindakan:
      return 'Perlu Tindakan';
  }
}

String rekomendasiUntuk(String kelas) {
  return rekomendasiPerKelas[kelas] ?? 'Cek ulang hasil bersama petugas.';
}
