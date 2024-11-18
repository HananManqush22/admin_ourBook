import 'package:admin_ourbook/combonent/combonent.dart';
import 'package:admin_ourbook/configration/colors.dart';
import 'package:admin_ourbook/controller/bookController.dart';
import 'package:admin_ourbook/screen/sectionBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class AddBookScreen extends StatelessWidget {
  final String sectionId;
  final String sectionBook;
  const AddBookScreen(
      {super.key, required this.sectionId, required this.sectionBook});

  @override
  Widget build(BuildContext context) {
    isUplodingData bookController = Get.find();

    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController pageNo = TextEditingController();

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topEnd,
                colors: [primaryColor, backgroundColor])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child:
                appBarBook(context, text: '${sectionBook}'), //'${sectionBook}'
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          bookController.getImage();
                        },
                        child: Obx(
                          () => Container(
                            width: 130.w,
                            height: 140.h,
                            decoration: const BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: bookController.islodingImage.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ))
                                : bookController.imageUrl.value == ""
                                    ? const Icon(Icons.add)
                                    : ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25)),
                                        child: Image.network(
                                          bookController.imageUrl.value,
                                          fit: BoxFit.cover,
                                        )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                          onTap: () {
                            bookController.pickPdf();
                          },
                          child: Obx(
                            () => coustomButton(
                                context: context,
                                text: 'Book Pdf',
                                icon: Icons.upload_sharp,
                                isloding: bookController.islodingPdf.value),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      CoustomTextFile(
                        controller: title,
                        text: 'Book Title',
                        context: context,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CoustomTextFile(
                        controller: description,
                        text: 'Book Discription',
                        context: context,
                        maxlin: 7,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CoustomTextFile(
                        controller: pageNo,
                        text: 'Page Number',
                        context: context,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () async {
                            if (bookController.pdfUrl.value != null) {
                              bookController.createBook(
                                sectionId: sectionId,
                                title: title.text,
                                description: description.text,
                                pageNo: pageNo.text,
                                titleSmal: title.text.toLowerCase(),
                              );
                              title.clear();
                              description.clear();
                              pageNo.clear();
                              Get.back();
                            } else {
                              print('uplod book pdf');
                            }
                          },
                          child: coustomButton(
                              context: context,
                              text: 'Add Book',
                              icon: Icons.add,
                              isloding: bookController.isPostUploding.value),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
