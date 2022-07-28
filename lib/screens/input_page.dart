// ignore_for_file: invalid_required_positional_param

import 'package:ibm_calculater/calculator_brain.dart';
import 'package:ibm_calculater/screens/results.dart';
import 'package:ibm_calculater/widgets/reusable_card.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';
import '../widgets/icon_contenet.dart';
import '';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int rating = 0;
  int height = 180;
  int weight = 60;
  int age = 18;
  // void updateColor(Gender selectedGender) {
  //   //male card pressed
  //   selectedGender == Gender.male?
  //   {}
  //     femaleCardColor = inactiveCardColor;
  //     maleCardColr = activeCardColor;
  //    } :  {
  //     femaleCardColor = activeCardColor;
  //     maleCardColr = inactiveCardColor;

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.male
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    IconContent(FontAwesomeIcons.mars, 'MALE'),
                    () => {
                      setState(() {
                        selectedGender = Gender.male;
                      })
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.female
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    IconContent(FontAwesomeIcons.venus, 'FEMAL'),
                    () => {
                      setState(() {
                        selectedGender = Gender.female;
                      })
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                KInactiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'HEIGHT',
                      textAlign: TextAlign.center,
                      style: KLabelTextStyel,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: KLabelTextStyel,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: KActiveCardColor,
                          activeTrackColor: Colors.white,
                          overlayColor: Colors.amber.shade300,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: Color(0xff8d8e98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          }),
                    ),
                  ],
                ),
                null),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      KInactiveCardColor,
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: KLabelTextStyel,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  if (weight > 0)
                                    setState(() {
                                      weight--;
                                    });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            ),
                          ]),
                      null),
                ),
                Expanded(
                    child: ReusableCard(
                        KInactiveCardColor,
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: KLabelTextStyel,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(FontAwesomeIcons.minus, () {
                                    if (age > 0)
                                      setState(() {
                                        age--;
                                      });
                                  }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(FontAwesomeIcons.plus, () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                                ],
                              ),
                            ]),
                        null)),
              ],
            ),
          ),
          BottomButton('CALCULATE', () {
            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(calc.calculateBMI(),
                        calc.getResult(), calc.getInterpretation())));
          }),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final VoidCallback onPressed;
  // ignore: use_key_in_widget_constructors
  RoundIconButton(@required this.child, @required this.onPressed);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        child,
        color: Colors.white,
      ),
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: KActiveCardColor,
    );
  }
}
