import 'package:flutter/material.dart';
import 'package:calculator/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(userInput.toString(),
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(result.toString(),
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white)),
                        )
                      ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              result = '';
                              setState(() {});
                            }),
                        MyButton(
                            title: '(',
                            onPress: () {
                              userInput += '(';
                              setState(() {});
                            }),
                        MyButton(
                          title: ')',
                          onPress: () {
                            userInput += ')';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          buttonBackgroundColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';

                              setState(() {});
                            }),
                        MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x',
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          buttonBackgroundColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          buttonBackgroundColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          buttonBackgroundColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          onPress: () {
                            calculateAnswer();
                            setState(() {});
                          },
                          buttonBackgroundColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculateAnswer() {
    String finalInput = userInput.replaceAll('x', '*');
    Parser p1 = Parser();
    Expression exp = p1.parse(finalInput);
    ContextModel cm = ContextModel();

    double output = exp.evaluate(EvaluationType.REAL, cm);
    int ifIntegar = 0;
    if (output % 1 == 0) {
      ifIntegar = output.toInt();
      result = ifIntegar.toString();
    } else {
      result = output.toString();
    }
  }
}
