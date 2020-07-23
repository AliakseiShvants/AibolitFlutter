import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:map_launcher/map_launcher.dart';

class ClinicHeader extends StatelessWidget {
  final Clinic clinic;

  const ClinicHeader({Key key, this.clinic}) : super(key: key);

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
                clinic: clinic,
                avatarRadius: 40,
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
                        title: clinic.title,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.TEXT_SIZE_14,
                      ),
                      AppWidgets.getText(
                        title: '${clinic.town}, ${clinic.address}',
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
                              title: "Посмотреть на карте",
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
              title: 'выбрать врача',
              callback: null,
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
        builder: (BuildContext context) =>
            Padding(
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
    final title = clinic.title;
    final coords = Coords(double.tryParse(clinic.x), double.tryParse(clinic.y));

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
                  coords: coords, title: title, description: title,);
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
              constraints:
              BoxConstraints(minWidth: double.infinity),
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
