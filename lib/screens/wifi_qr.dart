import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/theme.dart';
import 'package:barcode_generator/qr_data/qr_functions.dart';
import 'package:flutter/material.dart';

class WifiQr extends StatefulWidget {
  const WifiQr({super.key});

  @override
  State<WifiQr> createState() => _PhoneQrState();
}

class _PhoneQrState extends State<WifiQr> {
  TextEditingController ssidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isGenerating = false;
  bool qrGenerated = false;

  String securityType = "WPA";
  void clearController() {
    passwordController.clear();
    ssidController.clear();
  }

  Widget qrImage = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Wifi Qr Screen",
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: ssidController,
                style: inputTheme,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.wifi,
                    color: AppColors().white,
                  ),
                  labelText: "ssid",
                  hintText: "Enter SSID",
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
              Text(
                "Select Security Type",
                style: appbartheme,
              ),
              Row(
                children: [
                  Radio(
                    activeColor: AppColors().orange,
                    value: "WPA/WPA2",
                    groupValue: securityType,
                    onChanged: (value) {
                      setState(() {
                        securityType = value!;
                      });
                    },
                  ),
                  Text("WPA/WPA2", style: radioButtonTheme),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(
                    activeColor: AppColors().orange,
                    value: "WEP",
                    groupValue: securityType,
                    onChanged: (value) {
                      setState(() {
                        securityType = value!;
                      });
                    },
                  ),
                  Text("WEP", style: radioButtonTheme),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(
                    activeColor: AppColors().orange,
                    value: "Nopass",
                    groupValue: securityType,
                    onChanged: (value) {
                      setState(() {
                        securityType = value!;
                      });
                    },
                  ),
                  Text("No Pass", style: radioButtonTheme),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              securityType == "Nopass"
                  ? Container()
                  : TextFormField(
                      controller: passwordController,
                      style: inputTheme,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors().white,
                        ),
                        labelText: "password",
                        hintText: "Enter Password",
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
                          borderSide:
                              BorderSide(color: AppColors().orange, width: 4),
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

                          if (securityType == "Nopass") {
                            String wifiScheme =
                                "WIFI:T:$securityType;S:${ssidController.text};;";
                            qrImage = QrFunctions.createQr(data: wifiScheme);
                          } else {
                            String wifiScheme =
                                "WIFI:T:$securityType;S:${ssidController.text};P${passwordController.text};;";
                            qrImage = QrFunctions.createQr(data: wifiScheme);
                          }

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
              qrGenerated ? Center(child: qrImage) : Container(),
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
                      child: Center(
                        child: Text(
                          "Clear qr",
                          style: texttheme.copyWith(color: AppColors().orange),
                        ),
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
                          onPressed: () {},
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
