import 'package:flutter/material.dart';
import 'package:zipzap/src/app_colors.dart';
import 'package:zipzap/src/reusable_widgets/logo_widget.dart';

class ZipzapAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget logo;
  final String title;
  final bool isNotificiationVisible;

  const ZipzapAppBar(
      {Key? key,
      required this.logo,
      required this.title,
      this.isNotificiationVisible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: AppColors.primaryColor, // You can customize
      //  leading: logo,

      flexibleSpace: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: LogoWidget(
                      height: 80,
                      width: 80,
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        // backgroundImage: AssetImage(
                        //     'assets/profile.jpg'), // Replace with your profile image asset
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Welcome Mr Macguire',
                        style: TextStyle(color: AppColors.white, fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ]),

      // centerTitle: true,
      actions: const [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100.0);
}
