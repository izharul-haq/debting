import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var expression = '0';
  var result = 0;

  final Parser _parser = Parser();
  final Map<String, String> _operators = {
    '÷': '/',
    '×': '*',
    '-': '-',
    '+': '+',
  };
  final List<String> _buttons = [
    '7',
    '8',
    '9',
    '÷',
    '4',
    '5',
    '6',
    '×',
    '1',
    '2',
    '3',
    '-',
    '0',
    '000',
    '⌫',
    '+',
  ];

  Map<String, String> get operators => _operators;
  List<String> get buttons => _buttons;

  void setInitial(int amount) {
    if (expression == '0' && result == 0) {
      expression = amount.toString();
      result = amount;
    }

    update();
  }

  void updateExpression(String text) {
    if (text == '⌫') {
      expression = expression.substring(0, expression.length - 1);
      if (expression == '') expression = '0';
    } else if (_operators.keys.contains(text)) {
      if (_operators.keys.contains(expression[expression.length - 1])) {
        expression = expression.substring(0, expression.length - 1) + text;
      } else if (expression != '0') {
        expression += text;
      }
    } else {
      if (expression == '0' && text != '000') {
        expression = text;
      } else {
        expression += text;
      }
    }

    update();
  }

  void parse() {
    Expression exp = _parser.parse(
      _operators.entries.fold(
        expression,
        (prev, e) => prev.replaceAll(e.key, e.value),
      ),
    );

    double res = double.parse(
      exp.evaluate(EvaluationType.REAL, ContextModel()).toString(),
    );

    result = res.toInt();

    update();
  }
}
