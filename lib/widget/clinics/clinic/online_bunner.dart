import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:flutter/widgets.dart';

class OnlineBunner extends StatelessWidget {
  final String title = 'Эта клиника поддерживает онлайн-запись';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.green100,
        border: Border(
          bottom: BorderSide(color: AppColors.green),
        )
      ),
      child: Center(
        child: AppWidgets.getText(
          title: title,
          fontColor: AppColors.primaryGrey,
          top: 12,
          bottom: 12,
        ),
      ),
    );
  }
}
