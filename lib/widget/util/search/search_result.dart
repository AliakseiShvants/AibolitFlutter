import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/widgets.dart';

class SearchResult extends StatelessWidget {
  final List<Widget> list;

  const SearchResult({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: <Widget>[
          if (list.length == 0)
            Column(
              children: <Widget>[
                Image(
                  width: 240,
                  height: 120,
                  image: AssetImage('assets/img/clinic/clinic_stub.jpg'),
                ),
                AppWidgets.getText(
                  title: 'У вас в закладках пока нет медцентров',
                  top: 32,
                  bottom: 16,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.TEXT_SIZE_13,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: AppWidgets.getText(
                      title: 'Добавляйте в закладки медцентры, которые вам понравились. Так их всегда будет легко найти.',
                      left: 0,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      fontColor: AppColors.primaryGrey,
                      fontSize: Dimens.TEXT_SIZE_11,
                    ),
                  ),
                ),
              ],
            ),
          ...list,
        ],
      ),
    );
  }
}
