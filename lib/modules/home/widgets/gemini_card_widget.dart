import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_chat_app/core/resources/app_colors.dart';
import 'package:gemini_chat_app/core/resources/app_images.dart';
import 'package:markdown/markdown.dart' as md;

class GeminiCardWidget extends StatelessWidget {
  const GeminiCardWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.start,
            height: 27.h,
            width: 27.h,
            fit: BoxFit.fill,
            color: AppColors.black,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: MarkdownBody(
                data: message,
                selectable: true,

                builders: {
                  'pre': CustomPreBuilder(),
                },
                styleSheet: MarkdownStyleSheet(
    codeblockDecoration:BoxDecoration(color: AppColors.black,borderRadius: BorderRadius.circular(4.r),) ,
code: TextStyle(
  backgroundColor: AppColors.black,color: AppColors.white
),

              ),
            ), ),
          ),
        ],
      ),
    );
  }
}
class CustomCodeBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(text, TextStyle? preferredStyle) {
    return HighlightView(
      text.text,
      language: 'dart', // تحديد لغة البرمجة
      theme: githubTheme, // الثيم المستخدم لتلوين الكود
      padding: EdgeInsets.all(80),
      textStyle: TextStyle(

        fontSize: 16,
      ),
    );
  }
}



class CustomPreBuilder extends MarkdownElementBuilder {
  @override
  Widget?
  visitElementAfter(md.Element element, TextStyle? preferredStyle){
    final code =  element.textContent;

    return  Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              code,
              style: TextStyle(

                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: Icon(Icons.copy, color: Colors.white),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Code copied to clipboard')),
                // );
              },
            ),
          ),
        ],
      ),
    );

  }}