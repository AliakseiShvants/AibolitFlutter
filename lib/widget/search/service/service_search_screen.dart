import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/util/info_item.dart';
import 'package:AibolitFlutter/widget/util/program_modal.dart';
import 'package:AibolitFlutter/widget/util/search/search_field.dart';
import 'package:AibolitFlutter/widget/util/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceSearchScreen extends StatefulWidget {
  @override
  _ServiceSearchScreenState createState() => _ServiceSearchScreenState();
}

class _ServiceSearchScreenState extends State<ServiceSearchScreen> {
  final String _appBarTitle = 'Все услуги';
  final String _searchHint = 'Поиск услуги...';

  int _programIndex = 0;
  TextEditingController _serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.grey100,
            child: Column(
              children: [
                ProgramModal(
                  programs: Data.epamPrograms,
                  programIndex: _programIndex,
                  callback: _chooseProgram,
                ),
                SearchField(
                  hintText: _searchHint,
                  controller: _serviceController,
                ),
                SearchResult(
                  list: _getServices(Data.searchService),
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
      _programIndex = index;
    });

    Navigator.pop(context);
  }

  List<Widget> _getServices(List<String> list) => List.generate(
        list.length,
        (index) => InfoItem(
          color: AppColors.grey100,
          logo: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.PRIMARY_COLOR,
              shape: BoxShape.circle,
            ),
          ),
          title: list[index],
          fontSize: Dimens.TEXT_SIZE_14,
          isBottomBorder: true,
        ),
      );
}
