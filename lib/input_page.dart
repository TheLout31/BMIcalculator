import 'package:flutter/material.dart';
import 'package:healthapp/result_page.dart';
import 'resuable_page.dart';
import 'icon_page.dart';
import 'constants.dart';
import 'result_page.dart';
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
  Color maleCardColour = activeCardColor;
  Color femaleCardColour = activeCardColor;
  int height = 160;
  int weight = 60;
  int age = 10;
  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == activeCardColor) {
        maleCardColour = inactiveCardColor;
        femaleCardColour = activeCardColor;
      } else {
        maleCardColour = activeCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColour == activeCardColor) {
        femaleCardColour = inactiveCardColor;
        maleCardColour = activeCardColor;
      } else {
        femaleCardColour = activeCardColor;
      }
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: const Text('Health App'),
          centerTitle: true,
          leading: Container(
              color: Color(0x00ffffff),
              child: IconButton(
                icon: Icon(Icons.lightbulb_outline),
                iconSize: 30,
                onPressed: () {},
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                //FEMALE
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableWidget(
                      colour: femaleCardColour,
                      cardChild: icon_widget(
                        icon: Icons.female_sharp,
                        gender: 'Female',
                      ),
                    ),
                  ),
                ),

                //MALE
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableWidget(
                      colour: maleCardColour,
                      cardChild: icon_widget(
                        icon: Icons.male_sharp,
                        gender: 'Male',
                      ),
                    ),
                  ),
                ),
              ],
            )),

            //MIDDLE CONTAINER
            Expanded(
              child: ReusableWidget(
                colour: cardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      'Height',
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: textStyle2,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey[400],
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.purple,
                        overlayColor: Colors.white24,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 150.0,
                          max: 190.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),

            //SECOND LAST ROW CONTAINERS
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    colour: cardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ignore: prefer_const_constructors
                        Text(
                          'Weight',
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: textStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: cardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ignore: prefer_const_constructors
                        Text(
                          'Age',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: textStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: "btn3",
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              heroTag: "btn4",
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),

            //LAST CONTAINER
            GestureDetector(
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: cal.calculateBMI(),
                            resultText: cal.getResult(),
                            advise: cal.getAdvice(),
                          )),
                );
              },
              child: Container(
                child: Center(
                  child: Text('CALCULATE', style: textstylebutton),
                ),
                color: Colors.purple,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 60.0,
              ),
            )
          ],
        ));
  }
}
