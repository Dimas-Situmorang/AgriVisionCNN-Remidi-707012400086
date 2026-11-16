import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/deteksi_page.dart';
import '../pages/home_page.dart';
import '../pages/pengaturan_page.dart';
import '../pages/statistik_page.dart';
import '../state/riwayat_deteksi_model.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    HomePage(onOpenDetection: () => _ubahTab(1)),
    const DeteksiPage(),
    const StatistikPage(),
    const PengaturanPage(),
  ];

  void _ubahTab(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final jumlahPerluTindakan = context.select<RiwayatDeteksiModel, int>(
      (model) => model.perluTindakan,
    );

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _ubahTab,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: jumlahPerluTindakan > 0,
              label: Text('$jumlahPerluTindakan'),
              child: Icon(Icons.fact_check_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: jumlahPerluTindakan > 0,
              label: Text('$jumlahPerluTindakan'),
              child: Icon(Icons.fact_check),
            ),
            label: 'Deteksi',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Statistik',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
