import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgramModalSate extends StatelessWidget {
  final List<Program> programs;
  final int programIndex;
  final Function callback;

  const ProgramModalSate({
    Key key,
    @required this.programs,
    @required this.programIndex,
    @required this.callback,
  }) : super(key: key);

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
                programs[programIndex].program,
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
              currentIndex: programIndex,
              list: programs.map((e) => e.program).toList(),
              callback: callback,
            ),
          ),
        ),
      ),
    );
  }
}
