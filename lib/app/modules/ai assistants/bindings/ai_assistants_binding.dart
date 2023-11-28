import 'package:get/get.dart';

import '../controllers/ai_assistants_controller.dart';

class AiAssistantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiAssistantsController>(
      () => AiAssistantsController(),
    );
  }
}
