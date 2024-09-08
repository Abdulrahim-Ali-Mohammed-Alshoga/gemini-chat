import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_chat_app/data/base_controllers/base_controller.dart';
import 'package:gemini_chat_app/data/models/user_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomeController extends BaseController {
  /// general variables
  final TextEditingController textEditingController = TextEditingController();
  final List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isStart = true;
  bool isListening = false;
  GenerativeModel? _model;
  String recognizedText = '';

  // late SpeechToText speech;
  late String geminiKey;

  @override
  void onInit() {
    // TODO: implement onInit

    //pageController.addListener(_handlePageChange);
    geminiKey = const String.fromEnvironment('GOOGLE_API_KEY');
    // initSpeechToText();
    textEditingController.addListener(_onTextChanged);
    super.onInit();
  }

  // Future<void> initSpeechToText() async {
  //   speech = SpeechToText();
  //   bool available=await speech.initialize();
  //   if(available){
  //     isListening=false;
  //     update();
  //   }
  // }
  Future<void> setModel() async {
    _model = GenerativeModel(
        model: 'gemini-1.0-pro',
        apiKey: geminiKey,
        generationConfig: GenerationConfig(
          temperature: 0.4,
          topK: 32,
          topP: 1,
          maxOutputTokens: 4096,
        ),
        safetySettings: [
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
        ]);
    _scrollToBottom();
    update();
  }

  void _onTextChanged() {
    final isTextEmpty = textEditingController.text.isEmpty;

    if (isStart != isTextEmpty) {
      isStart = isTextEmpty;
      update();
    }
  }

  // startListening() {
  //
  //   speech.listen(
  //
  //     onResult: (result) {
  //      recognizedText = result.recognizedWords;
  //       update();
  //     },
  //   );
  //   textEditingController.text=recognizedText;
  //   isListening = true; print(recognizedText);
  //   update();
  // }
  //
  // stopListening() {
  //   speech.stop();
  //   isListening = false;
  //   update();
  // }

  // _scrollDown() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) {
  //       scrollController.animateTo(scrollController.position.maxScrollExtent,
  //           duration: const Duration(milliseconds: 750),
  //           curve: Curves.easeOutCirc);
  //     },
  //   );
  // }
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(scrollController.position.maxScrollExtent);
      print('object');
      print(scrollController.position.pixels);
      // scrollController.hasClients &&
      //     scrollController.position.maxScrollExtent > 0.0
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent-150.h) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  callGeminiModel() async {
    try {
      if (textEditingController.text.isNotEmpty) {
        messages.add(MessageModel(
            text: StringBuffer(textEditingController.text), isUser: true));
      }
      isLoading = true;
      await setModel();
      final prompt = textEditingController.text.trim();
      final content = Content.text(prompt);

      textEditingController.clear();
      messages.add(MessageModel(text: StringBuffer(), isUser: false));
      update();
      final chatSession = _model!.startChat(history: []);
      chatSession.sendMessageStream(content).asyncMap((event) {
        return event;
      }).listen((event) {
        messages.last.text!.write(event.text);
        _scrollToBottom();
        log('event: ${event.text}');
        update();
      }, onDone: () async {
        log('stream done');
        isLoading = false;
        update();
        // save message to hive db
        // await saveMessagesToDB(
        //   chatID: chatId,
        //   userMessage: userMessage,
        //   assistantMessage: assistantMessage,
        //   messagesBox: messagesBox,
        // );
        // // set loading to false
        // setLoading(value: false);
      }).onError((erro, stackTrace) {
        log('error: $erro');
        // set loading
        // setLoading(value: false);
      });
      //final response = await _model!.generateContent(content);

      // messages.add(MessageModel(text: response.text!, isUser: false));
    } catch (e) {
     // print("Error : $e");
    }
  }
}
