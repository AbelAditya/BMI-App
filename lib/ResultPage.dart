import 'package:flutter/material.dart';
import 'ElementCard.dart';
import 'constants.dart';
import 'brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.calc});

  final Calculator calc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            child: ElementCard(
              colour: ElementActiveColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calc.result(),
                    style: TextStyle(fontSize: 22.0, color: Colors.green),
                  ),
                  Text(
                    calc.BMIval(),
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    calc.comment(),
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            flex: 5,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: BottomCardColour,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              height: BottomCardHeight,
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
