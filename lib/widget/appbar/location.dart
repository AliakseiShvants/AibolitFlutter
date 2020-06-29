import 'package:AibolitFlutter/utils/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../entity/city.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class Location extends StatelessWidget {
  final List _cities = [
    City(1, 'Brest'),
    City(2, 'Vitebsk'),
    City(3, 'Gomel'),
    City(4, 'Grodno'),
    City(5, 'Minsk'),
    City(6, 'Mogilev'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: Borders.whiteBorderSide,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                Strings.CITY,
                style: const TextStyle(fontSize: Dimens.TEXT_SIZE_M),
              ),
            ),
          ),
          onTap: () {
            _showLocations(context);
          },
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

  List<Widget> _getCities() {
    return List.generate(_cities.length, (index) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            top: index == 0 ? Borders.greyBorderSide : Borders.whiteBorderSide,
            bottom: Borders.greyBorderSide,
          ),
        ),
        child: ListTile(
          dense: true,
          leading: Radio(
            activeColor: Colors.blueAccent,
          ),
          title: Text(
            _cities[index].title,
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimens.TEXT_SIZE_M,
            ),
          ),
        ),
      );
    });
  }

  List<Widget> _getDialogContent(BuildContext context) {
    List<Widget> cities = _getCities();
    cities.add(
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: Dimens.DOUBLE_PADDING),
          child: Center(
            child: Text(
              Strings.CLOSE,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Dimens.TEXT_SIZE_L,
              ),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      ),
    );

    return cities;
  }

  void _showLocations(BuildContext context) {
    final SimpleDialog dialog = SimpleDialog(
      title: Center(
        child: Text(
          Strings.CHOOSE_LOCATION,
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimens.TEXT_SIZE_M,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      children: _getDialogContent(context),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
