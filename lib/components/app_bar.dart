import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yatak_kapasite_analizi/constants/color_constant.dart';
import 'package:yatak_kapasite_analizi/views/login/login_view.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isLeading;
  final BuildContext widgetContext;

  CustomAppBar({
    Key? key,
    required this.widgetContext,
    required this.isLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Color.fromARGB(255, 129, 210, 180),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (prefs.containsKey("token")) {
                prefs.remove("token");
              }
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginView();
                  },
                ),
                (route) => false,
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.logout,
                size: 29,
              ),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        MediaQuery.of(widgetContext).size.height * 0.06,
      );
}
