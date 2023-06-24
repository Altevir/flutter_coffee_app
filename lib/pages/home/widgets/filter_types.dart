import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/models/filter.dart';

class FilterTypes extends StatefulWidget {
  const FilterTypes({Key? key}) : super(key: key);

  @override
  State<FilterTypes> createState() => _FilterTypesState();
}

class _FilterTypesState extends State<FilterTypes> {
  final listFilter = <Filter>[
    Filter(
      name: 'All',
      icon: 'all.svg',
    ),
    Filter(
      name: 'Cappuccino',
      icon: 'hot_coffee.svg',
    ),
    Filter(
      name: 'Espresso',
      icon: 'coffee_cup.svg',
    ),
    Filter(
      name: 'Latte',
      icon: 'cup_of_coffee.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.builder(
        itemCount: listFilter.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final filter = listFilter[index];
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: index == 1 ? context.colors.secondary : context.colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/${filter.icon}',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  filter.name,
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 12,
                    color: index == 1 ? context.colors.white : context.colors.black,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
