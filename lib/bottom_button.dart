import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculation.dart';
import 'result_page.dart';

class BottomButton extends StatelessWidget {
BottomButton({this.onTap(), this.title});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(title, style: kLargeTextStyle,),
        ),
        color: kBottomBarColor,
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomBarHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}