import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/app_routes.dart';
import 'state/riwayat_deteksi_model.dart';
import 'state/theme_model.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RiwayatDeteksiModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: const AgroVisionApp(),
    ),
  );
}

class AgroVisionApp extends StatelessWidget {
  const AgroVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeModel>().mode;
    return MaterialApp(
      title: 'AgriVision CNN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      onUnknownRoute: AppRoutes.onUnknownRoute,
    );
  }
}
