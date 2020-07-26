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


  @override
  Widget build(BuildContext context) {
    final list = _isBookmarkEnabled ? _bookmarkClinics : _clinics;
    final iconData =
    _isBookmarkEnabled ? Icons.bookmark : Icons.bookmark_border;

    return Column(
      children: <Widget>[
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
        (index) => ClinicItem(clinic: list[index]),
  );






}
