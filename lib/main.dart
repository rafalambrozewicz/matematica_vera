import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/screen/choose_game/choose_game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('pl'), // Polish
        const Locale('it'), // Italian
      ],
      title: 'matematica vera',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ChooseGameScreen(),
    );
  }
}

