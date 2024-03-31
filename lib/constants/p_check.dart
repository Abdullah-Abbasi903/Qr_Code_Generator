import 'package:barcode_generator/constants/theme.dart';
import 'package:flutter/material.dart';

class PCheck extends StatelessWidget {
  const PCheck(
      {required this.checkValue,
      required this.isCheck,
      required this.title,
      super.key});

  final RegExp isCheck;
  final String title;
  final String checkValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        AnimatedContainer(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isCheck.hasMatch(checkValue) ? Colors.transparent : Colors.green
            ),
            color: isCheck.hasMatch(checkValue)? Colors.green : Colors.transparent,
          ),
          duration: const Duration(milliseconds: 500),
          child: Icon(
            Icons.check,
            size: 15,
            color: isCheck.hasMatch(checkValue)
                ? Colors.white
                : Colors.grey.shade500,
          ),
        ),
         const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: hintTexttheme,
        ),
      ],
    );
  }
}
