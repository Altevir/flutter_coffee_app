import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/helpers/size_extensions.dart';
import 'package:flutter_coffee_app/pages/cart_page.dart';
import 'package:flutter_coffee_app/pages/favorite_page.dart';
import 'package:flutter_coffee_app/pages/profile_page.dart';

import '../constants/app_icons.dart';
import '../models/menu_item.dart';

import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<MenuItem> listMenus = [
    MenuItem(title: 'Home', icon: AppIcons.home),
    MenuItem(title: 'Favourite', icon: AppIcons.favorite),
    MenuItem(title: 'Cart', icon: AppIcons.cart),
    MenuItem(title: 'Profile', icon: AppIcons.profile),
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  final ValueNotifier<int> _selectedPageIndex = ValueNotifier<int>(0);
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedPageIndex.value);
  }

  @override
  void dispose() {
    _selectedPageIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.screenWidth,
              height: context.percentHeight(0.10),
              decoration: BoxDecoration(
                color: context.colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      listMenus.length,
                      (index) => InkWell(
                        child: SizedBox(
                          child: ValueListenableBuilder(
                            valueListenable: _selectedPageIndex,
                            builder: (context, indexValue, child) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset(
                                  listMenus[index].icon,
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    index == indexValue ? context.colors.primary : context.colors.secondary.withOpacity(0.3),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  listMenus[index].title,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 10,
                                      color: index == indexValue ? context.colors.primary : context.colors.secondary.withOpacity(0.3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          _selectedPageIndex.value = index;
                          _pageController.jumpToPage(index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
