import 'package:flutter/material.dart';
import 'IconContent.dart';
import 'ElementCard.dart';
import 'constants.dart';
import 'CustomButton.dart';
import 'ResultPage.dart';
import 'brain.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.none;
  int height = 100;
  int weight = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI CALCULATOR"),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      child: ElementCard(
                        colour: gender == Gender.male
                            ? ElementActiveColour
                            : ElementInactiveColour,
                        cardChild: IconContent(
                          text: "MALE",
                          icon: Icons.male,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      child: ElementCard(
                        colour: gender == Gender.female
                            ? ElementActiveColour
                            : ElementInactiveColour,
                        cardChild: IconContent(
                          text: "FEMALE",
                          icon: Icons.female,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElementCard(
                colour: ElementActiveColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "HEIGHT",
                        style: TextStyle(color: LabelColour, fontSize: 20.0,fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w500),
                        ),
                        Text("cm"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      ),
                      child: Slider(
                        thumbColor: BottomCardColour,
                        activeColor: BottomCardColour,
                        inactiveColor: LabelColour,
                        min: 100.0,
                        max: 250.0,
                        value: height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            height = int.parse(value.toStringAsFixed(0));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ElementCard(
                      colour: ElementActiveColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: LabelColour,
                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 50.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: CustomButton(icon: Icons.add),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                child: CustomButton(icon: Icons.remove),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElementCard(
                      colour: ElementActiveColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: LabelColour,
                            ),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 50.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: CustomButton(icon: Icons.add,),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                child: CustomButton(icon: Icons.remove,),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Calculator calc = Calculator(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(calc: calc,)));
              },
              child: Container(
                color: BottomCardColour,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0),
                height: BottomCardHeight,
                child: Center(
                  child: Text(
                    "CALCULATE",
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
        ));
  }
}
