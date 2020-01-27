import 'package:flutter/material.dart';

pushScreen(BuildContext context, Widget screen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => screen));
}

popScreen(BuildContext context) {
  Navigator.of(context).pop();
}