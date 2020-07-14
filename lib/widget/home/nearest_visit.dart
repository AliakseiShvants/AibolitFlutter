import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class NearestVisit extends StatelessWidget {
  final Visit _visit;

  NearestVisit(this._visit);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        child: Container(
          decoration: AppWidgets.getTodayBorder(_visit.date),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AppWidgets.getCircleAvatar(
                        24,
                        _visit.owner.avatar,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          _getVisitOwnerName(_visit.owner),
                          style: Themes.getTextStyle(
                            fontSize: Dimens.TEXT_SIZE_11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  Util.getVisitTitle(
                                    _visit.date,
                                    _visit.doctor.speciality,
                                  ),
                                  style: Themes.getTextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimens.TEXT_SIZE_14,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Feather.more_vertical,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${_visit.doctor.lastName} ${_visit.doctor.firstName} ${_visit.doctor.middleName}',
                          style: Themes.getTextStyle(
                            fontSize: Dimens.TEXT_SIZE_11,
                          ),
                        ),
                        Text(
                          '${_visit.doctor.speciality}',
                          style: Themes.getTextStyle(
                            fontSize: Dimens.TEXT_SIZE_11,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                '${_visit.center.title}',
                                style: Themes.getTextStyle(
                                    fontSize: Dimens.TEXT_SIZE_11),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 8),
                              alignment: Alignment.centerRight,
                              child: Opacity(
                                opacity: Util.getLogoOpacity(_visit),
                                child: Image(
                                  image: AssetImage(_visit.owner.program.logo),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getVisitOwnerName(User user) {
    return user == Data.owner ? 'Мой' : user.firstName;
  }
}
