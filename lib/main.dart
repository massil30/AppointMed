import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsivity/config/connectivity.dart';
import 'package:responsivity/config/routes/routes.dart';

import 'package:responsivity/config/theme.dart';
import 'package:responsivity/pages/splashscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/pages/welcomPage.dart';
import 'package:responsivity/utils/responsivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService().initialize();
  runApp(
    DevicePreview(
      enabled: true, // disable this in release
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);

    Size designSize;
    switch (screenSize) {
      case ScreenSize.small:
        designSize = const Size(360, 690);
        break;
      case ScreenSize.normal:
        designSize = const Size(768, 1024);
        break;
      case ScreenSize.large:
        designSize = const Size(1440, 900);
        break;
    }
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return ScreenUtilInit(
            designSize: designSize,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              MediaSize.init(context);

              return MaterialApp.router(
                builder: DevicePreview.appBuilder,
                locale: DevicePreview.locale(context),
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
}
