import 'package:bmi_calculator/button_bottom.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResults, @required this.interpretation, @required this.resultsText});
  final String bmiResults;
  final String resultsText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULTS',
                  style: kTitleText,

                ),
              ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCrad(
                colour: kActiveColorCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultsText.toUpperCase(),
                      style: kResulatTextStyle,
                    ),
                    Text(
                      bmiResults,
                      style: kBMI,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyText,
                    ),
                  ],
                ),
              ),
          ),
          bottomButton(ontap: (){
            Navigator.pop(context);
          }, buttontitle: 'RE-CALCULATE')
        ],

      ),
    );
  }
}
