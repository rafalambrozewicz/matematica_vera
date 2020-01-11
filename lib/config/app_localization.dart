import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {

  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'matematica vera',
      'addition': 'Addition',
      'subtraction': 'Subtraction',
      'range': 'Range:',
      'exercises': 'exercises',
      'never_done': 'Never done before',
      'in_progress': 'In progress',
      'last_done': 'Last done on',
      'exercise_done': 'Exercise done!',
      'good_job': 'Good job!',
      'go_back': 'GO BACK',
      'repeat': 'REPEAT',
    },
    'pl': {
      'app_name': 'matematica vera',
      'addition': 'Dodawanie',
      'subtraction': 'Odejmowanie',
      'range': 'Zakres:',
      'exercises': 'ćwiczeń',
      'never_done': 'Nigdy nie wykonano',
      'in_progress': 'W trakcie',
      'last_done': 'Zrobiono',
      'exercise_done': 'Ćwicznie wykonane!',
      'good_job': 'Dobra robota!',
      'go_back': 'WSTECZ',
      'repeat': 'POWTÓRZ',
    },
    'it': {
      'app_name': 'matematica vera',
      'addition': 'Aggiunta',
      'subtraction': 'Sottrazione',
      'range': 'Gamma:',
      'exercises': 'esercizi',
      'never_done': 'Mai fatto prima',
      'in_progress': 'In corso',
      'last_done': 'Ultimo fatto',
      'exercise_done': 'Esercizio fatto!',
      'good_job': 'Buon lavoro!',
      'go_back': 'TORNA INDIETRO',
      'repeat': 'RIPETERE',
    },
  };

  String get app_name => _localizedValues[locale.languageCode]['app_name'];
  String get addition => _localizedValues[locale.languageCode]['addition'];
  String get subtraction => _localizedValues[locale.languageCode]['subtraction'];
  String get range => _localizedValues[locale.languageCode]['range'];
  String get exercises => _localizedValues[locale.languageCode]['exercises'];
  String get never_done => _localizedValues[locale.languageCode]['never_done'];
  String get in_progress => _localizedValues[locale.languageCode]['in_progress'];
  String get last_done => _localizedValues[locale.languageCode]['last_done'];
  String get exercise_done => _localizedValues[locale.languageCode]['exercise_done'];
  String get good_job => _localizedValues[locale.languageCode]['good_job'];
  String get go_back => _localizedValues[locale.languageCode]['go_back'];
  String get repeat => _localizedValues[locale.languageCode]['repeat'];
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl', 'it'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}