import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_chat_app/core/resources/app_colors.dart';
import 'package:gemini_chat_app/core/resources/app_styles.dart';
import 'package:gemini_chat_app/global_widgets/form_widgets/input_text_field_widget.dart';
import 'package:gemini_chat_app/modules/home/widgets/gemini_card_widget.dart';
import 'package:gemini_chat_app/modules/home/widgets/user_card_widget.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/HomeView';

  // final GlobalKey<CarouselSliderState> _formKey =
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index){
                      final message = controller.messages[index];
                      return ListTile(
                        title:message.isUser!?UserCardWidget(message: message.text!):GeminiCardWidget(message: message.text!)
                      );
                    }
                ),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: InputTextFieldWidget(
                keyName: 'Message',
                cursorColor: AppColors.black,
                autoFocus: true,
                hintText: 'Message',
                suffixIcon: Icon(Icons.send),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                hintStyle:
                    getLightStyle(color: AppColors.black, fontSize: 13.sp),
                fillColor: AppColors.grey,
                isFill: true,
                circular: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
