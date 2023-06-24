import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/app/styles/app_text_styles.dart';
import 'package:flutter_coffee_app/helpers/enum_coffe_size.dart';
import 'package:flutter_coffee_app/helpers/size_extensions.dart';
import 'package:flutter_coffee_app/pages/product_detail/widgets/selector_coffee_size.dart';

import '../../models/coffee.dart';

typedef CoffeSizeSelected = CoffeeSize Function(CoffeeSize);

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: context.screenWidth,
                height: context.percentHeight(0.50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage('assets/images/${widget.coffee.image}'),
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: context.screenWidth,
                      height: 153,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.coffee.title.replaceAll(' ', '\n'),
                                      style: context.textStyles.textSemiBold.copyWith(
                                        fontSize: 20,
                                        color: context.colors.white,
                                        height: 1,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.coffee.subtitle,
                                      style: context.textStyles.textSemiBold.copyWith(
                                        fontSize: 14,
                                        color: context.colors.white.withOpacity(0.6),
                                        height: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: context.colors.primary,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 12),
                                        RichText(
                                          text: TextSpan(
                                              text: '4.8',
                                              style: context.textStyles.textSemiBold.copyWith(
                                                fontSize: 12,
                                                color: context.colors.white,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: ' (2539)',
                                                  style: context.textStyles.textSemiBold.copyWith(
                                                    fontSize: 12,
                                                    color: context.colors.white.withOpacity(0.6),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: context.percentWidth(0.36),
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: context.colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/ic_coffee_drop.svg',
                                            fit: BoxFit.scaleDown,
                                            width: 16,
                                            height: 16,
                                            colorFilter: ColorFilter.mode(
                                              context.colors.primary,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '2x Chocolate',
                                            style: context.textStyles.textRegular.copyWith(
                                              fontSize: 12,
                                              color: context.colors.white,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: context.percentWidth(0.36),
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: context.colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/ic_fire.svg',
                                            fit: BoxFit.scaleDown,
                                            width: 16,
                                            height: 16,
                                            colorFilter: ColorFilter.mode(
                                              context.colors.primary,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Light Roasted',
                                            style: context.textStyles.textRegular.copyWith(
                                              fontSize: 12,
                                              color: context.colors.white,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Description',
                style: context.textStyles.textSemiBold.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'A cappuccino is a  coffee-based drink made primarily from espresso and milk... ',
                  style: context.textStyles.textMedium.copyWith(
                    fontSize: 14,
                    color: context.colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Read More',
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 14,
                        color: context.colors.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SelectorCoffeeSize(
                onValueChanged: (value) {
                  log(value.key);
                },
              ),
              SizedBox(height: context.percentHeight(0.04)),
              Container(
                padding: const EdgeInsets.only(top: 14, bottom: 14),
                height: 52,
                decoration: BoxDecoration(
                  color: context.colors.secondary,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        'Buy Now',
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 22,
                          color: context.colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    VerticalDivider(
                      width: 1,
                      color: context.colors.white,
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(width: 24),
                    FittedBox(
                      child: Text(
                        '\$ ${widget.coffee.price.toStringAsFixed(2)}',
                        style: context.textStyles.textSemiBold.copyWith(
                          fontSize: 22,
                          color: context.colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
