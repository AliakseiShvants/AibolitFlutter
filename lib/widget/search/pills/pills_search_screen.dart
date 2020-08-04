import 'package:AibolitFlutter/entity/drug.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillsSearchScreen extends StatefulWidget {
  @override
  _PillsSearchScreenState createState() => _PillsSearchScreenState();
}

class _PillsSearchScreenState extends State<PillsSearchScreen> {
  final String _text = 'find';
  final String _emptyTitle = 'история поиска';
  final String _emptyBody =
      'После авторизации здесь будет отображаться ваша история поиска лекарств.';
  List<Drug> _drugs = [];

  var _drugController = TextEditingController();
  bool _isLoggedIn;

  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);
    _isLoggedIn = widget.isLoggedIn;
    _drugController.addListener(() {});

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey100,
            border: Border(
              bottom: BorderSide(
                color: AppColors.grey400,
              ),
            ),
          ),
          child: AppWidgets.getInputField(
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
        ),
        if (/*!_isLoggedIn*/ true)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grey400,
                        ),
                      ),
                    ),
                    child: AppWidgets.getText(
                      title: _emptyTitle,
                      fontSize: Dimens.TEXT_SIZE_14,
                      isUpperCase: true,
                      top: 12,
                      bottom: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AppWidgets.getText(
                title: _emptyBody,
                top: 12,
                left: 16,
                fontColor: AppColors.primaryGrey,
              ),
            ],
          )
      ],
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
