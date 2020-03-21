import 'package:bmi_calculator/components/DefaultBottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/default_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.result,@required this.bmiNumber,@required this.interpretation});

  final String result;
  final String bmiNumber;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('CALCULADORA IMC'),
//      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Seu Resultado',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: DefaultCard(
              colorBase: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(
                    result.toUpperCase(),
                    style: kBmiLabel,
                  ),

                  Text(
                    bmiNumber,
                    style: kW900TextWeight.copyWith(
                      fontSize: 100.0,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0,

                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          DefaultBottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            label: 'RECALCULAR',
          ),
        ],
      ),
    );
  }
}
