import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/theme.dart';
import 'package:barcode_generator/screens/link_qr.dart';
import 'package:barcode_generator/screens/phone_qr.dart';
import 'package:barcode_generator/screens/text_qr.dart';
import 'package:barcode_generator/screens/wifi_qr.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Icon> girdIcons = [
      Icon(
        Icons.phone,
        color: AppColors().white,
      ),
      Icon(
        Icons.text_rotation_angleup_sharp,
        color: AppColors().white,
      ),
      Icon(
        Icons.wifi,
        color: AppColors().white,
      ),
      Icon(
        Icons.link,
        color: AppColors().white,
      ),
    ];

    List<Widget> screens = [
      const PhoneQr(),
      const TextQr(),
      const WifiQr(),
      const LinkQr()
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Home Screen",
          style: appbartheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: AppColors().primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                "Please Select The Prefred Qr Catagory",
                style: subHeadingTheme,
              ),
              const SizedBox(
                height: 40,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: girdIcons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors().orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => screens[index],
                          ),
                        );
                      },
                      icon: girdIcons[index],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
