import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughtbox/view/screen/bottomnav.dart';
import 'package:thoughtbox/view/screen/home_screen.dart';
import 'package:thoughtbox/view/screen/login_screen.dart';
import 'package:thoughtbox/view/screen/pininput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'OTP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Enter OTP Sent to your Mobile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Number 134567890',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PinputScreen(),
              SizedBox(
                height: 10,
              ),
              // LoginButtonwidget(text: 'Submit', onPressed: () {}
              //     // Get.offAll(
              //     //   () => BottomNavigationBArScreeen(),
              //     // ),
              //     ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Resent OTP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
