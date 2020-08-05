import 'package:AibolitFlutter/entity/drug.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/widget/search/pills/pill_error.dart';
import 'package:AibolitFlutter/widget/search/pills/pill_guest.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillsSearchScreen extends StatefulWidget {
  @override
  _PillsSearchScreenState createState() => _PillsSearchScreenState();
}

class _PillsSearchScreenState extends State<PillsSearchScreen> {
  final String _text = 'find';
  List<Drug> _drugs = [];

  var _drugController = TextEditingController();
  bool _isLoggedIn;

  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);
    _isLoggedIn = widget.isLoggedIn;
    _drugController.addListener(() {});

    return Container(
      color: AppColors.grey100,
      child: Column(
        children: <Widget>[
          AppWidgets.getInputField(
            context: context,
            borderColor: AppColors.grey400,
            top: 12,
            right: 12,
            bottom: 12,
            left: 12,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey500,
              size: 28,
            ),
            hint: 'Поиск (по полному названию)...',
            controller: null,
          ),
          if (true) Expanded(child: PillGuest()),

          //no internet connection
//          Expanded(
//            child: Align(
//              alignment: Alignment.bottomCenter,
//              child: PillError(),
//            ),
//          ),
        ],
      ),
    );
  }

  void getDrugs() async {
//    final response = await Network.getDrugs('уголь');
//
//    List<Drug> result = (json.decode(utf8.decode(response.bodyBytes)) as List)
//        .map((data) => Drug.fromJson(data))
//        .toList();
//
//    setState(() {
//      drugs = result;
//    });
  }

  List<Card> widgets(List<Drug> list) => List.generate(
        list.length,
        (index) {
          var drug = _drugs[index];

          return Card(
            child: Column(
              children: <Widget>[
                Text(drug.title),
                Text(drug.form),
                Text(drug.country),
                Text(drug.name),
              ],
            ),
          );
        },
      );
}
