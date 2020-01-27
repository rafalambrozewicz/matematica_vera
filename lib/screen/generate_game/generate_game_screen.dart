import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/core/navigator.dart';
import 'package:matematica_vera/db/db_client.dart';
import 'package:matematica_vera/domain/game_config.dart';
import 'package:matematica_vera/domain/operation_type.dart';
import 'package:matematica_vera/domain/unique_operations_count_calculator.dart';
import 'package:matematica_vera/screen/generate_game/widget/header.dart';
import 'package:matematica_vera/util/number_value_limiting_text_input_formatter.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class GenerateGameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GenerateGameScreenState();
}

class _GenerateGameScreenState extends State<GenerateGameScreen> {
  RangeValues _rangeValues = RangeValues(10, 40);
  static const _rangeValueToStepValue = {
    0: 0,
    10: 1,
    20: 2,
    30: 5,
    40: 10,
    50: 15,
    60: 20,
    70: 25,
    80: 50,
    90: 75,
    100: 100,
  };

  static const _numberOfAnswersOptions = [2, 3, 4, 6, 8];
  int _selectedNumberOfAnswers = 4;

  static const _operationTypeOptions = [
    OperationType.addition,
    OperationType.subtraction,
    OperationType.multiplication,
    OperationType.division
  ];
  OperationType _selectedOperationType = OperationType.values.first;
  Map<OperationType, String> _operationTypeToName = {};

  final _colors = [
    Colors.grey[50],
    Colors.red[300],
    Colors.pink[300],
    Colors.purple[300],
    Colors.deepPurple[300],
    Colors.indigo[300],
    Colors.blue[300],
    Colors.lightBlue[300],
    Colors.cyan[300],
    Colors.teal[300],
    Colors.green[300],
    Colors.lightGreen[300],
    Colors.lime[300],
    Colors.yellow[300],
    Colors.amber[300],
    Colors.orange[300],
    Colors.deepOrange[300],
    Colors.brown[300],
  ];

  Color _selectedColor = Colors.grey[50];

  bool _showErrorsSelected = false;

  final _customNameTextController = TextEditingController();
  final _maxResultTextController = TextEditingController()
    ..text="10";
  final _operationsCountTextController = TextEditingController()
    ..text="25";

  String _maxResultError;
  String _operationsCountError;
  String _numberOfAnswersError;

  final uocc = UniqueOperationsCountCalculator();
  AppLocalization _loc;


  @override
  void dispose() {
    _customNameTextController.dispose();
    _maxResultTextController.dispose();
    _operationsCountTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loc = AppLocalization.of(context);
    init();

    return Scaffold(
      appBar: AppBar(
        title: Text(_loc.addExercise),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () { _saveGame(context); },
                child: Text(_loc.save,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  void init() {
    if (_operationTypeToName.isEmpty) {
      OperationType.values.forEach((ot) {
        final operationName = _loc.operation(ot);
        _operationTypeToName.putIfAbsent(ot, () => operationName);
      });
    }
  }

  Future _saveGame(BuildContext context) async {
    if (_maxResultError == null &&
        _operationsCountError == null &&
        _numberOfAnswersError == null) {
      await dbClient.insertGameConfig(GameConfig(
        id: Uuid().v4().replaceAll("-", ""),
        customName: _customNameTextController.text.isNotEmpty ? _customNameTextController.text : null,
        color: _selectedColor,
        operationType: _selectedOperationType,
        minNumber: _rangeValueToStepValue[_rangeValues.start],
        maxNumber: _rangeValueToStepValue[_rangeValues.end],
        maxResult: int.parse(_maxResultTextController.text),
        numberOfExercises: int.parse(_operationsCountTextController.text),
        numberOfAnswers: _selectedNumberOfAnswers,
        showErrorsCount: _showErrorsSelected,
      ));
      Toast.show(_loc.saved, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      popScreen(context);
    } else {
      Toast.show(_loc.correctErrors, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
  }

  Widget _buildBody() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCustomNameRow(),
            _buildChooseExerciseColorRow(),
            _buildOperationTypeRow(),
            _buildSelectRangeRow(),
            _buildMaximumResultRow(),
            _buildNumberOfOperationsRow(),
            _buildNumberOfAnswersRow(),
            _buildShowErrorsCountRow(),
          ],
        ),
      );

  Widget _buildCustomNameRow() => Column(
        children: <Widget>[
          Header(text: _loc.customName),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: TextField(
              maxLines: 1,
              maxLength: 64,
              controller: _customNameTextController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  isDense: true),
            ),
          )
        ],
      );

  Widget _buildChooseExerciseColorRow()  => Column(
    children: <Widget>[
      Header(text: _loc.operationColor),
      Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
        child: DropdownButton<Color>(
          isExpanded: true,
          value: _selectedColor,
          onChanged: (Color newValue) {
            setState(() {
              _selectedColor = newValue;
            });
          },
          items: _colors
              .map<DropdownMenuItem<Color>>((value) {
            return DropdownMenuItem<Color>(
              value: value,
              child: Container(
                  height: 24.0,
                  color: value),
            );
          }).toList(),
        ),
      ),
    ],
  );

  Widget _buildOperationTypeRow() => Column(
        children: <Widget>[
          Header(text: _loc.operationType),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: DropdownButton<OperationType>(
              isExpanded: true,
              value: _selectedOperationType,
              onChanged: (OperationType newValue) {
                setState(() {
                  _selectedOperationType = newValue;
                });
              },
              items: _operationTypeOptions
                  .map<DropdownMenuItem<OperationType>>((OperationType value) {
                return DropdownMenuItem<OperationType>(
                  value: value,
                  child: Text(_operationTypeToName[value]),
                );
              }).toList(),
            ),
          ),
        ],
      );

  Widget _buildSelectRangeRow() => Column(
        children: <Widget>[
          Header(text: _loc.numbersRange),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            child: RangeSlider(
                min: 0,
                max: 100,
                divisions: 10,
                values: _rangeValues,
                labels: RangeLabels(
                    "${_rangeValueToStepValue[_rangeValues.start]}",
                    "${_rangeValueToStepValue[_rangeValues.end]}"),
                onChanged: (values) {
                  setState(() {
                    if (values.end - values.start >= 20) {
                      _rangeValues = values;
                    } else {
                      if (_rangeValues.start == values.start) {
                        _rangeValues = RangeValues(_rangeValues.start, _rangeValues.start + 20);
                      } else {
                        _rangeValues = RangeValues(_rangeValues.end - 20, _rangeValues.end);
                      }
                    }
                  });
                }),
          ),
          Text("< ${_rangeValueToStepValue[_rangeValues.start]} ; ${_rangeValueToStepValue[_rangeValues.end]} >"),
        ],
      );

  Widget _buildMaximumResultRow() => Column(
        children: <Widget>[
          Header(text: _loc.maximumResult),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: TextField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              controller: _maxResultTextController,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                NumberValueLimitingTextInputFormatter(
                    maximumValueInclusive: 1000),
              ],
              decoration: InputDecoration(
                  hintText: "0",
                  isDense: true,
                  errorText: _maxResultError),
              onChanged: (_) { setState(() {
                if (_maxResultTextController.text.isEmpty) {
                  _maxResultError = _loc.maximumResultEmptyError;
                } else {
                  _maxResultError = null;
                }

                if ((int.tryParse(_maxResultTextController.text) ?? 0 + 1) < _selectedNumberOfAnswers) {
                  _numberOfAnswersError = _loc.numberOfAnswersTooBig;
                } else {
                  _numberOfAnswersError = null;
                }
              }); },
            ),
          )
        ],
      );

  Widget _buildNumberOfOperationsRow() => Column(
        children: <Widget>[
          Header(text: _loc.numberOfExercises),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: TextField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              controller: _operationsCountTextController,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                NumberValueLimitingTextInputFormatter(
                    maximumValueInclusive: 500),
              ],
              decoration: InputDecoration(
                  isDense: true,
                  errorText: _operationsCountError),
              onChanged: (_) { setState(() {
                if (_operationsCountTextController.text.isEmpty) {
                  _operationsCountError = _loc.numberOfExercisesEmptyError;
                } else if (int.parse(_operationsCountTextController.text) == 0) {
                _operationsCountError = _loc.numberOfExercisesTooLowError;
                } else {
                _operationsCountError = null;
                }
              }); },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("${_loc.countOfGeneratedUniqueExercises(
                uocc.calculate(
                    ot: _selectedOperationType,
                    minNumber: _rangeValueToStepValue[_rangeValues.start],
                    maxNumber: _rangeValueToStepValue[_rangeValues.end],
                    maxResult: int.tryParse(_maxResultTextController.text) ?? 0,
                ).uniqueOperationsCount)}",
            overflow: TextOverflow.clip,),
          ),
        ],
      );

  Widget _buildNumberOfAnswersRow() => Column(
        children: <Widget>[
          Header(text: _loc.numberOfAnswers),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: DropdownButton<int>(
              isExpanded: true,
              value: _selectedNumberOfAnswers,
              onChanged: (int newValue) {
                setState(() {
                  _selectedNumberOfAnswers = newValue;

                  if ((int.tryParse(_maxResultTextController.text) ?? 0 + 1) < _selectedNumberOfAnswers) {
                    _numberOfAnswersError = _loc.numberOfAnswersTooBig;
                  } else {
                    _numberOfAnswersError = null;
                  }
                });
              },
              items: _numberOfAnswersOptions
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                (_numberOfAnswersError != null) ? Text(_numberOfAnswersError,
                  style: TextStyle(
                      color: Theme.of(context).errorColor,
                      fontSize: 12.0),) : Container(),
              ],
            ),
          )

        ],
      );

  Widget _buildShowErrorsCountRow() => Row(
      children: <Widget>[
        Checkbox(
          value: _showErrorsSelected,
          onChanged: (isSelected) {
            setState(() {
              _showErrorsSelected = isSelected;
            });
          },
        ),
        Text(_loc.showNumberOfErrors),
      ],
    );
}
