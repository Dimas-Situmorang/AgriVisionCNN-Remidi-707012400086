import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/riwayat_deteksi_model.dart';
import '../state/theme_model.dart';
import '../widgets/agrivision_app_bar_title.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeModel>();
    final model = context.read<RiwayatDeteksiModel>();

    return Scaffold(
      appBar: AppBar(title: const AgriVisionAppBarTitle(tabName: 'Pengaturan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Pengaturan Aplikasi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: SwitchListTile(
              title: const Text('Mode gelap'),
              subtitle: Text(
                theme.isDark ? 'Mode gelap aktif' : 'Mode terang aktif',
              ),
              secondary: const Icon(Icons.dark_mode_outlined),
              value: theme.isDark,
              onChanged: theme.setDark,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Data Simulasi',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  const Text('Muat sepuluh catatan acak untuk mencoba fitur.'),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {
                      model.generateSimulasi();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('10 data simulasi dimuat.'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.auto_awesome_outlined),
                    label: const Text('Muat Data Simulasi'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () => _konfirmasiHapus(context, model),
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Hapus Semua Data'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _konfirmasiHapus(
    BuildContext context,
    RiwayatDeteksiModel model,
  ) async {
    final hapus = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus semua data?'),
        content: const Text(
          'Semua riwayat deteksi yang ada di memori akan dihapus.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (!context.mounted || hapus != true) return;
    model.hapusSemua();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Semua data berhasil dihapus.')),
    );
  }
}
