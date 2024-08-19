import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../core/utils/shared_style.dart';

class RangDateWidget extends StatefulWidget {
  final String name;
  final GlobalKey<FormBuilderState> formKey;
  final String title;
  final String? hintText;

  const RangDateWidget(
      {Key? key,
      required this.name,
      required this.formKey,
      this.hintText,
      required this.title})
      : super(key: key);

  @override
  _RangDateWidgetState createState() => _RangDateWidgetState();
}

class _RangDateWidgetState extends State<RangDateWidget> {
  DateTimeRange? dateTimeRange;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateRangePicker(
      name: widget.name,
      initialValue: dateTimeRange,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
      format: DateFormat('yyyy-MM-dd'),
      onChanged: (value) {
        setState(() {
          dateTimeRange = value;
        });
      },
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: widget.hintText,
        border: SharedStyle.inputBorder,
        focusedBorder: SharedStyle.focusedBorder,
        errorBorder: SharedStyle.errorBorder,
        suffixIcon: dateTimeRange != null
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  widget.formKey.currentState!.fields[widget.name]
                      ?.didChange(null);
                  setState(() {
                    dateTimeRange = null;
                  });
                })
            : const Icon(Icons.calendar_today_outlined),
      ),
    );
  }
}
