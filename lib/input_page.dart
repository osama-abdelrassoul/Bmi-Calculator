import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  var height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                      selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      IconContent(FontAwesomeIcons.mars, 'MALE')),
                )),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                          selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          IconContent(FontAwesomeIcons.venus, 'FEMALE'))),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
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
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                              print(height);
                            });
                          }),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF313544),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF313544),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF313544),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF313544),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        )))
              ],
            ),
          ),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      bmiText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
