import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:foi/utils/routes/navigation.dart';
import 'package:get/get.dart';
import 'package:foi/utils/app_theme.dart';
import 'package:foi/utils/di/dependency_creator.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await DependencyCreator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Remove splash screen after first frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FlutterNativeSplash.remove();
        });
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FOI',
          theme: AppTheme.lightTheme,
          initialRoute: Routes.MAIN,
          getPages: Nav.routes,
        );
      },
    );
  }
}
