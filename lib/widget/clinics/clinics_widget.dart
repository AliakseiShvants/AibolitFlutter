import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'clinic_item.dart';

class ClinicsWidget extends StatefulWidget {

  @override
  _ClinicsWidgetState createState() => _ClinicsWidgetState();
}

class _ClinicsWidgetState extends State<ClinicsWidget> {
  List<Clinic> _clinics = Data.clinics;

  List<Clinic> _bookmarkClinics = Data.clinicBookmarks;

  List<String> _sortParameters = [
    "По количеству докторов",
    "По названию медцентра",
    "По количеству отзывов",
  ];

  List<String> _clinicTypes = [
    "Любой медцентр",
    "Медцентры программы",
  ];

  bool _isBookmarkEnabled = false;
  int _typeIndex = 0;
  int _sortIndex = 0;

  @override
  Widget build(BuildContext context) {
    final list = _isBookmarkEnabled ? _bookmarkClinics : _clinics;
    final iconData =
    _isBookmarkEnabled ? Icons.bookmark : Icons.bookmark_border;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 8,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: AppWidgets.getText(
                  title: _getPluralClinicsCount(list.length),
                  left: 8,
                  isUpperCase: true,
                  fontSize: Dimens.TEXT_SIZE_10,
                ),
              ),
              AppWidgets.getClickableIcon(
                data: iconData,
                callback: _reverseBookmark,
                iconColor: _isBookmarkEnabled
                    ? AppColors.PRIMARY_COLOR
                    : Colors.black54,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => AppWidgets.getActionsModal(
                      context: context,
                      title: 'Тип медцентра',
                      currentIndex: _typeIndex,
                      list: _clinicTypes,
                      isClose: true,
                      callback: _chooseType,
                    ),
                  ),
                  child: Transform.rotate(
                    angle: 3.14 / 2,
                    child: Icon(
                      SimpleLineIcons.equalizer,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              AppWidgets.getClickableIcon(
                data: Icons.sort,
                callback: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => AppWidgets.getActionsModal(
                    context: context,
                    title: 'Сортировать список медцентров',
                    currentIndex: _sortIndex,
                    list: _sortParameters,
                    isClose: true,
                    callback: _chooseSortParameter,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (list.length == 0)
          Column(
            children: <Widget>[
              Image(
                width: 240,
                height: 120,
                image: AssetImage('assets/img/clinic/clinic_stub.jpg'),
              ),
              AppWidgets.getText(
                title: 'У вас в закладках пока нет медцентров',
                top: 32,
                bottom: 16,
                fontWeight: FontWeight.bold,
                fontSize: Dimens.TEXT_SIZE_13,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: AppWidgets.getText(
                    title: 'Добавляйте в закладки медцентры, которые вам понравились. Так их всегда будет легко найти.',
                    left: 0,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    fontColor: AppColors.primaryGrey,
                    fontSize: Dimens.TEXT_SIZE_11,
                  ),
                ),
              ),
            ],
          ),
        ..._getClinics(list),
      ],
    );
  }

  List<ClinicItem> _getClinics(List<Clinic> list) => List.generate(
    list.length,
        (index) => ClinicItem(list[index]),
  );

  void _reverseBookmark() {
    setState(() {
      _isBookmarkEnabled = !_isBookmarkEnabled;
    });
  }

  String _getPluralClinicsCount(int count) {
    String result;

    if (count == 0) {
      result = 'нет медцентров';
    } else if (count == 1) {
      result = '$count медцентр';
    } else if (count > 4) {
      result = '$count медцентров';
    } else {
      result = '$count медцентра';
    }

    return result;
  }

  void _chooseType(int index) {
    setState(() {
      _typeIndex = index;
    });

    Navigator.pop(context);
  }

  void _chooseSortParameter(int index) {
    setState(() {
      _sortIndex = index;
    });

    Navigator.pop(context);
  }
}
