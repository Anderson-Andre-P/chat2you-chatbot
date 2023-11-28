// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:get/get.dart';

class HomeController extends GetxController {
  // Map<String, dynamic>? data;
  // RxMap<String, dynamic> data = <String, dynamic>{}.obs;

  // ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // Future<void> getData() async {
  //   apiCallStatus = ApiCallStatus.loading;
  //   update();
  //   await BaseClient.safeApiCall(
  //     Constants.getMessages,
  //     RequestType.get,
  //     onSuccess: (response) {
  //       // data = response.data;
  //       data.value = response.data;
  //       apiCallStatus = ApiCallStatus.success;
  //       update();
  //     },
  //     onError: (error) {
  //       BaseClient.handleApiError(error);
  //       apiCallStatus = ApiCallStatus.error;
  //       update();
  //     },
  //   );
  // }

  // void addMessage(String message) {
  //   data['messages'].add(message);
  //   update();
  // }

  // @override
  // void onInit() {
  //   ever(data, (_) {
  //     update();
  //   });
  //   getData();
  //   super.onInit();
  // }
}
