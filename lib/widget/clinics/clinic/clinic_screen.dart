import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/clinics/clinic/clinic_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'online_bunner.dart';

class ClinicScreen extends StatefulWidget {
  @override
  _ClinicScreenState createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  static String _appBarTitle = 'Медцентр';

  Clinic _clinic;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    _clinic = args != null ? args['clinic'] : null;

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
              OnlineBunner(),
              ClinicHeader(
                clinic: _clinic,
              )
            ],
          ),
        ),
      ),
    );
  }
}
