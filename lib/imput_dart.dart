import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'button_bottom.dart';
import 'round_icon.dart';
import 'calculator_brain.dart';



enum Gender{
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
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCrad(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? kActiveColorCard : kInactiveCardColor,
                cardChild: IconContent(
                  icon:FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              ),
              ),
              Expanded(child: ReusableCrad(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveColorCard : kInactiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              ),
              ),
            ],
          ),),
          Expanded(
            child: ReusableCrad(
                colour: kActiveColorCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(

                      inactiveTickMarkColor: Color(0xff8D8E98),
                      thumbColor: Color(0xff1565C0),
                      overlayColor: Color(0x2915650),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 250.0,
                      onChanged: (double newValue){
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
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCrad(
                    colour: kActiveColorCard,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.add,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),


              Expanded(
                child: ReusableCrad(
                    colour: kActiveColorCard,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE' , style: kLabelTextStyle,
                      ),
                      Text(
                          age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                            setState(() {
                              age--;
                            });
                          },),

                          SizedBox(width: 10.0,),

                          RoundIconButton(icon: FontAwesomeIcons.add, onPressed: () {
                            setState(() {
                              age++;
                            });
                          },)

                        ],
                      ),

                    ],
                  ),

                ),
              ),
            ],
          ),
          ),














          bottomButton(buttontitle: 'CALCULATE',
            ontap: (){
            Calculatorbrain calc = Calculatorbrain(height: height, weight: weight);
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResults: calc.calaculateBMI(),
              resultsText: calc.getResults(),
              interpretation: calc.getInterpretratiom(),
            ),),);
          },),
        ],
      ),
    );
  }
}





