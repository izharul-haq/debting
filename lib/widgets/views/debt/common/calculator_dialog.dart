import 'package:debting/widgets/common/buttons/transparent_button.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:sizer/sizer.dart';

class CalculatorDialog extends StatefulWidget {
  const CalculatorDialog({Key? key}) : super(key: key);

  @override
  State<CalculatorDialog> createState() => _CalculatorDialogState();
}

class _CalculatorDialogState extends State<CalculatorDialog> {
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
  final Parser _parser = Parser();

  String expression = '0';
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 60.w,
        height: 44.5.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _expressionView(),
            Spacing(),
            _calculatorPad(),
          ],
        ),
      ),
      actions: [
        TransparentButton(
          onPressed: () => Get.back(result: result),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _onConfirm();
            Get.back(result: result);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }

  Widget _expressionView() {
    return Container(
      height: 8.h,
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Rp',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.h),
          ),
          SizedBox(width: 1.5.w),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                expression,
                style: TextStyle(fontSize: 3.h, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _calculatorPad() {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: _buttons
          .map(
            (button) => IconButton(
              onPressed: () => _onTap(button),
              icon: Text(
                button,
                style: TextStyle(fontSize: 3.h, fontWeight: FontWeight.w500),
              ),
            ),
          )
          .toList(),
    );
  }

  void _onTap(String text) {
    String res = expression;

    if (text == '⌫') {
      res = res.substring(0, expression.length - 1);
      if (res == '') res = '0';
    } else if (_operators.keys.contains(text)) {
      if (res != '0') res += text;
    } else {
      if (res == '0' && text != '000') {
        res = text;
      } else {
        res += text;
      }
    }

    setState(() => expression = res);
  }

  void _onConfirm() {
    Expression exp = _parser.parse(
      _operators.entries.fold(
        expression,
        (prev, e) => prev.replaceAll(e.key, e.value),
      ),
    );

    double res = double.parse(
      exp.evaluate(EvaluationType.REAL, ContextModel()).toString(),
    );

    setState(() => result = res.toInt());
  }
}
