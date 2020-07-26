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
              SizedBox(
                width: 200,
                height: 100,
                child: Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)
                  ),
                  child: Row(
                    children: [Container(
//                      color: Colors.red,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
            ),
                        width: 10,
                    )],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
