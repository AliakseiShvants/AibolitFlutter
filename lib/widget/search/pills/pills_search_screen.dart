import 'package:AibolitFlutter/entity/network/drug_autocomplete.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/converter.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/network.dart';
import 'package:AibolitFlutter/widget/search/pills/pill_error.dart';
import 'package:AibolitFlutter/widget/search/pills/pill_search.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillsSearchScreen extends StatefulWidget {
  @override
  _PillsSearchScreenState createState() => _PillsSearchScreenState();
}

class _PillsSearchScreenState extends State<PillsSearchScreen> {
  final _drugController = TextEditingController();

  String _searchLine;
  List<DrugAutocomplete> _searchHistory = Data.drugSearchHistory;
  List<DrugAutocomplete> _searchResult = [];
  List<Widget> drugWidgetList = [];
  bool _isLoggedIn;

  @override
  void initState() {
    super.initState();

    _drugController.addListener(_updateSearchLine);
  }

  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);
    _isLoggedIn = widget.isLoggedIn;

    return Container(
      color: AppColors.grey100,
      child: Column(
        children: <Widget>[
          AppWidgets.getInputField(
            context: context,
            borderColor: AppColors.grey400,
            top: 12,
            right: 12,
            bottom: 12,
            left: 12,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey500,
              size: 28,
            ),
            hint: 'Поиск (по полному названию)...',
            controller: _drugController,
            isSuffixIcon: true,
//            onChangedCallback: _updateSearchLine
          ),
          Expanded(
            child: _searchLine != null && _searchLine.length > 2
                ? FutureBuilder<List<DrugAutocomplete>>(
                    future: _getResult(),
                    builder: (context, snapshot) {
                      List<DrugAutocomplete> list;

                      if (snapshot.hasError) {
                        return PillError();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        list = snapshot.data;
                      }

                      return PillSearch(
                        isLoggedIn: _isLoggedIn,
                        list: list,
                      );
                    },
                  )
                : PillSearch(
                    isLoggedIn: _isLoggedIn,
                  ),
          ),
        ],
      ),
    );
  }

  Future<List<DrugAutocomplete>> _getResult() async {
    final response = await Network.getDrugsAutocomplete(_drugController.text);
    final list = Converter.getDrugAutocomplete(response);

    return list;
  }

  void _updateSearchLine(/*String value*/) {
    final text = _drugController.text;

    if (text.length > 2 && !StringUtils.equalsIgnoreCase(_searchLine, text)) {
      setState(() {
        _searchLine = text;
      });
    }
  }
}
