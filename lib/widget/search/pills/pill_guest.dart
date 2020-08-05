import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillGuest extends StatelessWidget {
  final String _emptyTitle = 'история поиска';
  final String _emptyBody =
      'После авторизации здесь будет отображаться ваша история поиска лекарств.';

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
      child: Column(
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
      ),
    );
  }
}
