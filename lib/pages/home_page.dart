import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import '../widgets/agrivision_app_bar_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.onOpenDetection, super.key});

  final VoidCallback onOpenDetection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AgriVisionAppBarTitle(tabName: 'Beranda')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Selamat Datang di AgriVision CNN',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Aplikasi pencatatan deteksi penyakit dan hama padi untuk kelompok tani.',
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Model',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.memory_outlined),
                    title: Text('Model EfficientNet-B0'),
                    subtitle: Text(
                      '5 kelas: 4 penyakit/hama dan 1 kelas sehat',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onOpenDetection,
            icon: const Icon(Icons.fact_check_outlined),
            label: const Text('Buka Riwayat Deteksi'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.tentang),
            child: const Text('Tentang Aplikasi'),
          ),
        ],
      ),
    );
  }
}
