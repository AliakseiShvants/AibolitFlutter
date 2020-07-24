import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/clinics/clinic/clinic_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../clinics/clinic/online_bunner.dart';

class SingleItemScreen extends StatefulWidget {

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  Clinic _clinic;
  String _appBarTitle;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    _clinic = args != null ? args['clinic'] : null;
    _appBarTitle = args != null ? args['title'] : '';

    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
        actions: [
          AppWidgets.getClickableIcon(
            data: Icons.bookmark_border,
            iconColor: Colors.white,
            callback: null,
          ),
          MaterialButton(
            onPressed: null,
            child: AppWidgets.getCircleAvatar(
              radius: 16,
              asset: Data.owner.avatar,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.grey200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OnlineBunner(
                isOnline: _clinic.isOnline,
              ),
              ClinicHeader(
                clinic: _clinic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
