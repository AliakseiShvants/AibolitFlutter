import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'single_item_info_panel.dart';

class SingleItemInfo extends StatelessWidget {
  final String timeTitle;
  final String timeInfo;
  final String feedbackTitle;
  final String feedbackInfo;

  const SingleItemInfo({
    Key key,
    this.timeTitle,
    this.timeInfo,
    this.feedbackTitle,
    this.feedbackInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleItemInfoPanel(
            title: timeTitle,
            info: timeInfo,
            iconData: Icons.access_time,
            iconColor: AppColors.PRIMARY_COLOR,
          ),
        ),
        VerticalDivider(
          width: 1,
          color: AppColors.grey400,
        ),
        Expanded(
          child: SingleItemInfoPanel(
            title: feedbackTitle,
            info: feedbackInfo,
            iconData: MaterialIcons.chat,
            iconColor: AppColors.green,
          ),
        ),
      ],
    );
  }
}
