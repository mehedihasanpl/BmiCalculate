import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'data_container.dart';

final activeColor = Colors.blueAccent.shade700;
const inActiveColor = Color(0xFF24232F);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 70;
  int age = 25;
  String result = "";
  String resultDetail = "";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "OVERWEIGHT";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "UNDERWEIGHT";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(1);
                        });
                      },
                      child: ContainerBox(
                        boxColor: maleBoxColor,
                        childWidget: const DataContainer(
                            title: "MALE", icon: FontAwesomeIcons.mars),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(2);
                        });
                      },
                      child: ContainerBox(
                          boxColor: femaleBoxColor,
                          childWidget: const DataContainer(
                              icon: FontAwesomeIcons.venus, title: "FEMALE")),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("HEIGHT", style: textStyle1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: textStyle2),
                      const Text("cm", style: textStyle1),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 90,
                    max: 200,
                    activeColor: activeColor,
                    inactiveColor: Colors.blueGrey.shade600,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ContainerBox(
                        boxColor: inActiveColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("WEIGHT", style: textStyle1),
                            Text(weight.toString(), style: textStyle2),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                  backgroundColor: activeColor,
                                  child: const Icon(FontAwesomeIcons.plus,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                FloatingActionButton(
                                    backgroundColor: activeColor,
                                    child: const Icon(FontAwesomeIcons.minus,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 1) {
                                          weight--;
                                        }
                                      });
                                    })
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ContainerBox(
                        boxColor: inActiveColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("AGE", style: textStyle1),
                            Text(age.toString(), style: textStyle2),
                            const SizedBox(
                              height: 2,
                              width: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                  backgroundColor: activeColor,
                                  child: const Icon(FontAwesomeIcons.plus,
                                      weight:2,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                FloatingActionButton(
                                    backgroundColor: activeColor,
                                    child: const Icon(FontAwesomeIcons.minus,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (age > 1) {
                                          age--;
                                        }
                                      });
                                    })
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  resultDetail = getInterpretation(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: inActiveColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            color: inActiveColor,
                            height: 150.0,
                            margin: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Result",
                                  style: textStyle1,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 2.0, bottom: 2.0),
                                  child: Text(
                                    result.toString(),
                                    style: textStyle2,
                                  ),
                                ),
                                Text(
                                  resultDetail,
                                  style: textStyle1,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: activeColor,
                ),
                width: 340.0,
                height: 60.0,
                margin: const EdgeInsets.only(bottom: 15.0, top: 10.0),
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: textStyle3,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}