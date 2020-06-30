import 'package:AibolitFlutter/utils/app_colors.dart';

import '../../utils/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../entity/city.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int _locationIndex;
  final List<City> _cities = [
    City(1, 'Brest'),
    City(2, 'Vitebsk'),
    City(3, 'Gomel'),
    City(4, 'Grodno'),
    City(5, 'Minsk'),
    City(6, 'Mogilev'),
  ];

  @override
  void initState() {
    _initLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Entypo.location_pin,
          color: Colors.white,
        ),
        DropdownButton<City>(
          items: _getLocations(),
//          value: _cities[_locationIndex],
          hint: Text(
            _cities[_locationIndex].title,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimens.TEXT_SIZE_SM,
            ),
          ),
          underline: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: Borders.whiteBorderSide,
              ),
            ),
          ),
          iconSize: 0,
          iconEnabledColor: AppColors.PRIMARY_COLOR,
          onChanged: (value) => _setLocation(_cities.indexOf(value)),
//              padding: const EdgeInsets.all(2.0),
//              child: Text(
//                Strings.CITY,
//                style: const TextStyle(fontSize: Dimens.TEXT_SIZE_M),
//              ),
        ),
        Expanded(
            child: const Center(
                child: const Text(
          Strings.APP_NAME,
          style: TextStyle(fontSize: Dimens.TEXT_SIZE_APP_BAR),
        )))
      ],
    );
  }

  void _initLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _locationIndex = prefs.getInt(Strings.LOCATION_INDEX) ?? 0;
  }

  void _setLocation(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Strings.LOCATION_INDEX, index);

    setState(() {
      _locationIndex = index;
    });
  }

  List<DropdownMenuItem<City>> _getLocations() {
    return _cities.map((City city) {
      return DropdownMenuItem<City>(
        value: city,
        child: Text(
          city.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimens.TEXT_SIZE_M,
          ),
        ),
      );
    }).toList();
  }

//  List<Widget> _getCities() {
//    return List.generate(_cities.length, (index) {
//      return Container(
//        decoration: BoxDecoration(
//          border: Border(
//            top: index == 0 ? Borders.greyBorderSide : Borders.whiteBorderSide,
//            bottom: Borders.greyBorderSide,
//          ),
//        ),
//        child: ListTile(
//          dense: true,
//          leading: Radio(
//            activeColor: Colors.blueAccent,
//          ),
//          title: Text(
//            _cities[index].title,
//            style: TextStyle(
//              color: Colors.black,
//              fontSize: Dimens.TEXT_SIZE_M,
//            ),
//          ),
//        ),
//      );
//    });
//  }

//  List<Widget> _getDialogContent(BuildContext context) {
//    List<Widget> cities = _getCities();
//    cities.add(
//      GestureDetector(
//        child: Padding(
//          padding: const EdgeInsets.only(top: Dimens.DOUBLE_PADDING),
//          child: Center(
//            child: Text(
//              Strings.CLOSE,
//              style: TextStyle(
//                color: Colors.blueAccent,
//                fontSize: Dimens.TEXT_SIZE_L,
//              ),
//            ),
//          ),
//        ),
//        onTap: () => Navigator.of(context).pop(),
//      ),
//    );
//
//    return cities;
//  }

//  void _showLocations(BuildContext context) {
//    final SimpleDialog dialog = SimpleDialog(
//      title: Center(
//        child: Text(
//          Strings.CHOOSE_LOCATION,
//          style: TextStyle(
//            color: Colors.black,
//            fontSize: Dimens.TEXT_SIZE_M,
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//      ),
//      children: _getDialogContent(context),
//    );
//
//    showDialog(
//      context: context,
//      barrierDismissible: false,
//      builder: (BuildContext context) {
//        return dialog;
//      },
//    );
//  }
}
