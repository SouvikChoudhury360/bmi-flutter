import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_widget.dart';
import 'display_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';
import 'calculation.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = null;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: DisplayCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconWidget(icon: FontAwesomeIcons.mars, label: 'MALE'),
              ),
              ),
              Expanded(child: DisplayCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconWidget(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: DisplayCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kHeavyWeightStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 240,
                      activeColor: Color(0xFFEB1555),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                  ),
                ],
              ),
              colour: kActiveCardColor,
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: DisplayCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabelTextStyle,),
                          Text(weight.toString(), style: kHeavyWeightStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(ico: FontAwesomeIcons.minus, onTap: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                              ),
                              SizedBox( width: 20.0,),
                              RoundIconButton(ico: FontAwesomeIcons.plus, onTap: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                              ),
                            ],
                          )
                        ],
                      ),
                  ),
              ),
              Expanded(
                  child: DisplayCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kLabelTextStyle,),
                          Text(age.toString(), style: kHeavyWeightStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(ico: FontAwesomeIcons.minus, onTap: () {
                                setState(() {
                                  age = age - 1;
                                },);
                              },
                              ),
                              SizedBox( width: 20.0,),
                              RoundIconButton(ico: FontAwesomeIcons.plus, onTap: () {
                                setState(() {
                                  age = age + 1;
                                },);
                              },
                              ),
                            ],
                          )
                        ],
                      ),
                  ),
              ),
            ],
          ),
          ),
          BottomButton(onTap: () {
            Calculation calc =  Calculation(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              resultBMI: calc.calculateBMI(), resultText: calc.getResult(), inference: calc.getInference(),
            )));
          }, title: 'CALCULATE',)
        ],
      ),
    );
  }
}



