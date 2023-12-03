import 'package:get/get.dart';

import '../controllers/upgradetopro_controller.dart';

class UpgradetoproBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradetoproController>(
      () => UpgradetoproController(),
    );
  }
}
