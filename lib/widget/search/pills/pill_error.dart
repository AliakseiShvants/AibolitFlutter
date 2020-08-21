import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';

class PillError extends StatelessWidget {
  final String _primaryTitle = 'поддержка';
  final String _secondaryTitle = 'настройки';
  final String _wrongTitle = 'Что-то пошло не так :(';
  final String _wrongBody =
      'Возможно у вас отсутствует соединение с интернетом или сервис поиска лекарств временно недоступен. Проверьте подключение к сети или обратитесь в поддержку.';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/img/pill/notfound.png'),
          AppWidgets.getText(
            title: _wrongTitle,
            top: 32,
            bottom: 16,
            fontWeight: FontWeight.bold,
            fontSize: Dimens.TEXT_SIZE_16,
          ),
          AppWidgets.getText(
            title: _wrongBody,
            left: 24,
            right: 24,
            textAlign: TextAlign.center,
          ),
          AppWidgets.getControlButtonsRow(
            context: context,
            primary: _primaryTitle,
            primaryCallback: null,
            primaryColor: AppColors.green,
            secondary: _secondaryTitle,
            secondaryCallback: null,
            secondaryColor: AppColors.indigo100,
            left: 32,
            right: 32,
            top: 32,
            bottom: 16,
            isNeedSpaceBetween: true,
          ),
        ],
      ),
    );
  }
}
