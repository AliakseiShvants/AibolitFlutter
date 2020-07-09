import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/container/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatelessWidget {
  static String _updateDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  static String _updateDatabaseDate =
      'Последнее обновление базы '.toUpperCase() + _updateDate;
  static String _version = 'XYZ-prod001';

  final _settingItems = [
    'О проекте',
    'Пользовательское соглашение',
    'Политика конфиденциальности',
    'Обратиться в поддержку',
    'Предложения по улучшению Aibolit',
  ];

  final Widget _settingsHeader = SizedBox(
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      color: AppColors.grey100,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 100,
            height: 100,
            child: Image(
              image: AssetImage('assets/img/logofull.png'),
            ),
          ),
          Text(
            'Поиск врачей и лекарств онлайн.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.TEXT_SIZE_14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                Text(
                  'Информация о лекарствах',
                  style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_11,
                    color: AppColors.primaryGrey,
                  ),
                ),
                Text(
                  'предоставлена сервисом tabletka.by',
                  style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_11,
                    color: AppColors.primaryGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
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
    return List.generate(_settingItems.length, (index) {
      return InfoItem(_settingItems[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _settingsHeader,
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
    );
  }
}
