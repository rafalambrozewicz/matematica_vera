import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_localization.dart';

class ErrorsCount extends StatelessWidget {

  final int numberOfErrors;

  const ErrorsCount({Key key, this.numberOfErrors}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Container(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            RotatedBox(
                quarterTurns: 3,
                child: Text(AppLocalization.of(context).errors.toUpperCase())),
            Text(numberOfErrors.toString(), style: TextStyle(fontSize: 64.0),),
          ],
        ),
      ),
    );
}