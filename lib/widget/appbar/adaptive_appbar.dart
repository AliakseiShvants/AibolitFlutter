import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

import '../../utils/strings.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isLoggedIn;
  final Function loginCallback;

  AdaptiveAppBar(
      {Key key,
      @required this.height,
      @required this.isLoggedIn,
      @required this.loginCallback})
      : super(key: key);

//  @override
//  _AdaptiveAppBarState createState() => _AdaptiveAppBarState();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            GestureDetector(
              child: Column(
                children: <Widget>[],
              ),
              onTap: () => showMaterialSelectionPicker(
                context: context,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      title: const Text(Strings.APP_NAME),
      actions: [
        if (isLoggedIn)
          MaterialButton(
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            onPressed: loginCallback,
          ),
        if (!isLoggedIn)
          MaterialButton(
//            padding: EdgeInsets.all(0),
            child: Text(
              'Log in',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: loginCallback,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

//class _AdaptiveAppBarState extends State<AdaptiveAppBar> {
////  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
//  List<Widget> _actionsList;
//  bool _isLoggedIn;
//
//  void _login() {
//    setState(() {
//      _isLoggedIn = !_isLoggedIn;
//      _getActions();
//    });
//  }
//
//  void _getActions() {
//    if (_isLoggedIn) {
//      _actionsList = [
//        GestureDetector(
//          child: CircleAvatar(
//            radius: 16,
//            backgroundColor: Colors.white,
//          ),
//          onTap: _login,
//        ),
//        SizedBox(width: 24),
//      ];
//    } else {
//      _actionsList = [
//        MaterialButton(child: Text('Log in'), onPressed: _login),
//        SizedBox(width: 24),
//      ];
//    }
//  }
//
//  @override
//  void initState() {
//    super.initState();
//
//    _isLoggedIn = false;
//    _getActions();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AppBar(
//      leading: Padding(
//        padding: const EdgeInsets.only(left: 8),
//        child: Row(
//          children: <Widget>[
//            Icon(
//              Icons.location_on,
//              color: Colors.white,
//            ),
//            GestureDetector(
//              child: Column(
//                children: <Widget>[],
//              ),
//              onTap: () => showMaterialSelectionPicker(
//                context: context,
//              ),
//            ),
//          ],
//        ),
//      ),
//      centerTitle: true,
//      title: const Text(Strings.APP_NAME),
//      actions: _actionsList,
//    );
//  }
//}
