import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_color.dart';

class Header extends StatelessWidget {
  final String text;

  const Header({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              text.toUpperCase(),
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
                color: AppColor.gray,
              ),
            ),
          ],
        ),
      );
}
