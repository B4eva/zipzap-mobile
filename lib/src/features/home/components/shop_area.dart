import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zipzap/src/app_colors.dart';
import 'package:zipzap/src/models/product.dart';
import 'package:zipzap/src/reusable_widgets/buy_sell_widget.dart';
import 'package:zipzap/src/reusable_widgets/product_box.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selecctedIndex = 0;

  List<Widget> homeScreens = [
    BuySection(),
    const SellSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              // flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BuySellWidget(
                          tap: () {
                            setState(() {
                              selecctedIndex = 0;
                            });
                          },
                          title: 'BUY',
                          titleColor: AppColors.white,
                          boxColor: AppColors.black,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: BuySellWidget(
                          boxColor: Colors.grey,
                          title: 'SELL',
                          titleColor: AppColors.black,
                          tap: () {
                            setState(() {
                              selecctedIndex = 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 4,
                            color: selecctedIndex == 0
                                ? AppColors.green
                                : Colors.white),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 4,
                            color: selecctedIndex == 1
                                ? AppColors.green
                                : Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: SizedBox(
                // height: double.infinity,
                child: IndexedStack(
                  index: selecctedIndex,
                  children: homeScreens,
                ),
              ),
            )
          ],
        ));
  }
}

class BuySection extends StatefulWidget {
  const BuySection({
    super.key,
  });

  @override
  State<BuySection> createState() => _BuySectionState();
}

class _BuySectionState extends State<BuySection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
          itemCount: ProductsList.length,
          separatorBuilder: (context, index) {
            return const Divider(
              endIndent: 10,
              indent: 10,
            );
          },
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ProductBox(
                product: ProductsList[index],
                onWhatsappPress: (p0) {
                  _launchWhatsApp(ProductsList[index]);
                },
                onEditPress: (p0) {
                  _makePhoneCall(ProductsList[index].phoneNumber.toString());
                },
              ),
            );
          })),
    );
  }

  void _launchWhatsApp(Product product) async {
    // String phoneNumber =
    //     "677444670"; // Replace with the phone number you want to chat with
    // String message =
    //     "Hello!"; // Replace with the initial message you want to send

    String url =
        "https://wa.me/${product.phoneNumber}/?text=${Uri.parse(product.description!)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SellSection extends StatelessWidget {
  const SellSection({
    super.key,
  });

  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'ZIPZAP',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
