import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:out_of_bounds/themes/app_theme.dart';

import 'screens/root/root_screen.dart';

class PlanYourFood extends StatelessWidget {
  const PlanYourFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "JobMaster",
      theme: AppTheme.appTheme,
      home: const Root(),
      localizationsDelegates: [
        FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
                basePath: "assets/locales",
                fallbackFile: "en",
                decodeStrategies: [JsonDecodeStrategy()])),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en")],
    );
  }
}
