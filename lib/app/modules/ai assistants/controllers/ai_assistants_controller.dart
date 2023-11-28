import 'package:get/get.dart';

import '../model/ai_assistants_model.dart'; // Importe o modelo

class AiAssistantsController extends GetxController {
  RxList<AiAssistant> allAssistants = AiAssistantData.assistants.obs;

  RxList<AiAssistant> filteredAssistants = <AiAssistant>[].obs;

  RxString selectedCategory = 'All'.obs;

  void updateFilteredAssistants() {
    if (selectedCategory.value == 'All') {
      filteredAssistants.assignAll(allAssistants);
    } else {
      filteredAssistants.assignAll(allAssistants
          .where((assistant) => assistant.category == selectedCategory.value)
          .toList());
    }
  }

  @override
  void onInit() {
    super.onInit();

    selectedCategory.listen((_) {
      updateFilteredAssistants();
    });

    updateFilteredAssistants();
  }

  List<String> getCategories() {
    return ['All', 'Writing', 'Creative', 'Social Media', 'Business'];
  }
}
