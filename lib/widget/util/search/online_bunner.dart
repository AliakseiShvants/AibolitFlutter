import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:flutter/widgets.dart';

class OnlineBunner extends StatelessWidget {
  final bool isOnline;

  OnlineBunner({Key key, this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: isOnline ? AppColors.green100 : AppColors.grey200,
          border: Border(
            bottom: BorderSide(
              color: isOnline ? AppColors.green : AppColors.grey400,),
          )
      ),
      child: Center(
        child: AppWidgets.getText(
          title: _getTitle(isOnline),
          fontColor: AppColors.primaryGrey,
          top: 12,
          bottom: 12,
        ),
      ),
    );
  }

  String _getTitle(bool isOnline) =>
      isOnline
          ? 'Эта клиника поддерживает онлайн-запись'
          : 'Эта клиника не поддерживает онлайн-запись';
}
