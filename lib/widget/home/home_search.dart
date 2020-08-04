import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:flutter/widgets.dart';

import '../util/home_search_item.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        HomeSearchItem(
          title: 'Поиск врача',
          assetPath: 'assets/img/doctor/search.png',
          callback: () => Navigator.pushNamed(
            context,
            '/search/doctor',
          ),
        ),
        Spacer(),
        HomeSearchItem(
          title: 'Поиск услуги',
          assetPath: 'assets/img/microscope.png',
          callback: () => Navigator.pushNamed(
            context,
            '/search/service',
          ),
        ),
      ],
    );
  }
}
