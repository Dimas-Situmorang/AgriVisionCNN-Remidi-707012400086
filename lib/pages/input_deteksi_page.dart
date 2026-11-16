import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/deteksi_result.dart';
import '../models/deteksi_rules.dart';
import '../state/riwayat_deteksi_model.dart';
import '../widgets/agrivision_app_bar_title.dart';
import '../widgets/status_chip.dart';

class InputDeteksiPage extends StatefulWidget {
  const InputDeteksiPage({super.key});

  @override
  State<InputDeteksiPage> createState() => _InputDeteksiPageState();
}

class _InputDeteksiPageState extends State<InputDeteksiPage> {
  final _formKey = GlobalKey<FormState>();
  final _skorController = TextEditingController();
  final _petugasController = TextEditingController();

  String _petak = 'Petak 1';
  String _kelas = kelasDeteksi.first;
  bool _dataSudahBenar = false;

  @override
  void dispose() {
    _skorController.dispose();
    _petugasController.dispose();
    super.dispose();
  }

  double? get _skor {
    final value = double.tryParse(_skorController.text.replaceAll(',', '.'));
    if (value == null) return null;
    return value / 100;
  }

  bool get _formSiapDisimpan => _dataSudahBenar;

  Future<void> _konfirmasiSimpan() async {
    if (!_formKey.currentState!.validate()) return;
    final skor = _skor!;
    final setuju = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi data'),
        content: const Text(
          'Apakah data deteksi sudah benar dan ingin disimpan?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
    if (!mounted || setuju != true) return;

    final hasil = HasilDeteksi(
      id: 'manual-${DateTime.now().microsecondsSinceEpoch}',
      petak: _petak,
      kelas: _kelas,
      skor: skor,
      namaPetugas: _petugasController.text.trim(),
      waktu: DateTime.now(),
    );
    context.read<RiwayatDeteksiModel>().tambah(hasil);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data tersimpan')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final skor = _skor;
    final status = skor == null
        ? null
        : tentukanStatus(kelas: _kelas, skor: skor);
    return Scaffold(
      appBar: AppBar(
        title: const AgriVisionAppBarTitle(tabName: 'Input Deteksi'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Form Input Hasil Deteksi CNN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pilih Petak',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RadioGroup<String>(
                groupValue: _petak,
                onChanged: (value) => setState(() => _petak = value ?? _petak),
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      value: 'Petak 1',
                      title: Text('Petak 1'),
                    ),
                    RadioListTile<String>(
                      value: 'Petak 2',
                      title: Text('Petak 2'),
                    ),
                  ],
                ),
              ),
              DropdownButtonFormField<String>(
                initialValue: _kelas,
                decoration: const InputDecoration(labelText: 'Kelas Deteksi'),
                items: kelasDeteksi
                    .map(
                      (kelas) =>
                          DropdownMenuItem(value: kelas, child: Text(kelas)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _kelas = value ?? _kelas),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _skorController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'Skor Deteksi (%)',
                  hintText: 'Contoh: 75',
                ),
                validator: (value) {
                  final angka = double.tryParse(
                    (value ?? '').replaceAll(',', '.'),
                  );
                  if (angka == null || angka < 0 || angka > 100) {
                    return 'Skor harus berupa angka 0 sampai 100';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _petugasController,
                decoration: const InputDecoration(labelText: 'Nama Petugas'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Nama petugas wajib diisi'
                    : null,
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: _dataSudahBenar,
                onChanged: (value) =>
                    setState(() => _dataSudahBenar = value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Data sudah benar'),
              ),
              if (status != null) ...[
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    title: const Text('Status Deteksi'),
                    subtitle: Text(rekomendasiUntuk(_kelas)),
                    trailing: StatusChip(status: status),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _formSiapDisimpan ? _konfirmasiSimpan : null,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
