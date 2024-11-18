import 'package:admin_ourbook/configration/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget coustomButton(
        {required context,
        required String text,
        required IconData icon,
        Color color = primaryColor,
        bool isloding = false}) =>
    Container(
      width: double.infinity,
      height: 50.h,
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: backgroundColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          isloding
              ? const CircularProgressIndicator(
                  color: backgroundColor,
                )
              : Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: backgroundColor),
                ),
        ],
      ),
    );

Widget CoustomTextFile(
        {required context,
        required String text,
        final int maxlin = 1,
        required TextEditingController controller}) =>
    TextFormField(
      maxLines: maxlin,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: backgroundColor,
          ),
        ),
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
        filled: true,
        hintText: text,
        hintStyle:
            Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
      ),
    );

Widget icon_Boutton({
  required Function onpressed,
  required IconData icon,
  required Color iconColor,
  final int sized = 20,
}) =>
    InkWell(
      onTap: () {
        onpressed.call();
      },
      child: Icon(
        icon,
        color: iconColor,
        size: sized.w,
      ),
    );

Widget appBarBook(BuildContext context, {required String text}) => Padding(
      padding:
          EdgeInsets.only(top: 35.h, left: 20.w, right: 20.w, bottom: 15.h),
      child: Row(
        children: [
          icon_Boutton(
              onpressed: () {
                Get.back();
              },
              icon: Icons.arrow_back,
              sized: 30,
              iconColor: backgroundColor),
          Spacer(),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: backgroundColor),
          ),
          Spacer(),
        ],
      ),
    );
