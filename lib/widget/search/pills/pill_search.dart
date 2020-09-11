import 'package:AibolitFlutter/entity/network/drug_autocomplete.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/search/pills/detailed_pill_search.dart';
import 'package:animations/animations.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillSearch extends StatelessWidget {
  final String _historyTitle = 'история поиска';
  final String _guestBody =
      'После авторизации здесь будет отображаться ваша история поиска лекарств.';
  final String _historyBody = 'История поиска отсутствует';

  final bool isLoggedIn;
  final List<DrugAutocomplete> list;

  const PillSearch({
    Key key,
    this.list,
    this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.grey400,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
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
                  title: list != null
                      ? _getPluralDrugsCount(list.length)
                      : _historyTitle,
                  fontSize: Dimens.TEXT_SIZE_14,
                  isUpperCase: true,
                  top: 12,
                  bottom: 12,
                  left: 12,
                  right: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (list == null)
              AppWidgets.getText(
                title: isLoggedIn ? _historyBody : _guestBody,
                top: 12,
                left: 16,
                fontColor: AppColors.primaryGrey,
              ),
            if (list != null)
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ..._getSearchResult(
                          context: context,
                          list: list,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getPluralDrugsCount(int count) {
    String result;

    if (count == 0) {
      result = 'нет препаратов';
    } else if (count == 1) {
      result = '$count препарат';
    } else if (count > 4) {
      result = '$count препаратов';
    } else {
      result = '$count препарата';
    }

    return result;
  }

  List<Widget> _getSearchResult({
    BuildContext context,
    List<DrugAutocomplete> list,
  }) =>
      List.generate(
        list.length,
        (index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailedPillSearch(),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Container(
              decoration: index != 0
                  ? BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.grey400,
                        ),
                      ),
                    )
                  : null,
              child: AppWidgets.getText(
                title: StringUtils.capitalize(list[index].name),
                fontSize: Dimens.TEXT_SIZE_15,
                top: 12,
                bottom: 12,
                right: 12,
                left: 12,
              ),
            ),
          ),
        ),
      );
}
