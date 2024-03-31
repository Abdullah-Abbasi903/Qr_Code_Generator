import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/theme.dart';

import 'package:flutter/material.dart';

class LinkQr extends StatefulWidget {
  const LinkQr({super.key});

  @override
  State<LinkQr> createState() => _LinkQrState();
}

class _LinkQrState extends State<LinkQr> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Link Qr Screen",
          style: appbartheme,
        ),
      ),
    );
  }
}