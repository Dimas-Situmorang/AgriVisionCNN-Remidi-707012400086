import 'package:flutter/material.dart';

import '../models/deteksi_rules.dart';
import '../widgets/agrivision_app_bar_title.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AgriVisionAppBarTitle(tabName: 'Tentang')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Tujuan Aplikasi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'AgriVision CNN membantu kelompok tani mencatat hasil deteksi penyakit dan hama padi secara terstruktur. Data pada asesmen ini disimpan di memori aplikasi tanpa API atau koneksi internet.',
          ),
          const SizedBox(height: 20),
          const Text(
            '5 Kelas Deteksi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          ...kelasDeteksi.map(
            (kelas) => Card(child: ListTile(title: Text(kelas))),
          ),
        ],
      ),
    );
  }
}
