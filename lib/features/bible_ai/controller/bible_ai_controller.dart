import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message {
  final String text;
  final bool isUser;
  final String? type; // 'text' or 'verse'
  final String? reference;
  final String time;

  Message({
    required this.text,
    required this.isUser,
    this.type = 'text',
    this.reference,
    required this.time,
  });
}

class BibleAiController extends GetxController {
  var messages = <Message>[].obs;
  var isTextEmpty = true.obs;
  var selectedModel = 'Bible v4'.obs;
  final TextEditingController textController = TextEditingController();

  final List<String> suggestionTexts = [
    'What does God want me to know today?',
    'Can you help me understand a Bible verse?',
    'I’m feeling overwhelmed — what can I pray?',
    'Give me guidance for a decision I’m facing',
  ];

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      isTextEmpty.value = textController.text.trim().isEmpty;
    });
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    
    messages.add(Message(
      text: text,
      isUser: true,
      time: '11:45',
    ));
    textController.clear();

    // Simulate AI Response
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(Message(
        text: 'Lorem ipsum venenatis facilisi id eu faucibus nulla viverra phasellus.',
        isUser: false,
        type: 'verse',
        reference: 'PSALM 197:23',
        time: '11:46',
      ));
      
      messages.add(Message(
        text: 'Do you like it?',
        isUser: false,
        time: '11:46',
      ));
    });
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
