import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:out_of_bounds/screens/login/login_screen.dart';
import 'package:out_of_bounds/screens/navigation/navigation.dart';
import 'package:out_of_bounds/themes/app_theme.dart';

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

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return const AppNavigation();
  }
}
