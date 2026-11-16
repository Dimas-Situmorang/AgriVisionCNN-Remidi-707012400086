import 'package:flutter/material.dart';

import '../models/deteksi_rules.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({required this.status, super.key});

  final StatusDeteksi status;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isHealthy = status == StatusDeteksi.sehat;
    final isAction = status == StatusDeteksi.perluTindakan;
    final color = isHealthy
        ? scheme.primary
        : isAction
        ? scheme.error
        : scheme.tertiary;
    return Chip(
      avatar: Icon(
        isHealthy
            ? Icons.check_circle_outline
            : isAction
            ? Icons.warning_amber_outlined
            : Icons.help_outline,
        size: 16,
        color: color,
      ),
      label: Text(labelStatus(status)),
      side: BorderSide(color: color),
    );
  }
}
