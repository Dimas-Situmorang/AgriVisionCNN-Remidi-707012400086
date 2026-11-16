import 'package:flutter/material.dart';

import '../pages/input_deteksi_page.dart';
import '../pages/tentang_page.dart';
import '../navigation/kerangka_utama.dart';
import '../pages/unknown_route_page.dart';

class AppRoutes {
  AppRoutes._();

  static const beranda = '/';
  static const tentang = '/tentang';
  static const inputDeteksi = '/input-deteksi';

  static Map<String, WidgetBuilder> get routes => {
    beranda: (_) => const KerangkaNavigasi(),
    tentang: (_) => const TentangPage(),
    inputDeteksi: (_) => const InputDeteksiPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder == null) return null;
    return MaterialPageRoute(builder: builder, settings: settings);
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => UnknownRoutePage(routeName: settings.name),
    );
  }
}
