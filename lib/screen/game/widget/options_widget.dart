import 'package:flutter/material.dart';

class OptionsWidget extends StatefulWidget {
  final String optionToHighlight;
  final Color color;
  final List<String> options;
  final Function(String) onOptionTap;

  const OptionsWidget(
      {Key key,
      @required this.optionToHighlight,
      @required this.color,
      @required this.options,
      @required this.onOptionTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
        children:
            widget.options.map((o) => _buildOption(o)).toList(growable: false),
      );

  Widget _buildOption(String value) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: widget.onOptionTap != null ? () => widget.onOptionTap(value) : null,
              child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      ),
                      color: (value == widget.optionToHighlight) ? TweenSequence<Color>([
                        TweenSequenceItem(
                          weight: 2.0,
                          tween: ColorTween(
                            begin: Colors.transparent,
                            end: widget.color,
                          ),
                        ),
                        TweenSequenceItem(
                          weight: 1.0,
                          tween: ColorTween(
                            begin: widget.color,
                            end: Colors.transparent,
                          ),
                        )
                      ]).evaluate(AlwaysStoppedAnimation(_animationController.value),) : Colors.transparent
                  ),
                  child: Center(
                    child: Text(value),
                  )),
            ),
          ),
        )
  );
}