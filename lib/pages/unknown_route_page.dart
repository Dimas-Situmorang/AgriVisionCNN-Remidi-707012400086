import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({this.routeName, super.key});

  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman tidak ditemukan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.route_outlined,
                size: 72,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Route tidak tersedia',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                routeName == null
                    ? 'Nama halaman tidak diketahui.'
                    : 'Nama route: $routeName',
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('Kembali ke beranda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
