// chat_details_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/history_model.dart';

class ChatDetailsView extends StatelessWidget {
  final ChatModel chat;

  const ChatDetailsView({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chat.messages.length,
              itemBuilder: (context, index) {
                final sender = chat.messages[index].keys.first;
                final text = chat.messages[index].values.first;
                return MessageBubble(
                  sender: sender,
                  text: text,
                );
              },
            ),
          ),
          const ChatInput(), // Adicione um widget para a entrada de mensagens
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  const MessageBubble({super.key, required this.sender, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Align(
      alignment: sender == "you" ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 16.0.h,
          left: 24.0.w,
          right: 24.0.w,
        ),
        padding: EdgeInsets.all(8.w),
        width: 320.w,
        decoration: BoxDecoration(
          color: sender == "you" ? theme.primaryColor : theme.cardColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            color: sender == "you"
                ? const Color(0xFFFFFFFF)
                : Theme.of(context).brightness == Brightness.light
                    ? const Color(0xFF6C6C6C)
                    : const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // Adicione aqui o código para a entrada de mensagens (se necessário)
    return Container(
      margin: EdgeInsets.all(24.0.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Digite sua mensagem...',
                labelText: 'Digite sua mensagem...',
                isDense: true,
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(50.r)),
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              color: Colors.white,
              onPressed: () {
                // Adicione aqui a lógica para enviar mensagens
              },
            ),
          ),
        ],
      ),
    );
  }
}
