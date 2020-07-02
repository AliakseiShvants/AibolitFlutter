import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../entity/city.dart';
import '../../utils/borders.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int _locationIndex = 0;
  final List<City> _cities = [
    City(1, 'Брест'),
    City(2, 'Витебск'),
    City(3, 'Гомель'),
    City(4, 'Гродно'),
    City(5, 'Минск'),
    City(6, 'Могилев'),
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
      children: <Widget>[
        Icon(
          Entypo.location_pin,
          color: Colors.white,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<City>(
            items: _getLocations(),
            hint: Container(
              padding: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                border: Border(
                  bottom: Borders.whiteBorderSide,
                ),
              ),
              child: Text(
                _cities[_locationIndex].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimens.TEXT_SIZE_SM,
                ),
              ),
            ),
            iconSize: 0,
            iconEnabledColor: AppColors.PRIMARY_COLOR,
            onChanged: (value) => _setLocation(_cities.indexOf(value)),
          ),
        ),
        Expanded(
          child: const Center(
            child: const Text(
              Strings.APP_NAME,
              style: TextStyle(fontSize: Dimens.TEXT_SIZE_APP_BAR),
            ),
          ),
        )
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
}
