import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsivity/config/connectivity.dart';
import 'package:responsivity/config/language/language_cubit.dart';
import 'package:responsivity/config/routes/routes.dart';
import 'package:responsivity/config/theme.dart';
import 'package:responsivity/features/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/utils/responsivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService().initialize();

  final languageCubit = LanguageCubit();
  await languageCubit.loadLanguage();
  runApp(
    DevicePreview(
      enabled: true, // disable this in release
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => FavoritesBloc()),

          BlocProvider.value(value: languageCubit),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const designSize = Size(360, 690); // example design size

    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return ScreenUtilInit(
              designSize: designSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                MediaSize.init(context);

                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  builder: DevicePreview.appBuilder,
                  locale: locale, // 👈 handled by LanguageCubit
                  supportedLocales: const [Locale('en'), Locale('fr')],
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  routerConfig: router,
                  theme: theme,
                );
              },
            );
          },
        );
      },
    );
  }
}
