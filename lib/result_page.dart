import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';
import 'input_page.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.advise,
      required this.bmiResult,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String advise;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Your Result',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(resultText,
                      style: TextStyle(
                          color: resultText == 'NORMAL'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    bmiResult.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    advise,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
              margin: EdgeInsets.all(10),
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  color: cardColour,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: textstylebutton,
                ),
              ),
              height: 70,
              width: 400,
            ),
          )
        ],
      ),
    );
  }
}
