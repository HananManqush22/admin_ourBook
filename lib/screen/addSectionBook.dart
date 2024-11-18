import 'package:admin_ourbook/combonent/combonent.dart';
import 'package:admin_ourbook/configration/colors.dart';
import 'package:admin_ourbook/controller/bookController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AddSectionScree extends StatelessWidget {
  const AddSectionScree({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController sectionName = TextEditingController();
    isUplodingData bookController = Get.find();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topEnd,
              colors: [primaryColor, backgroundColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: appBarBook(context, text: 'Add Section'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CoustomTextFile(
                context: context,
                text: 'Add Section',
                controller: sectionName,
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  bookController.creatSection(sectionName.text);
                  Get.back();
                },
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                      child: Obx(
                    () => bookController.isSectionUploding.value
                        ? const CircularProgressIndicator(
                            color: backgroundColor,
                          )
                        : Text(
                            'Add',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: backgroundColor),
                          ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
