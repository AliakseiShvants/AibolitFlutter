import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/widget/container/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final String _appBarTitle = 'Напоминания';

  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(context, _appBarTitle),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: AppColors.indigo50,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Borders.primaryGreyBorderSide,
                      ),
                    ),
                    child: InfoItem(
                      'Настройки напоминаний будут применяться по умолчанию ко всем вашим визитам',
                      color: AppColors.indigo50,
                      fontSize: Dimens.TEXT_SIZE_12,
                      isTrailing: false,
                      textColor: AppColors.indigo200,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: Borders.primaryGreyBorderSide,
                      ),
                    ),
                    child: ListTile(
                      title: Text('Не напоминать'),
                      trailing: Switch(
                        value: _isEnabled,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isEnabled = !_isEnabled;
                          });
                        },
                      ),
                    ),
                  ),
                  ..._getNotifications(Data.notifications),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: Borders.primaryGreyBorderSide,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            child: Text(
                              'Отменить'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimens.TEXT_SIZE_13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            disabledColor: AppColors.green,
                            child: Text(
                              'Сохранить'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimens.TEXT_SIZE_11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Container> _getNotifications(Map<String, bool> map) => List.generate(
        map.length,
        (index) {
          var key = map.keys.elementAt(index);
          var value = map.values.elementAt(index);
          Color textColor = _isEnabled ? AppColors.grey400 : Colors.black;

          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: Borders.primaryGreyBorderSide,
              ),
            ),
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                key,
                style: Themes.getTextStyle(
                  fontSize: Dimens.TEXT_SIZE_14,
                  color: textColor,
                ),
              ),
              value: value,
              activeColor: _isEnabled ? textColor : AppColors.PRIMARY_COLOR,
              onChanged: (bool value) {
                if (!_isEnabled) {
                  setState(() {
                    map[key] = value;
                  });
                }
              },
            ),
          );
        },
      );
}
