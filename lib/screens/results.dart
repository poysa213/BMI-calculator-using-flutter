import 'package:flutter/material.dart';
import 'package:ibm_calculater/constants.dart';
import '../widgets/reusable_card.dart';
import '../constants.dart';
import '../widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultsPage(@required this.bmiResult, @required this.interpretation,
      @required this.resultText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KActiveCardColor,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: KInactiveCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text(
                  'Your Result',
                  style: KTitleTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                    Color.fromARGB(110, 27, 27, 45),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          interpretation.toUpperCase(),
                          style: KResulTextStyle,
                        ),
                        Text(
                          bmiResult,
                          style: KBMITextStyle,
                        ),
                        Text(
                          resultText,
                          style: KBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    null)),
            BottomButton('RE-CALCULAUTE', () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
