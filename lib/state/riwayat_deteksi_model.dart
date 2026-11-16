import 'package:flutter/foundation.dart';

import '../models/deteksi_data.dart';
import '../models/deteksi_result.dart';
import '../models/deteksi_rules.dart';

class RiwayatDeteksiModel extends ChangeNotifier {
  RiwayatDeteksiModel() : _data = [...contohDeteksi];

  final List<HasilDeteksi> _data;
  String _filterPetak = 'Semua';

  List<HasilDeteksi> get data => List.unmodifiable(_data);

  List<HasilDeteksi> get dataTersaring {
    if (_filterPetak == 'Semua') return data;
    return _data.where((item) => item.petak == _filterPetak).toList();
  }

  String get filterPetak => _filterPetak;

  int get total => _data.length;

  int get sehat =>
      _data.where((item) => item.status == StatusDeteksi.sehat).length;

  int get perluTindakan =>
      _data.where((item) => item.status == StatusDeteksi.perluTindakan).length;

  void setFilterPetak(String filter) {
    _filterPetak = filter;
    notifyListeners();
  }

  void tambah(HasilDeteksi hasil) {
    _data.insert(0, hasil);
    notifyListeners();
  }

  void hapus(String id) {
    _data.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void hapusSemua() {
    _data.clear();
    notifyListeners();
  }

  void generateSimulasi() {
    _data.insertAll(0, buatDataSimulasi());
    notifyListeners();
  }
}
