import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularRequestItem extends StatelessWidget {
  final bool isHuman;
  final String title;
  final GlobalKey key;

  PopularRequestItem({@required this.title, @required this.isHuman, this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: isHuman ? AppColors.PRIMARY_COLOR : Color(0xff009688),
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          title,
          style: Themes.getTextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
