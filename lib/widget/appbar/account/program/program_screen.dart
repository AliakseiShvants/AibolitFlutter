import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramScreen extends StatelessWidget {
  final String _appBarTitle = 'Программа';
  final Program _program = Data.owner.program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context,
        _appBarTitle,
        actions: [
          MaterialButton(
            child: AppWidgets.getCircleAvatar(
              16,
              Data.owner.avatar,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Borders.primaryGreyBorderSide,
                      ),
                    ),
                    child: AppWidgets.getTextHeader(
                      'основная информация',
                      left: 8,
                      top: 0,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Borders.primaryGreyBorderSide,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: AppWidgets.getText(
                              'Компания:',
                              horizontal: 0,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              _program.company,
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_13,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Image(
                              image: AppWidgets.programLogo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Borders.primaryGreyBorderSide,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: AppWidgets.getText(
                              'Программа:',
                              horizontal: 0,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Text(
                              _program.program,
                              style: TextStyle(
                                fontSize: Dimens.TEXT_SIZE_13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppWidgets.getText(
                    'Перейдите по ссылке, чтобы ознакомиться с вашей программой',
                    horizontal: 8,
                    vertical: 16,
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Условия программы",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.PRIMARY_COLOR,
                          fontSize: Dimens.TEXT_SIZE_12,
                        ),
                      ),
                    ),
                    onTap: () => launch('https://benefits.epam.com'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
