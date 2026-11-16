import 'package:flutter/material.dart';

import '../models/deteksi_result.dart';
import 'status_chip.dart';

class DeteksiCard extends StatelessWidget {
  const DeteksiCard({required this.hasil, required this.onDelete, super.key});

  final HasilDeteksi hasil;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${hasil.petak} · ${hasil.kelas}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  tooltip: 'Hapus data',
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            StatusChip(status: hasil.status),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Skor deteksi: ${hasil.skorLabel}'),
                const SizedBox(width: 8),
                Expanded(child: LinearProgressIndicator(value: hasil.skor)),
              ],
            ),
            const SizedBox(height: 8),
            Text('Rekomendasi: ${hasil.rekomendasi}'),
            const SizedBox(height: 6),
            Text(
              'Petugas: ${hasil.namaPetugas} · ${_formatWaktu(hasil.waktu)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  String _formatWaktu(DateTime waktu) {
    String duaDigit(int value) => value.toString().padLeft(2, '0');
    return '${duaDigit(waktu.day)}/${duaDigit(waktu.month)}/${waktu.year} '
        '${duaDigit(waktu.hour)}:${duaDigit(waktu.minute)}';
  }
}
