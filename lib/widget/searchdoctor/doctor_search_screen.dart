import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/program_modal2.dart';
import 'package:flutter/material.dart';

class SearchDoctorScreen extends StatefulWidget {

  @override
  _SearchDoctorScreenState createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  final String _appBarTitle = 'Поиск врача';
  int programIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SearchDoctorData(
      child: Scaffold(
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
                  programIndex: programIndex,
                  callback: _chooseProgram,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _chooseProgram(BuildContext context, int index) {
    setState(() {
      programIndex = index;
    });

    Navigator.pop(context);
  }
}

class SearchDoctorData extends InheritedWidget {
  static SearchDoctorData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: SearchDoctorData)
      as SearchDoctorData;

  final Widget child;

  SearchDoctorData({
    Key key,
    this.child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
