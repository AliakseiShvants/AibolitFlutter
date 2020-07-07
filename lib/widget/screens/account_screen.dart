import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/container/info_item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AccountScreen extends StatelessWidget {
  static User _user = User(
      firstName: 'Алексей',
      middleName: 'Олегович',
      lastName: 'Шванц',
      birthDay: DateTime(1991, 9, 11),
      phoneNumber: '375295786646',
      email: 'ashvants91@gmail.com',
      programs: [Program('assets/img/epam_logo.png', 'EPAM Health Care')]);

  static String _birthDay = DateFormat('dd MMMM yyyy').format(_user.birthDay);

  final Widget _accountHeader = Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    color: AppColors.grey200,
    child: Row(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/img/family.jpg'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${_user.lastName} ${_user.firstName} ${_user.middleName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.TEXT_SIZE_14,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '$_birthDay',
                  style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Учетная запись'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _accountHeader,
              InfoItemContainer('Моя семья'),
              InfoItemContainer('Документы'),
              InfoItemContainer(
                'Мой аккаунт',
                color: AppColors.grey200,
                fontSize: Dimens.TEXT_SIZE_12,
                isCapitalize: true,
                fontWeight: FontWeight.bold,
                isTrailing: false,
              ),
              ..._getAccountInfo(),
              InfoItemContainer(
                'Программы',
                color: AppColors.grey200,
                fontSize: Dimens.TEXT_SIZE_12,
                isCapitalize: true,
                fontWeight: FontWeight.bold,
                isTrailing: false,
              ),
              ..._getPrograms(),
              InfoItemContainer(
                'Другое',
                color: AppColors.grey200,
                fontSize: Dimens.TEXT_SIZE_12,
                isCapitalize: true,
                fontWeight: FontWeight.bold,
                isTrailing: false,
              ),
              InfoItemContainer('Напоминание о визитах'),
              InfoItemContainer(
                'Выйти',
                textColor: Colors.red.shade800,
                callback: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getAccountInfo() {
    final phone = _user.phoneNumber;
    final fontSize = Dimens.TEXT_SIZE_13;
    final String phoneLine = '+${phone.substring(0, 3)} '
        '(${phone.substring(3, 5)}) '
        '${phone.substring(5, 8)}-${phone.substring(8, 10)}-${phone.substring(10)}';

    return [
      InfoItemContainer(
        phoneLine,
        fontSize: fontSize,
        hint: 'Телефон:',
        isTrailing: false,
      ),
      InfoItemContainer(
        _user.email,
        fontSize: fontSize,
        hint: 'Личный e-mail:',
      ),
    ];
  }

  List<Widget> _getPrograms() {
    return List.generate(_user.programs.length, (index) {
      var program = _user.programs[index];

      return InfoItemContainer(
        program.title,
        logo: program.logo,
      );
    });
  }

  void _logout(BuildContext context) => Navigator.pop(context, true);
}
