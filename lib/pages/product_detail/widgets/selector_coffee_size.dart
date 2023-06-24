import 'package:flutter/material.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/pages/product_detail/widgets/coffee_selector.dart';

import '../../../helpers/enum_coffe_size.dart';

class SelectorCoffeeSize extends StatefulWidget {
  const SelectorCoffeeSize({
    Key? key,
    required this.onValueChanged,
  }) : super(key: key);

  final ValueChanged<CoffeeSize> onValueChanged;

  @override
  State<SelectorCoffeeSize> createState() => _ListSelectionCoffeeSizeState();
}

class _ListSelectionCoffeeSizeState extends State<SelectorCoffeeSize> {
  CoffeeSize? selectedCoffeeSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coffee size',
          style: context.textStyles.textSemiBold.copyWith(
            fontSize: 16,
            color: context.colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              CoffeeSize.values.length,
              (index) {
                final coffeSize = CoffeeSize.values.firstWhere((e) => e.index == index);
                return CoffeeSelector(
                  enumCoffeSize: coffeSize,
                  coffeeSelected: selectedCoffeeSize,
                  onPressed: (CoffeeSize value) {
                    setState(() {
                      selectedCoffeeSize = value;
                      widget.onValueChanged(value);
                    });
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
