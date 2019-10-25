import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result.page.dart';
import 'bottom_button.dart';
import 'calculate_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? cColorContainer
                        : cInActiveColor,
                    cardChild: new ReusableIcon(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? cColorContainer
                        : cInActiveColor,
                    cardChild: new ReusableIcon(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: cColorContainer,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Height',
                    style: cLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: cNumberStyle,
                      ),
                      Text(
                        'Cm',
                        style: cLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.redAccent,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      inactiveColor: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: cColorContainer,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: cLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: cNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconRoundButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconRoundButton(
                              hoveColor: Colors.redAccent,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    colour: cColorContainer,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: cLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: cNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconRoundButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconRoundButton(
                              hoveColor: Colors.redAccent,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              CalculateBrain calc =
                  CalculateBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            label: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class IconRoundButton extends StatelessWidget {
  IconRoundButton({this.child, @required this.onPress, this.hoveColor});

  final Widget child;
  final Function onPress;
  final Color hoveColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      hoverColor: hoveColor,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPress,
    );
  }
}
