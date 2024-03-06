import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zipzap/main.dart';
import 'package:zipzap/src/app_colors.dart';
import 'package:zipzap/src/features/home/components/shop_area.dart';
import 'package:zipzap/src/models/product.dart';
import 'package:zipzap/src/reusable_widgets/logo_widget.dart';
import 'package:zipzap/src/reusable_widgets/zap_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottonNavIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _bottonNavIndex = index;
    });
  }

  Widget _bottomWidget(index) {
    switch (index) {
      case 0:
        return Shop();

      case 1:
        return Container(
          color: Colors.blue,
        );
      case 2:
        return Container(
          color: Colors.green,
        );
      case 3:
        return Container(
          color: Colors.yellow,
        );

      default:
        return Container(
          color: Colors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZipzapAppBar(
        logo: LogoWidget(),
        title: 'HomePage',
        isNotificiationVisible: true,
      ),
      body: _bottomWidget(_bottonNavIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        height: 100,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_rounded,
                size: 50,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_shipping,
                size: 50,
              ),
              label: 'Shipping',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 50,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 50,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _bottonNavIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: AppColors.primaryColor,
          onTap: _onItemTapped,
          elevation: 2,
          backgroundColor: AppColors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
