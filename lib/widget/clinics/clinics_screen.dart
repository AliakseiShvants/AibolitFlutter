import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/clinics/clinic_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ClinicsScreen extends StatefulWidget {
  @override
  _ClinicsScreenState createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  int programIndex = 0;

  var clinicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.grey100,
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  color: AppColors.PRIMARY_COLOR,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      bottom: 16,
                      left: 12,
                      right: 12,
                    ),
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        dense: true,
                        leading: Image(
                          image: AppWidgets.programLogo,
                        ),
                        title: Text(
                          Data.epamPrograms[programIndex].program,
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
                  ),
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => AppWidgets.getModalBody(
                    context,
                    'Программа для отображения',
                    List.generate(
                      Data.epamClinics.length,
                      (index) => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            top: Borders.primaryGreyBorderSide,
                          ),
                        ),
                        child: RadioListTile(
                          key: Key('$index'),
                          dense: true,
                          selected: index == 0,
                          value: index,
                          groupValue: programIndex,
                          title: AppWidgets.getText(
                            Data.epamClinics[index].title,
                            fontColor: Colors.black,
                            fontSize: Dimens.TEXT_SIZE_14,
                          ),
                          onChanged: (value) {
                            setState(() {
                              programIndex = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: AppColors.grey500,
                    ),
                    child: TextField(
                      cursorColor: AppColors.green,
                      controller: clinicController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.grey500,
                          size: 28,
                        ),
                        isDense: true,
                        focusedBorder: AppWidgets.textFieldBorder,
                        enabledBorder: AppWidgets.textFieldBorder,
                        hintText: 'Поиск медцентра ...',
                      ),
                      keyboardType: TextInputType.text,
                      onTap: null,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: AppWidgets.getText(
                      '${Data.clinics.length} медцентров',
                      left: 24,
                      bottom: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Icon(
                      Icons.bookmark_border,
                      color: Colors.black54,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Transform.rotate(
                      angle: 3.14 / 2,
                      child: Icon(
                        SimpleLineIcons.equalizer,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Icon(
                      Icons.sort,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              ..._getClinics(Data.clinics),
            ],
          ),
        ),
      ),
    );
  }

  List<ClinicItem> _getClinics(List<Clinic> list) => List.generate(
        list.length,
        (index) => ClinicItem(list[index]),
      );
}
