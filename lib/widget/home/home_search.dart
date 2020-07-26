import 'package:flutter/widgets.dart';

import '../container/home_search_item.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        HomeSearchItem(
          'Поиск врача',
          'assets/img/searchdoctor.png',
        ),
        Spacer(),
        HomeSearchItem(
          'Поиск услуги',
          'assets/img/microscope.png',
        ),
      ],
    );
  }
}
