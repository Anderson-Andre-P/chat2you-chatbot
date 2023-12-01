import 'package:get/get.dart';

import '../controllers/typeoflogin_controller.dart';

class TypeofloginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TypeofloginController>(
      () => TypeofloginController(),
    );
  }
}
