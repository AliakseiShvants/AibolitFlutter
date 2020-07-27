import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/util/single_item_screen.dart';
import 'package:flutter/material.dart';

class ClinicItemScreen extends StatefulWidget {
  @override
  _ClinicItemScreenState createState() => _ClinicItemScreenState();
}

class _ClinicItemScreenState extends State<ClinicItemScreen> {
  Clinic _clinic;

  bool _isBookmarked;
  String _appBarTitle;
  IconData _iconData;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    _clinic = args != null ? args['clinic'] : null;
    _appBarTitle = args != null ? args['title'] : '';
    _isBookmarked = Data.clinicBookmarks.contains(_clinic);
    _iconData = _isBookmarked ? Icons.bookmark : Icons.bookmark_border;

    return SingleItemScreen(
      appBarTitle: _appBarTitle,
      iconData: _iconData,
      iconCallback: _pushBookmark,
    );
  }

  void _pushBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    if (_isBookmarked && !Data.clinicBookmarks.contains(_clinic)) {
      Data.clinicBookmarks.add(_clinic);
    } else if (!_isBookmarked && Data.clinicBookmarks.contains(_clinic)) {
      final index = Data.clinicBookmarks.indexOf(_clinic);
      Data.clinicBookmarks.removeAt(index);
    }
  }
}
