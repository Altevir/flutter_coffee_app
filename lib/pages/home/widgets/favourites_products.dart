import 'package:flutter/material.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/helpers/size_extensions.dart';
import 'package:flutter_coffee_app/pages/home/widgets/custom_button_add.dart';

import '../../../models/coffee.dart';

class FavouritesProducts extends StatefulWidget {
  const FavouritesProducts({Key? key}) : super(key: key);

  @override
  State<FavouritesProducts> createState() => _FavouritesProductsState();
}

class _FavouritesProductsState extends State<FavouritesProducts> {
  final listCoffees = <Coffee>[
    Coffee(
      id: 1,
      title: 'Expresso Macchiato',
      subtitle: 'With Extra Milk',
      price: 7.99,
      image: 'coffee3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favourites',
          style: context.textStyles.textSemiBold.copyWith(
            fontSize: 16,
            color: context.colors.black,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          itemCount: listCoffees.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final coffee = listCoffees[index];
            return Container(
              width: context.screenWidth,
              height: context.percentHeight(0.16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/${coffee.image}',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee.title,
                          style: context.textStyles.textRegular.copyWith(
                            fontSize: 16,
                            color: context.colors.black,
                          ),
                        ),
                        Text(
                          coffee.subtitle,
                          style: context.textStyles.textRegular.copyWith(
                            fontSize: 12,
                            color: context.colors.black.withOpacity(0.5),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${coffee.price.toStringAsFixed(2)}',
                              style: context.textStyles.textBold.copyWith(
                                fontSize: 20,
                                color: context.colors.black,
                              ),
                            ),
                            CustomButtonAdd(
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
