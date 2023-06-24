import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_coffee_app/helpers/size_extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: const BoxDecoration(
          color: Color(0xffD3A271),
          image: DecorationImage(
            image: AssetImage('assets/images/img_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 57),
              child: Image.asset(
                'assets/images/logo_coffee.png',
                height: context.percentWidth(0.92),
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: context.percentHeight(0.14)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 13,
                      right: 25,
                      bottom: 13,
                    ),
                    backgroundColor: const Color(0xff482615),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Order Now',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
