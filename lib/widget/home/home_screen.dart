import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';
import 'home_search.dart';
import 'popular_request.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.grey200,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                HomeSearch(),
                PopularRequest(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
