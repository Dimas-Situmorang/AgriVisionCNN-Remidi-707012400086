import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/app_routes.dart';
import '../state/riwayat_deteksi_model.dart';
import '../widgets/agrivision_app_bar_title.dart';
import '../widgets/detection_card.dart';
import '../widgets/stat_card.dart';

class DeteksiPage extends StatelessWidget {
  const DeteksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AgriVisionAppBarTitle(tabName: 'Deteksi')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.inputDeteksi),
        icon: const Icon(Icons.add),
        label: const Text('Deteksi Baru'),
      ),
      body: Consumer<RiwayatDeteksiModel>(
        builder: (context, model, _) {
          final data = model.dataTersaring;
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
            children: [
              const Text(
                'Riwayat Deteksi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: ['Semua', 'Petak 1', 'Petak 2']
                    .map(
                      (petak) => ChoiceChip(
                        label: Text(petak),
                        selected: model.filterPetak == petak,
                        onSelected: (_) => model.setFilterPetak(petak),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      label: 'Total',
                      value: '${model.total}',
                      icon: Icons.analytics_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StatCard(
                      label: 'Sehat',
                      value: '${model.sehat}',
                      icon: Icons.check_circle_outline,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StatCard(
                      label: 'Perlu Tindakan',
                      value: '${model.perluTindakan}',
                      icon: Icons.warning_amber_outlined,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (data.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Belum ada data deteksi. Tambahkan data baru atau muat simulasi.',
                    ),
                  ),
                )
              else
                ...data.map(
                  (hasil) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DeteksiCard(
                      hasil: hasil,
                      onDelete: () => _hapus(context, model, hasil.id),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _hapus(BuildContext context, RiwayatDeteksiModel model, String id) {
    model.hapus(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data deteksi dihapus.')));
  }
}
