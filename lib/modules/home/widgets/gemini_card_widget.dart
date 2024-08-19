import 'package:flutter/material.dart';

class GeminiCardWidget extends StatelessWidget {
  const GeminiCardWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:
              Theme.of(context).colorScheme.secondary,
              borderRadius:
              const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )
          ),
          child: Text(
              message,
              style:
              Theme.of(context).textTheme.bodySmall
          )
      ),
    ) ;
  }
}
