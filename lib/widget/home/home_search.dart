import 'package:flutter/widgets.dart';

import '../container/home_search_item.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SizedBox emptyBox = SizedBox(width: 8);

    return Row(
      children: <Widget>[
        HomeSearchItem(
          'Поиск врача',
          'assets/img/searchdoctor.png',
        ),
        emptyBox,
        HomeSearchItem(
          'Поиск услуги',
          'assets/img/microscope.png',
        ),
      ],
    );
  }
}
