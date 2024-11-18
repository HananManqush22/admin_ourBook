import 'package:admin_ourbook/screen/sectionBook.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplaceCotnroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceCotnroller();
  }

  void splaceCotnroller() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const SectionScreen());
    });
  }
}
