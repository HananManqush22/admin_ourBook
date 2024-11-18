import 'package:admin_ourbook/configration/colors.dart';
import 'package:admin_ourbook/controller/bookController.dart';
import 'package:admin_ourbook/screen/addBook.dart';
import 'package:admin_ourbook/screen/addSectionBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    isUplodingData controller = Get.find();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Center(
          child: Text(
            'Section Book',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: primaryColor),
          ),
        ),
      ),
      body: Obx(
        () => controller.isStartLoding.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(20.h),
                child: controller.isStartLoding.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: primaryColor,
                      ))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 100,
                        ),
                        itemCount: controller.data.length,
                        itemBuilder: (context, Index) => InkWell(
                              onTap: () {
                                Get.to(AddBookScreen(
                                  sectionId: '${controller.data[Index].id}',
                                  sectionBook:
                                      '${controller.data[Index]['name']}',
                                ));
                              },
                              child: Card(
                                  child: Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.data[Index]['name']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: primaryColor),
                                  ),
                                ),
                              )),
                            )),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddSectionScree());
        },
        child: Icon(
          Icons.add,
          color: backgroundColor,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
