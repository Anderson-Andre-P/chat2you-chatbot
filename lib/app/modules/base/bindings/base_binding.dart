import 'package:chat2you/app/modules/ai%20assistants/controllers/ai_assistants_controller.dart';
import 'package:chat2you/app/modules/history/controllers/history_controller.dart';
import 'package:chat2you/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AiAssistantsController>(() => AiAssistantsController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
