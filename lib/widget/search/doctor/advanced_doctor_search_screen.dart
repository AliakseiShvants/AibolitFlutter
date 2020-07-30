import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class AdvancedSearchDoctorScreen extends StatelessWidget {
  final String _appBarTitle = 'Поиск врача';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
      ),
      body: Column(),
    );
  }
}
