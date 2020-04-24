import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matematica_vera/domain/operation_type.dart';

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
      'multiplication': 'Multiplication',
      'division': 'Division',
      'range': 'Range:',
      'exercises': 'exercises',
      'never_done': 'Never done before',
      'in_progress': 'In progress',
      'last_done': 'Last done on',
      'exercise_done': 'Exercise done!',
      'good_job': 'Good job!',
      'go_back': 'GO BACK',
      'repeat': 'REPEAT',
      'add_exercise': 'Add exercise',
      'save': 'SAVE',
      'custom_name': 'Custom name (optional)',
      'operation_type': 'Operation type',
      'operation_color': 'Color',
      'numbers_range': 'Numbers range',
      'maximum_result': 'Maximum result',
      'number_of_exercises': 'Number of exercises',
      'number_of_answers': 'Number of answers',
      'it_is_possible_to_generate': 'It is possible to generate',
      'unique_exercises': 'unique exercises',
      'show_number_of_errors': 'Show number of errors',
      'maximum_result_empty_error': 'Field cannot be empty',
      'number_of_exercises_empty_error': 'Field cannot be empty',
      'number_of_exercises_too_small_error': 'Number of exercises is too small',
      'number_of_answers_too_big': 'Too many answers for given maximum result',
      'correct_errors': 'Correct errors!',
      'saved': 'Saved!',
      'delete': 'DELETE',
      'no_games_text_placeholder': 'There are no exercises. Add them using button with plus.',
      'errors': 'errors',
    },
    'pl': {
      'app_name': 'matematica vera',
      'addition': 'Dodawanie',
      'subtraction': 'Odejmowanie',
      'multiplication': 'Mnożenie',
      'division': 'Dzielenie',
      'range': 'Zakres:',
      'exercises': 'ćwiczeń',
      'never_done': 'Nigdy nie wykonano',
      'in_progress': 'W trakcie',
      'last_done': 'Zrobiono',
      'exercise_done': 'Ćwicznie wykonane!',
      'good_job': 'Dobra robota!',
      'go_back': 'WSTECZ',
      'repeat': 'POWTÓRZ',
      'add_exercise': 'Dodaj ćwiczenie',
      'save': 'ZAPISZ',
      'custom_name': 'Niestandardowa nazwa (opcjonalna)',
      'operation_type': 'Rodzaj działania',
      'operation_color': 'Kolor',
      'numbers_range': 'Zakres liczb',
      'maximum_result': 'Maksymlany wynik',
      'number_of_exercises': 'Ilość ćwiczeń',
      'number_of_answers': 'Ilość odpowiedzi',
      'it_is_possible_to_generate': 'Można wygenerować',
      'unique_exercises': 'niepowtarzających się ćwiczeń',
      'show_number_of_errors': 'Pokazuj ilość błędów',
      'maximum_result_empty_error': 'Pole nie może być puste',
      'number_of_exercises_empty_error': 'Pole nie może być puste',
      'number_of_exercises_too_low_error': 'Zbyt mała ilość ćwiczeń',
      'number_of_answers_too_big': 'Za dużo odpowiedzi dla danego maksymalnego wyniku',
      'correct_errors': 'Popraw błędy!',
      'saved': 'Zapisano!',
      'delete': 'USUŃ',
      'no_games_text_placeholder': 'Brak ćwiczeń. Dodaj je używając przycisku z plusem.',
      'errors': 'błedów',
    },
    'it': {
      'app_name': 'matematica vera',
      'addition': 'Addizione',
      'subtraction': 'Sottrazione',
      'multiplication': 'Moltiplicazione',
      'division': 'Divisione',
      'range': 'Gamma:',
      'exercises': 'esercizi',
      'never_done': 'Mai fatto prima',
      'in_progress': 'In corso',
      'last_done': 'Ultimo fatto',
      'exercise_done': 'Esercizio fatto!',
      'good_job': 'Buon lavoro!',
      'go_back': 'TORNA INDIETRO',
      'repeat': 'RIPETERE',
      'add_exercise': 'Aggiungi esercizio',
      'save': 'SALVA',
      'custom_name': 'Nome personalizzato (opzionale)',
      'operation_type': 'Tipo di operazione',
      'operation_color': 'Colore',
      'numbers_range': 'Gamma di numeri',
      'maximum_result': 'Risultato massimo',
      'number_of_exercises': 'Numero di esercizi',
      'number_of_answers': 'Numero di risposte',
      'it_is_possible_to_generate': 'È possibile generare',
      'unique_exercises': 'esercizi unici',
      'show_number_of_errors': 'Mostra il numero di errori',
      'maximum_result_empty_error': 'Il campo non può essere vuoto',
      'number_of_exercises_empty_error': 'Il campo non può essere vuoto',
      'number_of_exercises_too_low_error': 'Il numero di esercizi è troppo piccolo',
      'number_of_answers_too_big': 'Troppe risposte per ottenere il massimo risultato',
      'correct_errors': 'Errori corretti!',
      'saved': 'Salvato!',
      'delete': 'ELIMINA',
      'no_games_text_placeholder': 'Non ci sono esercizi. Aggiungili usando il pulsante con più.',
      'errors': 'errori',
    },
  };


  String get appName => _localizedValues[locale.languageCode]['app_name'];
  String operation(OperationType ot) {
    switch (ot) {
      case OperationType.addition:
        return _localizedValues[locale.languageCode]['addition'];

      case OperationType.subtraction:
        return _localizedValues[locale.languageCode]['subtraction'];

      case OperationType.multiplication:
        return _localizedValues[locale.languageCode]['multiplication'];

      case OperationType.division:
        return _localizedValues[locale.languageCode]['division'];
    }

    throw Exception("Unsuported `OperationType`");
  }
  String get range => _localizedValues[locale.languageCode]['range'];
  String get exercises => _localizedValues[locale.languageCode]['exercises'];
  String get neverDone => _localizedValues[locale.languageCode]['never_done'];
  String get inProgress => _localizedValues[locale.languageCode]['in_progress'];
  String get lastDone => _localizedValues[locale.languageCode]['last_done'];
  String get exerciseDone => _localizedValues[locale.languageCode]['exercise_done'];
  String get goodJob => _localizedValues[locale.languageCode]['good_job'];
  String get goBack => _localizedValues[locale.languageCode]['go_back'];
  String get repeat => _localizedValues[locale.languageCode]['repeat'];
  String get addExercise => _localizedValues[locale.languageCode]['add_exercise'];
  String get save => _localizedValues[locale.languageCode]['save'];
  String get customName => _localizedValues[locale.languageCode]['custom_name'];
  String get operationType => _localizedValues[locale.languageCode]['operation_type'];
  String get operationColor => _localizedValues[locale.languageCode]['operation_color'];
  String get numbersRange => _localizedValues[locale.languageCode]['numbers_range'];
  String get maximumResult => _localizedValues[locale.languageCode]['maximum_result'];
  String get numberOfExercises => _localizedValues[locale.languageCode]['number_of_exercises'];
  String get numberOfAnswers => _localizedValues[locale.languageCode]['number_of_answers'];
  String countOfGeneratedUniqueExercises(int count) {
    return "(" +
        _localizedValues[locale.languageCode]['it_is_possible_to_generate'] +
        " $count " +
        _localizedValues[locale.languageCode]['unique_exercises'] +
        ")";
  }
  String get showNumberOfErrors => _localizedValues[locale.languageCode]['show_number_of_errors'];
  String get maximumResultEmptyError => _localizedValues[locale.languageCode]['maximum_result_empty_error'];
  String get numberOfExercisesEmptyError => _localizedValues[locale.languageCode]['number_of_exercises_empty_error'];
  String get numberOfExercisesTooLowError => _localizedValues[locale.languageCode]['number_of_exercises_too_low_error'];
  String get numberOfAnswersTooBig => _localizedValues[locale.languageCode]['number_of_answers_too_big'];
  String get correctErrors => _localizedValues[locale.languageCode]['correct_errors'];
  String get saved => _localizedValues[locale.languageCode]['saved'];
  String get delete => _localizedValues[locale.languageCode]['delete'];
  String get noGamesTextPlaceholder => _localizedValues[locale.languageCode]['no_games_text_placeholder'];
  String get errors => _localizedValues[locale.languageCode]['errors'];
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