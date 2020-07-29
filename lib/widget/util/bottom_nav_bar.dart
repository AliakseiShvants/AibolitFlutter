import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_icons.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedItem;
  final Function callback;

  const BottomNavBar({Key key, this.selectedItem = -1, this.callback,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: Borders.primaryGreyBorderSide,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedItem != -1 ? selectedItem : widget.selectedItem,
        iconSize: 32,
        items: List.generate(
          AppIcons.bottomNavIcons.length,
          (index) {
            final String key = AppIcons.bottomNavIcons.keys.elementAt(index);
            final Widget value =
                AppIcons.bottomNavIcons.values.elementAt(index);

            return BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: value,
              ),
              title: Text(key),
            );
          },
        ),
        onTap: callback != null ? callback : widget.onMenuClickCallback,
        selectedFontSize: 8,
        selectedItemColor: AppColors.PRIMARY_COLOR,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 8,
        unselectedItemColor: AppColors.primaryGrey,
      ),
    );
  }
}
