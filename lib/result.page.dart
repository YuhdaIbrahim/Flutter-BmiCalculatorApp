import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'calculate_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Your Result :',
                style: cLarge2Style,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: cColorContainer,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    resultText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: cOverStyle,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    bmiResult,
                    textAlign: TextAlign.center,
                    style: cNumberOverStyle,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: cLabelStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            label: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
