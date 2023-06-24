import 'package:flutter/material.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/helpers/size_extensions.dart';
import 'package:flutter_coffee_app/pages/home/widgets/custom_button_add.dart';
import 'package:flutter_coffee_app/pages/product_detail/product_detail_page.dart';

import '../../../models/coffee.dart';

class CarouselProducts extends StatefulWidget {
  const CarouselProducts({Key? key}) : super(key: key);

  @override
  State<CarouselProducts> createState() => _CarouselProductsState();
}

class _CarouselProductsState extends State<CarouselProducts> {
  final listCoffees = <Coffee>[
    Coffee(
      id: 1,
      title: 'Cappuccino',
      subtitle: 'With Oat Milk',
      price: 8.99,
      image: 'coffee1.png',
    ),
    Coffee(
      id: 2,
      title: 'Cappuccino',
      subtitle: 'Dark Roast',
      price: 10.99,
      image: 'coffee2.png',
    ),
    Coffee(
      id: 3,
      title: 'Espresso Macchiato',
      subtitle: 'With Extra Milk',
      price: 12.99,
      image: 'coffee3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight(0.25),
      child: ListView.builder(
        itemCount: listCoffees.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final coffee = listCoffees[index];
          return Container(
            clipBehavior: Clip.hardEdge,
            width: 180,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/${coffee.image}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(0.5),
                        const Color(0xff333333).withOpacity(0.005),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, bottom: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffee.title,
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 16,
                          color: context.colors.white,
                        ),
                      ),
                      Text(
                        coffee.subtitle,
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 12,
                          color: context.colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${coffee.price.toStringAsFixed(2)}',
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 14,
                          color: context.colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 13),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButtonAdd(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(
                              coffee: coffee,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.black.withOpacity(0.30),
                      ),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: context.colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
