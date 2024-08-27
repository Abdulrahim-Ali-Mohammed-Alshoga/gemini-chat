import 'package:flutter/material.dart';
import 'package:gemini_chat_app/data/base_controllers/base_controller.dart';
import 'package:gemini_chat_app/data/models/user_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends BaseController {
  /// general variables
  final TextEditingController textEditingController = TextEditingController();
  final List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isStart = true;
  bool isListening = false;
  String recognizedText = '';
  late SpeechToText speech;
  late String geminiKey;

  @override
  void onInit() {
    // TODO: implement onInit

    //pageController.addListener(_handlePageChange);
    geminiKey = const String.fromEnvironment('GOOGLE_API_KEY');
    initSpeechToText();
    textEditingController.addListener(_onTextChanged);
    super.onInit();

  }

  Future<void> initSpeechToText() async {
    speech = SpeechToText();
    bool available=await speech.initialize();
    if(available){
      isListening=false;
      update();
    }
  }

  void _onTextChanged() {
    final isTextEmpty = textEditingController.text.isEmpty;

    if (isStart != isTextEmpty) {
      isStart = isTextEmpty;
      update();
    }
  }

  startListening() {
    speech.listen(
      onResult: (result) {
        textEditingController.text = result.recognizedWords;
        isListening = true;
        update();
      },
    );
  }

  stopListening() {
    speech.stop();
    isListening = false;
    update();
  }

  _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeOutCirc);
      },
    );
  }

  callGeminiModel() async {
    try {
      if (textEditingController.text.isNotEmpty) {
        messages
            .add(MessageModel(text: textEditingController.text, isUser: true));
      }

      final model = GenerativeModel(model: 'gemini-pro', apiKey: geminiKey);
      final prompt = textEditingController.text.trim();
      final content = [Content.text(prompt)];
      isLoading = true;
      textEditingController.clear();
      update();
      final response = await model.generateContent(content);
      _scrollDown();
      messages.add(MessageModel(text: response.text!, isUser: false));
      isLoading = false;
      update();
    } catch (e) {
      print("Error : $e");
    }
  }
}
