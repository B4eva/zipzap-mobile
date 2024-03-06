import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zipzap/src/app_colors.dart';
import 'package:zipzap/src/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductBox extends StatelessWidget {
  final void Function(BuildContext)? onEditPress;
  final void Function(BuildContext)? onWhatsappPress;

  final Product? product;
  const ProductBox(
      {super.key, this.product, this.onEditPress, this.onWhatsappPress});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          // Delete option
          SlidableAction(
            onPressed: onWhatsappPress,
            icon: FontAwesomeIcons.whatsapp,
            backgroundColor: const Color.fromARGB(255, 98, 188, 101),
          ),
          SlidableAction(
            onPressed: onEditPress,
            icon: FontAwesomeIcons.phone,
            backgroundColor: AppColors.grey,
          )
        ],
      ),
      child: ListTile(
        leading: const Icon(
          Icons.cases,
          size: 60,
          color: Colors.grey,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsWidget(
              product: product,
            ),

            //   type: 'Momo Number',
            //   details: product!.phoneNumber.toString(),
            // ),
          ],
        ),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  final Product? product;

  DetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product?.name ?? '',
          maxLines: 20,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          product?.description ?? '',
          maxLines: 20,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        Text(
          product?.amount ?? '',
          maxLines: 20,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          product?.vendorName ?? '',
          maxLines: 20,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
