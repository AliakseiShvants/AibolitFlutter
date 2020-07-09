import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/widget/container/home_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SizedBox emptyBox = SizedBox(width: 8);
    final screenWidth = MediaQuery.of(context).size.width;
    final searchBoxWidth = (screenWidth - 2 * 4 - 2 * 8 - emptyBox.width) / 2;

    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.grey200,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      HomeSearch(searchBoxWidth, 'Поиск врача', 'assets/img/searchdoctor.png',),
                      emptyBox,
                      HomeSearch(searchBoxWidth, 'Поиск услуги', 'assets/img/microscope.png',),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
