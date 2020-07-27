import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/search/search_control_panel.dart';
import 'package:AibolitFlutter/widget/util/search/search_field.dart';
import 'package:AibolitFlutter/widget/util/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final list = _isBookmarkEnabled ? _bookmarkClinics : _clinics;
    final iconData =
        _isBookmarkEnabled ? Icons.bookmark : Icons.bookmark_border;
    final bookmarkColor = _isBookmarkEnabled ? AppColors.PRIMARY_COLOR : Colors.black54;

    return Container(
      height: double.infinity,
      color: AppColors.grey100,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramModal(),
              SearchField(
                hintText: hintText,
              ),
              SearchControlPanel(
                title: _getPluralClinicsCount(list.length),
                iconData: iconData,
                bookmarkIconColor: bookmarkColor,
                bookmarkCallback: _pushBookmark,
                filterTitle: _filterTitle,
                filterIndex: _filterIndex,
                filterOptions: _filterOptions,
                filterCallback: _filter,
                sortTitle: _sortTitle,
                sortIndex: _sortIndex,
                sortOptions: _sortOptions,
                sortCallback: _sort,
              ),
              SearchResult(),
//              ClinicsWidget(),
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
}
