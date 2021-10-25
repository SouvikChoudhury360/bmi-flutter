import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'display_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.resultText, @required this.resultBMI, @required this.inference});

  final String resultText;
  final String resultBMI;
  final String inference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Result', textAlign: TextAlign.center, style: kTitleTextStyle,),
              padding: EdgeInsets.only(top: 10.0),
            ),
          ),
          Expanded(
            flex: 4,
            child: DisplayCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),  style: kResultTextStyle,),
                  Text(resultBMI, style: kBMITextStyle,),
                  Text(inference, textAlign: TextAlign.center, style: kBodyTextStyle,),
                ],
              ),
            ),
          ),
          BottomButton(title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
