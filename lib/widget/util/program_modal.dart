import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgramModal extends StatefulWidget {

  @override
  _ProgramModalState createState() => _ProgramModalState();
}

class _ProgramModalState extends State<ProgramModal> {
  final List<Program> _programs = Data.epamPrograms;

  int _programIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 16,
          left: 12,
          right: 12,
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.grey300,
                width: 1,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              dense: true,
              leading: Image(
                image: AppWidgets.programLogo,
              ),
              title: Text(
                _programs[_programIndex].program,
                style: TextStyle(
                  fontSize: Dimens.TEXT_SIZE_14,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
            ),
          ),
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => AppWidgets.getActionsModal(
              context: context,
              title: 'Программа для отображения',
              currentIndex: _programIndex,
              list: _programs.map((e) => e.program).toList(),
              callback: _chooseProgram,
            ),
          ),
        ),
      ),
    );
  }

  void _chooseProgram(int index) {
    setState(() {
      _programIndex = index;
    });

    Navigator.pop(context);
  }
}
