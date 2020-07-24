import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/widget/clinics/clinics_widget.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClinicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.grey100,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramModal(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  right: 12,
                ),
                child: Column(
                  children: <Widget>[
                    SearchField(
                      hintText: 'Поиск медцентра ...',
                    ),
                    ClinicsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
