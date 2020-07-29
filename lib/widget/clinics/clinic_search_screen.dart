import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/action.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/search/search_control_panel.dart';
import 'package:AibolitFlutter/widget/util/search/search_field.dart';
import 'package:AibolitFlutter/widget/util/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'clinic_item.dart';

class ClinicSearchScreen extends StatefulWidget {
  @override
  _ClinicSearchScreenState createState() => _ClinicSearchScreenState();
}

class _ClinicSearchScreenState extends State<ClinicSearchScreen> {
  final hintText = 'Поиск медцентра ...';
  bool _isBookmarkEnabled = false;
  List<Clinic> _clinics = Data.clinics;
  List<Clinic> _bookmarkClinics = Data.clinicBookmarks;

  final String _sortTitle = 'Сортировать список медцентров';
  int _sortIndex = 0;
  int _programIndex = 0;
  final List<String> _sortOptions = [
    "По количеству докторов",
    "По названию медцентра",
    "По количеству отзывов",
  ];

  final String _filterTitle = 'Тип медцентра';
  int _filterIndex = 0;
  final List<String> _filterOptions = [
    "Любой медцентр",
    "Медцентры программы",
  ];

  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);
    final list = _isBookmarkEnabled ? _bookmarkClinics : _clinics;

    return Container(
      height: double.infinity,
      color: AppColors.grey100,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramModal(
                programs: Data.epamPrograms,
                programIndex: _programIndex,
                callback: _chooseProgram,
              ),
              SearchField(
                hintText: hintText,
              ),
              SearchControlPanel(
                title: _getPluralClinicsCount(list.length),
                isBookmarkEnabled: _isBookmarkEnabled,
                bookmarkCallback: _pushBookmark,
                filterCallback: () {
                  Util.showModalBottom(
                    context: context,
                    title: _filterTitle,
                    currentIndex: _filterIndex,
                    list: _filterOptions,
                    isClose: true,
                    callback: _filter,
                  );
                },
                sortCallback: () {
                  Util.showModalBottom(
                    context: context,
                    title: _sortTitle,
                    currentIndex: _sortIndex,
                    list: _sortOptions,
                    isClose: true,
                    callback: _sort,
                  );
                },
              ),
              SearchResult(
                list: _getClinics(list),
              ),
            ],
          ),
        ),
      ),
    );
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

  void _pushBookmark() {
    setState(() {
      _isBookmarkEnabled = !_isBookmarkEnabled;
    });
  }

  void _filter(BuildContext context, int index) {
    setState(() {
      _filterIndex = index;
    });

    Navigator.pop(context);
  }

  void _sort(BuildContext context, int index) {
    setState(() {
      _sortIndex = index;
    });

    Navigator.pop(context);
  }

  List<ClinicItem> _getClinics(List<Clinic> list) => List.generate(
        list.length,
        (index) => ClinicItem(clinic: list[index]),
      );

  void _chooseProgram(BuildContext context, int index) {
    setState(() {
      _programIndex = index;
    });

    Navigator.pop(context);
  }
}
