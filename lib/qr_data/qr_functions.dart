import 'dart:typed_data';
import 'package:barcode_generator/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter_new/qr_flutter.dart';
import 'dart:ui' as ui;
class QrFunctions {
  // Method to create a QR code image widget
  static Widget createQr({required String data}) {
    print(data);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors().orange),
      ),
      child: QrImageView(
        data: data,
        size: 180,
        backgroundColor: AppColors().white,
      ),
    );
  }

  static Future<void> saveImage(GlobalKey key) async {

    try{
       RenderRepaintBoundary boundary= key.currentContext!.findRenderObject() as RenderRepaintBoundary;
       ui.Image image=await boundary.toImage(pixelRatio: 5.0);

       ByteData? byteData= await image.toByteData(format: ui.ImageByteFormat.png);

       if(byteData==null){
        print("bute data is null");
        return;
       }
        final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List(),quality: 100);

        if(result["isSuccess"]==true){
          print("Image save successfully");

        }
        else {
          print("Did not save image");
        }
    } catch(e){
      print("Some Error ocurred $e");


    }
  }
}
