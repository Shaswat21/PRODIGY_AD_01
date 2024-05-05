import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neumorphic_calculator/widgets/neu_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = '';
  String result = '0';
  bool equal = false;
  int brac = 0;

  bool isLastCharacterNumeric(String input) {
    if (input.isEmpty) {
      return false;
    }

    final lastChar = input[input.length - 1];
    return int.tryParse(lastChar) != null;
  }

  void commonForDigit(val) {
    if (equal) {
      expression = val;
    } else {
      expression += val;
    }
    if (brac > 0) {
      result = evalEx(expression + ')' * brac);
    } else {
      result = evalEx(expression);
    }
    equal = false;
  }

  String evalEx(s) {
    try {
      s = s.toString().replaceAll('×', '*').replaceAll('÷', '/');
      Expression ex = Parser().parse(s);
      ContextModel cm = ContextModel();
      double eval = ex.evaluate(EvaluationType.REAL, cm);
      String evalS = eval.toString();
      if (eval.toString().contains('.0')) {
        // print(eval.toString().substring(eval.toString().indexOf('.0') + 2));
        if (eval
            .toString()
            .substring(eval.toString().indexOf('.0') + 2)
            .isEmpty) {
          evalS = eval.toString().split('.')[0];
        } else {
          evalS = eval.toStringAsFixed(3);
        }
      } else {
        evalS = eval.toStringAsFixed(3);
        evalS = customRound(double.parse(evalS), 2).toString();
      }
      return evalS;
    } catch (e) {
      return "Error";
    }
  }

  dynamic customRound(number, place) {
    var valueForPlace = pow(10, place);
    return (number * valueForPlace).round() / valueForPlace;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Screen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      expression != '' ? expression : '0',
                      style: equal
                          ? Theme.of(context).textTheme.labelSmall
                          : Theme.of(context).textTheme.labelLarge,
                    )),
                expression != ''
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '= $result',
                          style: equal
                              ? Theme.of(context).textTheme.labelLarge
                              : Theme.of(context).textTheme.labelSmall,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          //Keypad
          SizedBox(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // C, (, ), ÷
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeuButton(
                      text: 'C',
                      onLongPress: () => setState(() {
                        expression = '';
                        result = '0';
                      }),
                      onTap: () => setState(() {
                        equal = false;
                        if (expression.isNotEmpty) {
                          expression =
                              expression.substring(0, expression.length - 1);
                          if (isLastCharacterNumeric(expression)) {
                            if (brac > 0) {
                              result = evalEx(expression + ')' * brac);
                            } else {
                              result = evalEx(expression);
                            }
                          }
                        } else {
                          expression = '';
                          result = '0';
                        }
                      }),
                    ),
                    NeuButton(
                      text: '(',
                      isDigit: true,
                      onTap: () => setState(() {
                        if (equal) {
                          expression = '$result×(';
                          equal = false;
                        } else {
                          if (isLastCharacterNumeric(expression)) {
                            expression += '×(';
                          } else {
                            expression += '(';
                          }
                        }
                        ++brac;
                      }),
                    ),
                    NeuButton(
                      text: ')',
                      isDigit: true,
                      onTap: () => setState(() {
                        expression += ')';
                        if (brac > 0) {
                          --brac;
                        }
                        if (brac == 0) {
                          result = evalEx(expression);
                        }
                      }),
                    ),
                    NeuButton(
                      text: '÷',
                      onTap: () => setState(() {
                        if (equal) {
                          expression = '$result÷';
                          equal = false;
                        } else {
                          expression += '÷';
                        }
                      }),
                    )
                  ],
                ),
                // 7, 8, 9, X
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeuButton(
                      text: '7',
                      isDigit: true,
                      onTap: () {
                        setState(() {
                          commonForDigit('7');
                          result = evalEx(expression);
                        });
                      },
                    ),
                    NeuButton(
                      text: '8',
                      isDigit: true,
                      onTap: () {
                        setState(() {
                          commonForDigit('8');
                        });
                      },
                    ),
                    NeuButton(
                      text: '9',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('9');
                      }),
                    ),
                    NeuButton(
                      text: '×',
                      onTap: () => setState(() {
                        if (equal) {
                          expression = '$result×';
                          equal = false;
                        } else {
                          expression += '×';
                        }
                      }),
                    )
                  ],
                ),
                // 4, 5, 6, -
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeuButton(
                      text: '4',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('4');
                      }),
                    ),
                    NeuButton(
                      text: '5',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('5');
                      }),
                    ),
                    NeuButton(
                      text: '6',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('6');
                      }),
                    ),
                    NeuButton(
                      text: '-',
                      onTap: () => setState(() {
                        if (equal) {
                          expression = '$result-';
                          equal = false;
                        } else {
                          expression += '-';
                        }
                      }),
                    )
                  ],
                ),
                // 1, 2, 3, +
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeuButton(
                      text: '1',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('1');
                      }),
                    ),
                    NeuButton(
                      text: '2',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('2');
                      }),
                    ),
                    NeuButton(
                      text: '3',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('3');
                      }),
                    ),
                    NeuButton(
                      text: '+',
                      onTap: () => setState(() {
                        if (equal) {
                          expression = '$result+';
                          equal = false;
                        } else {
                          expression += '+';
                        }
                      }),
                    )
                  ],
                ),
                // 0, ., =
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeuButton(
                      text: '0',
                      isDigit: true,
                      onTap: () => setState(() {
                        commonForDigit('0');
                      }),
                    ),
                    NeuButton(
                      text: '.',
                      isDigit: true,
                      onTap: () => setState(() {
                        if (expression.isNotEmpty &&
                            isLastCharacterNumeric(expression)) {
                          expression += '.';
                        }
                      }),
                    ),
                    NeuButton(
                      text: '=',
                      width: 160,
                      onTap: () => setState(() {
                        if (expression.isNotEmpty) {
                          if (brac > 0) {
                            expression += ')' * brac;
                            brac = 0;
                          }
                          result = evalEx(expression);
                          equal = true;
                        }
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
