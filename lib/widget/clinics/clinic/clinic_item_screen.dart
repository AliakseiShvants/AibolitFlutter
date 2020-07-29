import 'package:AibolitFlutter/entity/action.dart';
import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/util/info_item.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:AibolitFlutter/widget/util/singleitem/single_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class ClinicItemScreen extends StatefulWidget {
  @override
  _ClinicItemScreenState createState() => _ClinicItemScreenState();
}

class _ClinicItemScreenState extends State<ClinicItemScreen> {
  final List<ActionItem> clinicActions = [
    ActionItem(
      title: 'Информация о медцентре',
    ),
    ActionItem(
      title: 'Услуги медцентра',
    ),
    ActionItem(
      title: 'Специалисты медцентра',
    ),
    ActionItem(
      title: 'Отзывы о медцентре',
    ),
  ];

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
      isOnline: _clinic.isOnline,
      isBanner: true,
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
      timeTitle: 'время работы',
      timeInfo: '8:00 - 20:00',
      feedbackTitle: 'отзывы',
      feedbackInfo: 'Нет отзывов',
      actions: _getClinicActions(list: clinicActions),
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

  List<Widget> _getClinicActions({
    List<ActionItem> list,
  }) =>
      List.generate(
        list.length,
        (index) => InfoItem(
          title: list[index].title,
        ),
      );
}
