import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {

  final List<String> options;
  final Function(String) onOptionTap;

  const OptionsWidget({Key key, @required this.options, @required this.onOptionTap}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
  Row(
    children: options.map((o) => _buildOption(o)).toList(growable: false),
  );

  Widget _buildOption(String value) => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlineButton(onPressed: () { onOptionTap(value); },
      child: Text("$value"),),
    ),
  );
}