import 'package:flutter/material.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';

class CustomButtonAdd extends StatefulWidget {
  const CustomButtonAdd({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  State<CustomButtonAdd> createState() => _CustomButtonAddState();
}

class _CustomButtonAddState extends State<CustomButtonAdd> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colors.primary,
        ),
        child: Icon(
          Icons.add,
          color: context.colors.white,
        ),
      ),
    );
  }
}
