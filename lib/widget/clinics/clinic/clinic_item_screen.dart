import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/util/single_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

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
      isClinic: true,
      isClinicOnline: _clinic.isOnline,
      avatar: _clinic.logo,
      programOpacity: Util.getLogoOpacityByClinic(_clinic),
      itemTitle: _clinic.title,
      location: '${_clinic.town}, ${_clinic.address}',
      link: "Посмотреть на карте",
      buttonTitle: _clinic.isOnline ? 'выбрать врача' : 'записаться в медцентр',
      buttonCallback: () {
        if (_clinic.isOnline) {
          Navigator.pushNamed(context, '/search/doctor');
        } else {
          Navigator.pushNamed(context, '/book');
        }
      },
      coords: Coords(
        double.tryParse(_clinic.x),
        double.tryParse(_clinic.y),
      ),
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
