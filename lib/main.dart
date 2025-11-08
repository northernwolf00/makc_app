import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:makc_app/core/init/app_initialize.dart';
import 'package:makc_app/core/init/theme_controller.dart';
import 'package:makc_app/core/init/translation_service.dart';
import 'package:makc_app/core/theme/custom_dark_theme.dart';
import 'package:makc_app/core/theme/custom_light_theme.dart';
import 'package:makc_app/global_widgets/bottom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationInitialize.initialize();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  await GetStorage.init();

  Get.put(ThemeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          builder: (context, child) {
            final themeController = Get.find<ThemeController>();
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: themeController.themeMode == ThemeMode.dark
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark,
              child: child!,
            );
          },
          translations: TranslationService(),
          defaultTransition: Transition.fade,
          fallbackLocale: const Locale('tr'),
          debugShowCheckedModeBanner: false,
          locale: storage.read('langCode') != null
              ? Locale(storage.read('langCode'))
              : const Locale('tr'),
          theme: CustomLightTheme().themeData,
          darkTheme: CustomDarkTheme().themeData,
          themeMode: Get.find<ThemeController>().themeMode,
          home: const BottomNavScreen(),
        );
      },
    );
  }
}
