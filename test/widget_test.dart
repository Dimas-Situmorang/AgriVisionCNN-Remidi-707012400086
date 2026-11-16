import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:agrivision_cnn_707012400086/main.dart';
import 'package:agrivision_cnn_707012400086/state/riwayat_deteksi_model.dart';
import 'package:agrivision_cnn_707012400086/state/theme_model.dart';

void main() {
  testWidgets('AgriVision menampilkan halaman beranda', (tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RiwayatDeteksiModel()),
          ChangeNotifierProvider(create: (_) => ThemeModel()),
        ],
        child: const AgroVisionApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Beranda'), findsAtLeastNWidgets(1));
    expect(find.text('Selamat Datang di AgriVision CNN'), findsOneWidget);
    expect(find.textContaining('EfficientNet-B0'), findsOneWidget);
  });
}
