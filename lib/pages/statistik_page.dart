import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/deteksi_rules.dart';
import '../state/riwayat_deteksi_model.dart';
import '../widgets/agrivision_app_bar_title.dart';

class StatistikPage extends StatelessWidget {
  const StatistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AgriVisionAppBarTitle(tabName: 'Statistik')),
      body: Consumer<RiwayatDeteksiModel>(
        builder: (context, model, _) {
          final jumlahPerKelas = {
            for (final kelas in kelasDeteksi)
              kelas: model.data.where((item) => item.kelas == kelas).length,
          };
          final nilaiMaksimum = jumlahPerKelas.values.fold<int>(
            0,
            (maximum, value) => value > maximum ? value : maximum,
          );
          final maxY = (nilaiMaksimum < 5 ? 5 : nilaiMaksimum + 2).toDouble();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Statistik Deteksi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Buat data contoh untuk menguji grafik.'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ElevatedButton.icon(
                    onPressed: model.generateSimulasi,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Mulai Simulasi'),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 320,
                child: BarChart(
                  BarChartData(
                    maxY: maxY,
                    minY: 0,
                    alignment: BarChartAlignment.spaceAround,
                    gridData: const FlGridData(show: true),
                    borderData: FlBorderData(show: true),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= kelasDeteksi.length) {
                              return const SizedBox.shrink();
                            }
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(_labelSingkat(kelasDeteksi[index])),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: jumlahPerKelas.entries
                        .toList()
                        .asMap()
                        .entries
                        .map(
                          (entry) => BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value.value.toDouble(),
                                color: Theme.of(context).colorScheme.primary,
                                width: 28,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ...jumlahPerKelas.entries.map(
                (entry) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(entry.key),
                  trailing: Text('${entry.value} data'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static String _labelSingkat(String kelas) {
    if (kelas == 'Normal / Sehat') return 'Normal';
    if (kelas == 'Hawar daun bakteri') return 'Hawar';
    if (kelas == 'Penyakit blas (jamur)') return 'Blas';
    if (kelas == 'Bercak coklat') return 'Bercak';
    return 'Tungro';
  }
}
