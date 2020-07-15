import 'package:AibolitFlutter/entity/setting_item.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/container/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatelessWidget {
  final String _headerTitle = 'Поиск врачей и лекарств онлайн.';
  final String _headerMsg =
      'Информация о лекарствах предоставлена сервисом tabletka.by';
  static String _updateDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  static String _updateDatabaseDate =
      'Последнее обновление базы '.toUpperCase() + _updateDate;
  static String _version = 'XYZ-prod001';

  final Widget _settingsFooter = SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: AppColors.grey100,
      child: Column(
        children: <Widget>[
          Text(
            _updateDatabaseDate,
            style: TextStyle(
              fontSize: Dimens.TEXT_SIZE_10,
              color: AppColors.primaryGrey,
            ),
          ),
          Text(
            'Версия $_version',
            style: TextStyle(
              fontSize: Dimens.TEXT_SIZE_10,
              color: AppColors.primaryGrey,
            ),
          ),
        ],
      ),
    ),
  );

  List<Widget> _getSettingItems() {
    return List.generate(Data.settingItems.length, (index) {
      return InfoItem(
        Data.settingItems[index].title,
        callback: () => _settingAction(Data.settingItems[index]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppWidgets.getHeaderWithLogo(_headerTitle, _headerMsg),
            ..._getSettingItems(),
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

  void _settingAction(SettingItem item) {
    if (item.isEmail) {
      Util.openBrowser(Uri(
        scheme: 'mailto',
        path: item.url,
      ).toString());
    }

    Util.openBrowser(item.url);
  }
}
