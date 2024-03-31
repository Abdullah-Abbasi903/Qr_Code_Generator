import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/theme.dart';
import 'package:barcode_generator/qr_data/qr_functions.dart';
import 'package:flutter/material.dart';

class PhoneQr extends StatefulWidget {
  const PhoneQr({super.key});

  @override
  State<PhoneQr> createState() => _PhoneQrState();
}

class _PhoneQrState extends State<PhoneQr> {
  TextEditingController noController = TextEditingController();
  bool isGenerating = false;
  bool qrGenerated = false;
  GlobalKey imageKey = GlobalKey();
  void clearController() {
    noController.clear();
  }

  Widget qrImage = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Phone Qr Screen",
          style: appbartheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          color: AppColors().primaryColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: noController,
                style: inputTheme,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors().white,
                  ),
                  labelText: "Phone No",
                  hintText: "Enter No",
                  hintStyle: hintTexttheme,
                  labelStyle: labletheme,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: AppColors().grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors().orange, width: 4),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isGenerating
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors().orange,
                            foregroundColor: AppColors().white),
                        onPressed: () {
                          setState(() {
                            isGenerating = true;
                          });
                          qrImage = QrFunctions.createQr(
                              data: "tel:${noController.text}");
                          clearController();
                          setState(() {
                            isGenerating = false;
                            qrGenerated = true;
                          });
                        },
                        child: const Text("Generate"),
                      ),
                    ),
              const SizedBox(
                height: 40,
              ),
              qrGenerated
                  ? RepaintBoundary(
                      key: imageKey,
                      child: qrImage,
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              qrGenerated
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          qrGenerated = false;
                        });
                      },
                      child: Text(
                        "Clear qr",
                        style: texttheme.copyWith(color: AppColors().orange),
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 40,
              ),
              qrGenerated
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors().orange,
                              foregroundColor: AppColors().white),
                          onPressed: () {
                            QrFunctions.saveImage(imageKey);
                             ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors().green,
                                duration: const Duration(seconds: 2),
                                content:
                                    const Text("Image Successfully"),
                              ),
                            );
                          },
                          child: const Icon(Icons.save_alt),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors().orange,
                              foregroundColor: AppColors().white),
                          onPressed: () {},
                          child: const Icon(Icons.share),
                        ),
                      ],
                    )
                  : Container(),
            ]),
          ),
        ),
      ),
    );
  }
}
