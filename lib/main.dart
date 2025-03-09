import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/local_storage/Prefs.dart';
import 'core/view/application.dart';
import 'generated/codegen_loader.g.dart';

Future<void> main() async {
  await Prefs.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'resources/langs',
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return const Application();
        },
      ),
    ),
  );
}
