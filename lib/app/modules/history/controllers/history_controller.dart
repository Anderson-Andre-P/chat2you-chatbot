import 'package:get/get.dart';

import '../model/history_model.dart';

class HistoryController extends GetxController {
  final List<ChatModel> _chats = dummyChatData;
  late List<ChatModel> _filteredChats;

  List<ChatModel> get filteredChats => _filteredChats;

  @override
  void onInit() {
    _filteredChats =
        _chats; // Inicialmente, a lista filtrada é a lista completa
    super.onInit();
  }

  void filterChats(String query) {
    if (query.isEmpty) {
      _filteredChats =
          _chats; // Se a consulta estiver vazia, mostrar todos os bate-papos
    } else {
      // Filtrar bate-papos com base na consulta
      _filteredChats = _chats
          .where(
              (chat) => chat.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    // Adiar a chamada do update para ocorrer fora do ciclo de construção
    Future.delayed(Duration.zero, () {
      update();
    });
  }
}
