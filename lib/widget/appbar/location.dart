import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../entity/city.dart';
import '../../utils/borders.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class Location extends StatelessWidget {
  final int locationIndex;
  final List<City> cities;
  final Function locationCallback;

  Location({
    this.locationIndex,
    this.cities,
    this.locationCallback,
  });

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
                cities[locationIndex].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimens.TEXT_SIZE_15,
                ),
              ),
            ),
            iconSize: 0,
            iconEnabledColor: AppColors.PRIMARY_COLOR,
            onChanged: (value) => locationCallback(cities.indexOf(value)),
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

  List<DropdownMenuItem<City>> _getLocations() {
    return cities.map((City city) {
      return DropdownMenuItem<City>(
        value: city,
        child: Text(
          city.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimens.TEXT_SIZE_16,
          ),
        ),
      );
    }).toList();
  }
}
