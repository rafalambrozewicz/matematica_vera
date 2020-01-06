import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_color.dart';

class ProgressWidget extends StatelessWidget {
  static const _padding = 16.0;
  static const _height = 24.0;

  final int currentValue;
  final int maxValue;

  const ProgressWidget(
      {Key key, @required this.currentValue, @required this.maxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(_padding),
    child: Stack(
      children: <Widget>[
        Container(
          height: _height,
          child:  LinearProgressIndicator(
            value: currentValue / maxValue,
          ),
        ),
        Container(
            height: _height,
            child: Center(
                child: Text("$currentValue / $maxValue",
                style: TextStyle(
                  color: AppColor.white,
                    fontWeight: FontWeight.bold),),)),
      ],
    ),
  );
}
