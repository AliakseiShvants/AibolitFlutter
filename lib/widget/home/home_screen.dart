import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/home/nearest_visits.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';
import 'home_search.dart';
import 'popular_requests.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey200,
      height: double.infinity,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                HomeSearch(),
                PopularRequests(),
                NearestVisits(visits: Data.visits),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
