import 'package:AibolitFlutter/entity/doctor.dart';
import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/search/search_control_panel.dart';
import 'package:AibolitFlutter/widget/util/search/search_field.dart';
import 'package:AibolitFlutter/widget/util/search/search_result.dart';
import 'package:flutter/material.dart';

import 'doctor_item.dart';

class DoctorSearchScreen extends StatefulWidget {
  @override
  _DoctorSearchScreenState createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  final String _appBarTitle = 'Поиск врача';
  final String _searchHint = 'Поиск врача (от трёх символов)...';
  final String _sortTitle = 'Сортировать список врачей';
  final List<String> _sortOptions = [
    "По дате визита",
    "По фамилии",
    "По количеству отзывов",
  ];

  bool _isBookmarkEnabled = false;
  int _programIndex = 0;
  int _sortIndex = 0;
  TextEditingController _doctorController = TextEditingController();
  List<Doctor> _doctors = Data.doctors;
  List<Doctor> _bookmarkDoctors = Data.bookmarkDoctors;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    final searchParameter = args != null ? args['searchParameter'] : null;
    final list = _getListBySearch(searchParameter);

    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramModal(
                programs: Data.epamPrograms,
                programIndex: _programIndex,
                callback: _chooseProgram,
              ),
              SearchField(
                hintText: _searchHint,
                controller: _doctorController,
              ),
              SearchControlPanel(
                title: _getPluralDoctorsCount(list.length, _isBookmarkEnabled,),
                isBookmarkEnabled: _isBookmarkEnabled,
                bookmarkCallback: _pushBookmark,
                filterCallback: () => Navigator.pushNamed(
                  context,
                  '/search/doctor/advanced',
                ),
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
                stubImg: 'assets/img/clinic/clinic_stub.jpg',
                emptyTitle: 'У вас в закладках пока нет врачей',
                emptyText: 'Добавляйте в закладки врачей, которые вам понравились. Так их всегда будет легко найти.',
                list: _getDoctors(
                  list,
                  Data.epamPrograms[_programIndex],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pushBookmark() {
    setState(() {
      _isBookmarkEnabled = !_isBookmarkEnabled;
    });
  }

  void _sort(BuildContext context, int index) {
    setState(() {
      _sortIndex = index;
    });

    Navigator.pop(context);
  }

  void _chooseProgram(BuildContext context, int index) {
    setState(() {
      _programIndex = index;
    });

    Navigator.pop(context);
  }

  String _getPluralDoctorsCount(int count, bool isBookmarkEnabled,) {
    String result;
    final bookmark = isBookmarkEnabled ? 'в закладках' : '';

    if (count == 0) {
      result = 'нет врачей $bookmark';
    } else if (count == 1) {
      result = '$count врач $bookmark';
    } else if (count > 4) {
      result = '$count врачей $bookmark';
    } else {
      result = '$count врача $bookmark';
    }

    return result;
  }

  List<DoctorItem> _getDoctors(
    List<Doctor> list,
    Program program,
  ) =>
      List.generate(
        list.length,
        (index) => DoctorItem(
          doctor: list[index],
          program: program,
        ),
      );

  List<Doctor> _getListBySearch(String search) {
    var list =  _isBookmarkEnabled ? _bookmarkDoctors : _doctors;

    if (search != null) {
      list = list.where((element) => element.speciality.contains(search)).toList();
    }

    return list;
  }
}
