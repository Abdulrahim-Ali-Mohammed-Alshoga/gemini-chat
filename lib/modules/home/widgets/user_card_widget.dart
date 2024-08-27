import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key, required this.message});
final String message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment:   Alignment.centerRight  ,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 10.h),
          decoration: BoxDecoration(
              color:
              Theme.of(context).colorScheme.primary  ,
              borderRadius:
                  BorderRadius.circular(20.r)
              // BorderRadius.only(
              //     topLeft: Radius.circular(20.r),
              //     bottomRight: Radius.circular(20.r),
              //     bottomLeft: Radius.circular(20.r)
              // )
          ),
          child: SelectableText(
              message,
              style:   Theme.of(context).textTheme.bodyMedium
          )
      ),
    );
  }
}
