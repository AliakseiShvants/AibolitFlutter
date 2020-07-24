import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:flutter/material.dart';

class SearchDoctorScreen extends StatelessWidget {
  final String _appBarTitle = 'Поиск врача';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramModal(),
            ],
          ),
        ),
      ),
    );
  }
}
