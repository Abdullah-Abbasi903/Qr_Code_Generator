import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/theme.dart';
import 'package:flutter/material.dart';

class TextQr extends StatefulWidget {
  const TextQr({super.key});

  @override
  State<TextQr> createState() => _TextQrState();
}

class _TextQrState extends State<TextQr> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Text Qr Screen",
          style: appbartheme,
        ),
      ),
    );
  }
}