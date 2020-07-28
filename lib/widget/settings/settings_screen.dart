import 'package:AibolitFlutter/entity/action.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'file:///C:/Users/Aliaksei_Shvants/projects/AibolitFlutter/lib/widget/util/info_item.dart';

class SettingsScreen extends StatelessWidget {
  final String _headerTitle = 'Поиск врачей и лекарств онлайн.';
  final String _headerMsg =
      'Информация о лекарствах предоставлена сервисом tabletka.by';
  static String _updateDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  static String _updateDatabaseDate = 'Последнее обновление базы ' + _updateDate;
  static String _version = 'XYZ-prod001';

  final Widget _settingsFooter = SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: AppColors.grey100,
      child: Column(
        children: <Widget>[
          AppWidgets.getText(
            title: _updateDatabaseDate,
            fontSize: Dimens.TEXT_SIZE_9,
            fontColor: AppColors.primaryGrey,
          ),
          AppWidgets.getText(
            title: 'Версия $_version',
            isUpperCase: true,
            fontSize: Dimens.TEXT_SIZE_10,
            fontColor: AppColors.primaryGrey,
          ),
        ],
      ),
    ),
  );

  List<Widget> _getSettingItems({List<ActionItem> list}) {
    return List.generate(
      list.length,
      (index) => InfoItem(
        title: list[index].title,
        callback: () => _settingAction(list[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppWidgets.getHeaderWithLogo(
              _headerTitle,
              _headerMsg,
              .6,
            ),
            ..._getSettingItems(list: Data.settingActions),
            Container(
              child: _settingsFooter,
              decoration: BoxDecoration(
                border: Border(
                  top: Borders.primaryGreyBorderSide,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingAction(ActionItem item) {
    if (item.isEmail) {
      Util.openBrowser(
        Uri(
          scheme: 'mailto',
          path: item.url,
        ).toString(),
      );
    }

    Util.openBrowser(item.url);
  }
}
