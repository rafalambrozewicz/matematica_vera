import 'package:flutter/material.dart';

pushScreen(BuildContext ctx, Widget screen) {
  Navigator.of(ctx)
      .push(MaterialPageRoute(builder: (BuildContext context) => screen));
}

popScreen(BuildContext ctx,) {
  Navigator.of(ctx).pop();
}