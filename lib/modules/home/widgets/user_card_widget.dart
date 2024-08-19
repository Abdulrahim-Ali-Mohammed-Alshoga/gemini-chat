import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key, required this.message});
final String message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment:   Alignment.centerRight  ,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:
              Theme.of(context).colorScheme.primary  ,
              borderRadius:
              BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              )
          ),
          child: Text(
              message,
              style:   Theme.of(context).textTheme.bodyMedium
          )
      ),
    );
  }
}
