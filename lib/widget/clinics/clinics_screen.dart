import 'package:AibolitFlutter/entity/clinic.dart';
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
  int _programIndex = 0;
  List<Clinic> _clinics = Data.clinics;
  List<Clinic> _bookmarkClinics = Data.clinicBookmarks;
  List<String> _sortParameters = [
    "По количеству докторов",
    "По названию медцентра",
    "По количеству отзывов",
  ];
  List<String> _clinicTypes = [
    "Любой медцентр",
    "Медцентры программы",
  ];

  bool _isBookmarkEnabled = false;
  IconData _bookmarkIconData = Icons.bookmark_border;

  var clinicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final list = _isBookmarkEnabled ? _bookmarkClinics : _clinics;
    final iconData =
        _isBookmarkEnabled ? Icons.bookmark : Icons.bookmark_border;

    return Container(
      height: double.infinity,
      color: AppColors.grey100,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        dense: true,
                        leading: Image(
                          image: AppWidgets.programLogo,
                        ),
                        title: Text(
                          Data.epamPrograms[_programIndex].program,
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
                      builder: (context) => _getProgramModal(
                        context: context,
                        title: 'Программа для отображения',
                        list: Data.epamClinics,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  right: 12,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: AppWidgets.getText(
                              _getPluralClinicsCount(list.length),
                              left: 8,
                              isUpperCase: true,
                              fontSize: Dimens.TEXT_SIZE_10,
                            ),
                          ),
                          _getClickableIcon(
                            data: iconData,
                            callback: _reverseBookmark,
                            iconColor: _isBookmarkEnabled
                                ? AppColors.PRIMARY_COLOR
                                : Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: GestureDetector(
                              onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => _getStringActionsModal(
                                  context: context,
                                  title: 'Тип медцентра',
                                  list: _clinicTypes,
                                  isClose: true,
                                ),
                              ),
                              child: Transform.rotate(
                                angle: 3.14 / 2,
                                child: Icon(
                                  SimpleLineIcons.equalizer,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          _getClickableIcon(
                            data: Icons.sort,
                            callback: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => _getStringActionsModal(
                                context: context,
                                title: 'Сортировать список медцентров',
                                list: _sortParameters,
                                isClose: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (list.length == 0)
                      Column(
                        children: <Widget>[
                          Image(
                            width: 240,
                            height: 120,
                            image: AssetImage('assets/img/clinic/clinic_stub.jpg'),
                          ),
                          AppWidgets.getText(
                            'У вас в закладках пока нет медцентров',
                            top: 32,
                            bottom: 16,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimens.TEXT_SIZE_13,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                              child: AppWidgets.getText(
                                'Добавляйте в закладки медцентры, которые вам понравились. Так их всегда будет легко найти.',
                                left: 0,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontColor: AppColors.primaryGrey,
                                fontSize: Dimens.TEXT_SIZE_11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ..._getClinics(list),
                  ],
                ),
              ),
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

  Widget _getClickableIcon({
    IconData data,
    Function callback,
    Color iconColor = Colors.black54,
  }) =>
      GestureDetector(
        child: Icon(
          data,
          color: iconColor,
        ),
        onTap: callback,
      );

  void _reverseBookmark() {
    setState(() {
      _isBookmarkEnabled = !_isBookmarkEnabled;
    });
  }

  String _getPluralClinicsCount(int count) {
    String result;

    if (count == 0) {
      result = 'нет медцентров';
    } else if (count == 1) {
      result = '$count медцентр';
    } else if (count > 4) {
      result = '$count медцентров';
    } else {
      result = '$count медцентра';
    }

    return result;
  }

  Widget _getProgramModal({
    @required BuildContext context,
    @required String title,
    @required List<Clinic> list,
  }) =>
      AppWidgets.getModalBody(
        context: context,
        title: title,
        actions: List.generate(
          list.length,
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
              groupValue: _programIndex,
              title: AppWidgets.getText(
                list[index].title,
                fontColor: Colors.black,
                fontSize: Dimens.TEXT_SIZE_14,
              ),
              onChanged: (value) {
                setState(() {
                  _programIndex = value;
                });
              },
            ),
          ),
        ),
      );

  Widget _getStringActionsModal({
    @required BuildContext context,
    @required String title,
    @required List<String> list,
    bool isClose,
  }) =>
      AppWidgets.getModalBody(
        context: context,
        title: title,
        isClose: isClose,
        actions: List.generate(
          list.length,
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
              groupValue: _programIndex,
              title: AppWidgets.getText(
                list[index],
                fontColor: Colors.black,
                fontSize: Dimens.TEXT_SIZE_14,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      );


}
