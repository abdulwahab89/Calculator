import 'package:flutter/material.dart';
import 'MyButton.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';
  int count = 0;
  var array = ["*", "/", "-", "+", "%"];
  double size = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      userInput,
                      style: TextStyle(
                        fontSize: size,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer,
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xffffa00a),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          x: 'C',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            count = 0;
                            size = 24;
                            max();
                            setState(() {});
                            setState(() {});
                          },
                        ),
                        MyButton(
                            x: '%',
                            onPress: () {
                              userInput += '%';
                              max();
                              setState(() {});
                            }),
                        MyButton(
                            x: 'DEL',
                            onPress: () {
                              count--;
                              size++;
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        MyButton(
                          x: '/',
                          onPress: () {
                            userInput += '/';
                            max();
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            x: '7',
                            onPress: () {
                              max();
                              userInput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            x: '8',
                            onPress: () {
                              max();
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            x: '9',
                            onPress: () {
                              userInput += '9';
                              max();
                              setState(() {});
                            }),
                        MyButton(
                          x: 'x',
                          onPress: () {
                            max();
                            userInput += 'x';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            x: '4',
                            onPress: () {
                              max();
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            x: '5',
                            onPress: () {
                              max();
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            x: '6',
                            onPress: () {
                              max();
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                          x: '-',
                          onPress: () {
                            max();
                            userInput += '-';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          x: '1',
                          onPress: () {
                            max();
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            x: '2',
                            onPress: () {
                              max();
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            x: '3',
                            onPress: () {
                              max();
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                          x: '+',
                          onPress: () {
                            max();
                            userInput += '+';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            x: '00',
                            onPress: () {
                              max();
                              userInput += '00';
                              setState(() {});
                            }),
                        MyButton(
                          x: '0',
                          onPress: () {
                            max();
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            x: '.',
                            onPress: () {
                              max();
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                          onPress: () {
                            result();
                            setState(() {});
                          },
                          x: '=',
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void result() {
    String finalInput = userInput;
    finalInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    // int count = 0;
    // for (var j = 0; j < array.length; j++) {
    //   if (finalInput.contains(array[j])) {
    //     count++;
    //   }
    // }
    // if (count == 0) {
    answer = finalInput;
    answer = eval.toString();
  }

  //
  // void max() {
  //   if (count < 15) {
  //     count++;
  //     if (count == 14) {
  //       userInput = 'Max limit crossed';
  //       count = 0;
  //     }
  //   }
  // }
  void max() {
    if (count < 61) {
      count++;
      if (count > 30) {
        size--;
        if (size < 12) {
          size = 12;
        }
      }
    }
    if (count == 60) {
      userInput = '';
      count = 0;
      size = 24;
    }
  }
}
