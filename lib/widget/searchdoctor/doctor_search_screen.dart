import 'package:AibolitFlutter/entity/doctor.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/program_modal2.dart';
import 'package:AibolitFlutter/widget/util/search/search_control_panel.dart';
import 'package:AibolitFlutter/widget/util/search/search_field.dart';
import 'package:flutter/material.dart';

class SearchDoctorScreen extends StatefulWidget {

  @override
  _SearchDoctorScreenState createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  final String _appBarTitle = 'Поиск врача';
  final String _searchHint = 'Поиск врача (от трёх символов)...';

  bool _isBookmarkEnabled = false;
  int _programIndex = 0;
  TextEditingController _doctorController = TextEditingController();
  List<Doctor> _doctors = Data.doctors;
  List<Doctor> _bookmarkDoctors = Data.bookmarkDoctors;

  @override
  Widget build(BuildContext context) {
    final list = _isBookmarkEnabled ? _bookmarkDoctors : _doctors;
    final iconData =
    _isBookmarkEnabled ? Icons.bookmark : Icons.bookmark_border;
    final bookmarkColor =
    _isBookmarkEnabled ? AppColors.PRIMARY_COLOR : Colors.black54;

    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramModalSate(
                programs: Data.epamPrograms,
                programIndex: _programIndex,
                callback: _chooseProgram,
              ),
              SearchField(
                hintText: _searchHint,
                controller: _doctorController,
              ),
              SearchControlPanel(
                title: _getPluralDoctorsCount(list.length),
                iconData: iconData,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _chooseProgram(BuildContext context, int index) {
    setState(() {
      _programIndex = index;
    });

    Navigator.pop(context);
  }

  String _getPluralDoctorsCount(int count) {
    String result;

    if (count == 0) {
      result = 'нет врачей';
    } else if (count == 1) {
      result = '$count врач';
    } else if (count > 4) {
      result = '$count врачей';
    } else {
      result = '$count врача';
    }

    return result;
  }
}
