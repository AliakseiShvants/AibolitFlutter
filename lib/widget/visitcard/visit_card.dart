import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

class VisitCard extends StatelessWidget {
  final Visit _visit;

  VisitCard(this._visit);

  bool _isFuture(DateTime date) => date.isAfter(DateTime.now());

  bool _isToday(DateTime date) =>
      DateTime.now().year == date.year &&
      DateTime.now().month == date.month &&
      DateTime.now().day == date.day;

  BoxDecoration _getTodayBorder(DateTime date) {
    return _isFuture(date)
        ? BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.PRIMARY_COLOR,
                width: 4,
              ),
            ),
          )
        : null;
  }

  String _getVisitTitle(DateTime date, String speciality) {
    final visitTime = DateFormat('HH:mm').format(date);
    var result = 'Визит';

    if (_isToday(date)) {
      result = 'Сегодня - $visitTime';
    } else if (_isFuture(date)) {
      result = DateFormat('dd MMMM - HH:mm').format(date);
    } else {
      result += ': $speciality';
    }

    return result;
  }

  String _getVisitOwnerName(User user) {
    return user == Data.owner ? 'Мой визит' : user.firstName;
  }

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
          decoration: _getTodayBorder(_visit.date),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16,
              left: 16,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _getVisitTitle(_visit.date, _visit.doctor.speciality),
                        style: Themes.getTextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.TEXT_SIZE_13,
                        ),
                      ),
                    ),
                    _isFuture(_visit.date)
                        ? GestureDetector(
                            child: Icon(
                              Feather.more_vertical,
                            ),
                          )
                        : GestureDetector(
                            child: Icon(
                              EvilIcons.trash,
                            ),
                            onTap: null,
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${_visit.doctor.lastName} ${_visit.doctor.firstName} ${_visit.doctor.middleName}',
                        style:
                            Themes.getTextStyle(fontSize: Dimens.TEXT_SIZE_11),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Text(
                          '${_visit.doctor.specialityLong}',
                          style: Themes.getTextStyle(
                              fontSize: Dimens.TEXT_SIZE_11),
                        ),
                      ),
                      Text(
                        '${_visit.center.title}',
                        style:
                            Themes.getTextStyle(fontSize: Dimens.TEXT_SIZE_11),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: _getLogoOpacity(_visit),
                      child: Image(
                        image: AssetImage(_visit.owner.program.logo),
                      ),
                    )),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(_visit.owner.avatar),
                      radius: 12,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          _getVisitOwnerName(_visit.owner),
                          style: Themes.getTextStyle(
                            fontSize: Dimens.TEXT_SIZE_11,
                          ),
                        ),
                      ),
                    ),
                    if (!_isFuture(_visit.date))
                      Text(
                        DateFormat('dd MMMM HH:mm').format(_visit.date),
                        style: Themes.getTextStyle(
                          fontSize: Dimens.TEXT_SIZE_11,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getLogoOpacity(Visit visit) {
    return Data.programToDoctors[visit.owner.program].contains(visit.doctor)
        ? 1
        : 0;
  }
}
