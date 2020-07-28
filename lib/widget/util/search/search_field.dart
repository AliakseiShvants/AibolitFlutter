import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  SearchField({Key key, this.hintText, this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: AppColors.grey500,
        ),
        child: TextField(
          cursorColor: AppColors.green,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey500,
              size: 28,
            ),
            isDense: true,
            focusedBorder: AppWidgets.textFieldBorder,
            enabledBorder: AppWidgets.textFieldBorder,
            hintText: hintText,
          ),
          keyboardType: TextInputType.text,
          onTap: null,
        ),
      ),
    );
  }
}
