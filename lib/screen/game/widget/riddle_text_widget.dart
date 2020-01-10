import 'package:flutter/material.dart';

class RiddleTextWidget extends StatefulWidget {

  final String text;

  const RiddleTextWidget({Key key, @required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RiddleTextWidgetState();
}

class _RiddleTextWidgetState extends State<RiddleTextWidget> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _colorTween;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200));
    _colorTween = ColorTween(
      begin: Colors.green, end: Colors.red,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Expanded(
    child: Center(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 72.0,
          color: _colorTween.value,
        ),
      ),
    ),
  );

}