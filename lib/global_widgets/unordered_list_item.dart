import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/resources/app_colors.dart';
import '../core/resources/app_styles.dart';

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text('\u2022 '),
            // "• "
          ),
        Expanded(
          child: Text(title, style: getRegularStyle(
              color: AppColors.black, fontSize: 14.sp, fontFamily: 'Inter'),),
        ),
      ],
    );
  }
}
