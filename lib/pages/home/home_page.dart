import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/helpers/size_extensions.dart';
import 'package:flutter_coffee_app/pages/home/widgets/carousel_products.dart';
import 'package:flutter_coffee_app/pages/home/widgets/filter_types.dart';

import 'widgets/favourites_products.dart';
import 'widgets/recent_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 24,
            bottom: context.screenHeight * 0.12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/user.png'),
                    child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          log('evento onTap');
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pin.svg',
                        colorFilter: ColorFilter.mode(
                          context.colors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 6),
                      RichText(
                        text: TextSpan(
                          text: 'Tijuana, ',
                          style: context.textStyles.textBold.copyWith(
                            fontSize: 14,
                            color: context.colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Mexico',
                              style: context.textStyles.textRegular.copyWith(
                                fontSize: 14,
                                color: context.colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    width: 21,
                    height: 21,
                    colorFilter: ColorFilter.mode(
                      context.colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Good morning, Isabella',
                style: context.textStyles.textSemiBold.copyWith(
                  fontSize: 18,
                  color: context.colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: context.colors.greyF0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        context.colors.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Find your coffee',
                          hintStyle: context.textStyles.textRegular.copyWith(
                            fontSize: 14,
                            color: context.colors.secondary.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          isDense: true,
                          isCollapsed: true,
                        ),
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 14,
                          color: context.colors.secondary,
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.white,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/settings.svg',
                        fit: BoxFit.scaleDown,
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(context.colors.secondary, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const FilterTypes(),
              const SizedBox(height: 24),
              const CarouselProducts(),
              const SizedBox(height: 24),
              const RecentProducts(),
              const SizedBox(height: 24),
              const FavouritesProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
