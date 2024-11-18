import 'package:admin_ourbook/controller/bookController.dart';
import 'package:admin_ourbook/controller/splaceConroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceCotnroller _splaceCotnroller = Get.put(SplaceCotnroller());
    isUplodingData controller = Get.put(isUplodingData());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: Image.asset('assets/images/Ourbook.png')),
              ),
              Container(
                  height: 40.h, child: Image.asset('assets/images/manqush.png'))
            ],
          ),
        ),
      ),
    );
  }
}
