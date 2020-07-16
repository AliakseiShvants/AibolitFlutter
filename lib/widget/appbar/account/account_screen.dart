import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/container/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AccountScreen extends StatelessWidget {
  final String _appBarTitle = 'Учетная запись';
  static String _birthDay =
      DateFormat('dd MMMM yyyy').format(Data.user1.birthDay);

  final Widget _accountHeader = Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    color: AppColors.grey200,
    child: Row(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(Data.user1.avatar),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${Data.user1.lastName} ${Data.user1.firstName} ${Data.user1.middleName}',
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
      appBar: AppWidgets.getAppBar(context, _appBarTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _accountHeader,
              GestureDetector(
                child: InfoItem('Моя семья'),
                onTap: () => Navigator.pushNamed(context, '/account/family'),
              ),
              InfoItem('Документы'),
              InfoItem(
                'Мой аккаунт',
                color: AppColors.grey200,
                fontSize: Dimens.TEXT_SIZE_12,
                isCapitalize: true,
                fontWeight: FontWeight.bold,
                isTrailing: false,
              ),
              ..._getAccountInfo(),
            InfoItem(
              'Программы',
              color: AppColors.grey200,
              fontSize: Dimens.TEXT_SIZE_12,
              isCapitalize: true,
              fontWeight: FontWeight.bold,
              isTrailing: false,
            ),
              GestureDetector(
                child: InfoItem(
                  Data.user1.program.title,
                  logo: Data.user1.program.logo,
                ),
                onTap: () => Navigator.pushNamed(context, '/account/program'),
              ),
              InfoItem(
                'Другое',
                color: AppColors.grey200,
                fontSize: Dimens.TEXT_SIZE_12,
                isCapitalize: true,
                fontWeight: FontWeight.bold,
                isTrailing: false,
              ),
              InfoItem('Напоминание о визитах'),
              InfoItem(
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
    final phone = Data.user1.phoneNumber;
    final fontSize = Dimens.TEXT_SIZE_13;
    final String phoneLine = '+${phone.substring(0, 3)} '
        '(${phone.substring(3, 5)}) '
        '${phone.substring(5, 8)}-${phone.substring(8, 10)}-${phone.substring(10)}';

    return [
      InfoItem(
        phoneLine,
        fontSize: fontSize,
        hint: 'Телефон:',
        isTrailing: false,
      ),
      InfoItem(
        Data.user1.email,
        fontSize: fontSize,
        hint: 'Личный e-mail:',
      ),
    ];
  }

  void _logout(BuildContext context) => Navigator.pop(context, true);
}
