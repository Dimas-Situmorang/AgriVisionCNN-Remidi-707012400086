import 'package:flutter/material.dart';

class DetectionActionCard extends StatelessWidget {
  const DetectionActionCard({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.camera_alt_outlined),
                const SizedBox(width: 8),
                const Text(
                  'Deteksi tanaman',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Foto daun atau batang padi untuk melihat hasil deteksi.',
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.center_focus_weak),
              label: const Text('Mulai deteksi'),
            ),
          ],
        ),
      ),
    );
  }
}
