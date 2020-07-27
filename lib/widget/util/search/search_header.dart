import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:map_launcher/map_launcher.dart';

class SearchHeader extends StatelessWidget {
  final String avatar;
  final String itemTitle;
  final String buttonTitle;
  final double programOpacity;
  final String location;
  final String link;
  final Function buttonCallback;
  final Coords coords;

  const SearchHeader({
    Key key,
    this.avatar,
    this.programOpacity,
    this.itemTitle,
    this.location,
    this.link,
    this.buttonTitle,
    this.buttonCallback,
    this.coords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 12,
            right: 24,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppWidgets.getCircleAvatarWithLogo(
                avatarRadius: 40,
                avatar: avatar,
                programOpacity: programOpacity,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    left: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppWidgets.getText(
                        title: itemTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.TEXT_SIZE_14,
                      ),
                      AppWidgets.getText(
                        title: location,
                        top: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: AppColors.PRIMARY_COLOR,
                              size: 20,
                            ),
                            AppWidgets.getText(
                              title: link,
                              decoration: TextDecoration.underline,
                              fontColor: AppColors.PRIMARY_COLOR,
                              fontSize: Dimens.TEXT_SIZE_12,
                              left: 8,
                              callback: () => _showOnMap(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: AppWidgets.getMaterialButton(
              context: context,
              title: buttonTitle,
              callback: buttonCallback,
              disabledColor: AppColors.green,
              color: AppColors.green,
            ),
          ),
        ),
      ],
    );
  }

  _showOnMap(BuildContext context) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppWidgets.getText(
                title: 'Открыть с помощью приложения:',
                fontWeight: FontWeight.bold,
                fontSize: Dimens.TEXT_SIZE_14,
                bottom: 24,
              ),
              Wrap(
                children: <Widget>[
                  ..._getMaps(
                    context: context,
                    availableMaps: availableMaps,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  List<Widget> _getMaps({
    BuildContext context,
    List<AvailableMap> availableMaps,
  }) {
    return List.generate(
      availableMaps.length,
      (index) {
        final map = availableMaps[index];

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppWidgets.getCircleAvatar(
              radius: 20,
              callback: () {
                map.showMarker(
                  coords: coords,
                  title: itemTitle,
                  description: itemTitle,
                );
                Navigator.pop(context);
              },
              child: Image(
                image: map.icon,
              ),
            ),
            AppWidgets.getText(
              title: map.mapName,
              top: 8,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: AppWidgets.getFlatButton(
                context: context,
                title: 'Отмена',
                color: AppColors.grey200,
                disabledColor: AppColors.grey200,
                fontWeight: FontWeight.bold,
                isUpperCase: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                top: 16,
                callback: () => Navigator.pop(context),
              ),
            ),
          ],
        );
      },
    );
  }
}
