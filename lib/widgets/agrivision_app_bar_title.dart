import 'package:flutter/material.dart';

class AgriVisionAppBarTitle extends StatelessWidget {
  const AgriVisionAppBarTitle({required this.tabName, super.key});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [const Text('AgriVision'), const Text(' · '), Text(tabName)],
    );
  }
}
