import 'package:flutter/material.dart';
import 'package:gemini_chat_app/data/base_controllers/base_controller.dart';
import 'package:gemini_chat_app/data/models/user_model.dart';




class HomeController extends BaseController{
  /// general variables
  final TextEditingController  controller = TextEditingController();
  final List<MessageModel>  messages = [];
  bool  isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit

    //pageController.addListener(_handlePageChange);
    super.onInit();
  }


}
