import 'package:flutter/material.dart';

class RiddleTextWidget extends StatefulWidget {

  final String text;
  final Color color;

  const RiddleTextWidget({Key key, @required this.text, @required this.color}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RiddleTextWidgetState();
}

class _RiddleTextWidgetState extends State<RiddleTextWidget> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300))
      ..repeat();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _animationController,
    builder: (context, child) => Center(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 72.0,
          color: TweenSequence<Color>([
            TweenSequenceItem(
              weight: 2.0,
              tween: ColorTween(
                begin: Colors.black,
                end: widget.color,
              ),
            ),
            TweenSequenceItem(
              weight: 1.0,
              tween: ColorTween(
                begin: widget.color,
                end: Colors.black,
              ),
            )
          ]).evaluate(AlwaysStoppedAnimation(_animationController.value)),
        ),
      ),
    ),
  );

}