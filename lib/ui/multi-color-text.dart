import 'package:flutter/material.dart';

class MultiColorText extends StatelessWidget {
  MultiColorText({
    @required this.textOne,
    @required this.textTwo,
    @required this.colorOne,
    @required this.colorTwo,
    @required this.fontSize,
  });

  final String textOne;
  final String textTwo;
  final Color colorOne;
  final Color colorTwo;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$textOne',
            style: TextStyle(
              color: colorOne,
              fontSize: fontSize,
            ),
            //textAlign: TextAlign.end,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            '$textTwo',
            style: TextStyle(color: colorTwo, fontSize: fontSize),
            //textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
