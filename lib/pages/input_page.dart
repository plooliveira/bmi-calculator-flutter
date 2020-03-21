import 'package:bmi_calculator/components/round_custom_button.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/DefaultBottomButton.dart';
import '../components/icon_content.dart';
import '../components/default_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculate_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.non;
  int height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//      appBar: AppBar(
//        title: Text('CALCULADORA IMC', style: TextStyle(color: Colors.black87),),
//
//      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Text('  Calcule seu IMC', style: TextStyle(fontSize: 30, color: Colors.black87),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: DefaultCard(
                        onPress: () {
                          setState(() {
                            genderSelected = Gender.male;
                          });
                        },
                        colorBase: genderSelected == Gender.male
                            ? kActiveColor
                            : kInactiveColor,
                        cardChild: MaleFemaleDecoration(
                          icon: FontAwesomeIcons.mars,
                          label: 'HOMEM',
                        ),
                      ),
                    ),
                    Expanded(
                      child: DefaultCard(
                        onPress: () {
                          setState(() {
                            genderSelected = Gender.female;
                          });
                        },
                        colorBase: genderSelected == Gender.female
                            ? kActiveColor
                            : kInactiveColor,
                        cardChild: MaleFemaleDecoration(
                          icon: FontAwesomeIcons.venus,
                          label: 'MULHER',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: DefaultCard(
                colorBase: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ALTURA',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kW900TextWeight,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFF00C58C),
                        overlayColor: Color(0x2900C58C),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: DefaultCard(
                    colorBase: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kW900TextWeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundCustomButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundCustomButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultCard(
                    colorBase: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kW900TextWeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundCustomButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundCustomButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 110) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            DefaultBottomButton(
              onTap: () {
                if (genderSelected == null) {
                  genderSelected = Gender.male;
                }
                CalculateBrain calc = CalculateBrain(
                    weight: weight.toDouble(),
                    height: height.toDouble(),
                    gender: genderSelected);
                calc.calculateBmi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      result: calc.getResult(),
                      bmiNumber: calc.calculateBmi(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              label: 'CALCULAR',
            ),
          ],
        ),
      ),
    );
  }
}
