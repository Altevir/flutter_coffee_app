import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/helpers/enum_coffe_size.dart';
import 'package:flutter_coffee_app/helpers/size_extensions.dart';

class CoffeeSelector extends StatelessWidget {
  const CoffeeSelector({
    super.key,
    required this.enumCoffeSize,
    this.coffeeSelected,
    required this.onPressed,
  });

  final CoffeeSize enumCoffeSize;
  final CoffeeSize? coffeeSelected;
  final ValueChanged<CoffeeSize> onPressed;

  @override
  Widget build(BuildContext context) {
    final isSelected = coffeeSelected == enumCoffeSize;
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onTap: () => onPressed(enumCoffeSize),
      child: Container(
        padding: const EdgeInsets.all(14),
        width: context.percentWidth(.24),
        height: context.percentHeight(.10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? context.colors.primary.withOpacity(0.05) : context.colors.white,
          border: Border.all(
            color: isSelected ? context.colors.primary : Colors.grey,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_coffee_cup.svg',
              fit: BoxFit.cover,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? context.colors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            FittedBox(
              child: Text(
                enumCoffeSize.key,
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 10,
                  color: context.colors.black,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
